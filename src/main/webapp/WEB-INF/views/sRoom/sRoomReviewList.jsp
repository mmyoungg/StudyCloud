<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
    
<style type="text/css">   
.secretView { background-color: #e3eff9; font-weight: bold; text-align: center; height: 75px; line-height: 75px; }	
.rev_box { display: none; }
#RevhideBtn { display: none; }
.revBtnBox { font-size: 20px; text-align: center; width: 300px; background-color: #aacde5; 
			 height: 50px; line-height: 50px; margin: 0 auto; font-weight: bold;}
.revBtnBox a { text-decoration: none; color: white; }		
#myform2 fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform2 fieldset {
    text-align: left;
}
#myform2 input[type=radio]{
    display: none;
}
#myform2 label{
    font-size: 3em;
    color: #bdb4765c;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform2 label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform2 label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform2 input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	moreAndHideR()
})

function moreAndHideR() {
	// 펼치기
	$(".rev_box").slice(0, 2).show();
	$("#RevmoreBtn").click(function(e) {
		e.preventDefault();
		$(".rev_box:hidden").slice(0, 2).slideDown();
		if($(".rev_box:hidden").length == 0){
			$("#RevmoreBtn").hide();
			$("#RevhideBtn").show();
			
		}
	})
	
	// 접기
	$("#RevhideBtn").on("click", function(e) {
		e.preventDefault();
		var Rlength = $(".rev_box:hidden").length - 2;
		console.log($(".rev_box").length)
		$(".rev_box").slice(2).slideUp();
		$("#RevhideBtn").hide();
		$("#RevmoreBtn").show();
	})
	
} 	

function closeModal() {
	$(".modal-custom").css("display", "none");
}

// 리뷰 수정 요청
function revUpdate(revNo, sno) {
	var updateRevScore = $(":input:radio[name='reviewStar']:checked").val();
	var updateRevContent = $("#sRoomReviewContent").val();	
	
	if( updateRevContent == "" ) {
		$("#updateRevContent").attr("value", updateRevContent);
	}
		
	console.log("[리뷰수정] 수정할 리뷰 번호 : " + revNo);
	console.log("[리뷰수정] 수정할 리뷰 점수 : " + updateRevScore);
	console.log("[리뷰수정] 리뷰 내용 : " + updateRevContent);
	console.log("[리뷰수정] 리뷰 스터디룸 번호 : " + sno);
	
	 $.ajax({
		url: "/sRoom/sRoomRevUpdate",
		type: "POST",
		data: { "sRoomReviewNo" : revNo, "sRoomReviewScore" : updateRevScore, "sRoomReviewContent" : updateRevContent, "sRoomNo": sno },
		success : function(r) {
			console.log("[리뷰 수정] AJAX 요청완료");
			$(":input:radio[name='reviewStar']").prop("checked", false);
			$("#sRoomReviewContent").val('');		
			
			$(".revfooter").html("");	
			var revArea="";
			revArea += '<button type="button" class="close-modal" onclick="closeModal()" id="close">취소</button>';
			revArea += '<button type="button" onclick="revInsert()" class="button">작성하기</button>';
			
			$(".revfooter").html(revArea);
			$(".modal-custom").css("display", "none");
			$("#sRoomRevArea").html(r);
		}
	}) // ajax 
	
} // update

// 수정버튼 눌렀을때 뜨는 팝업
function updateRevModalPopUp(revNo, revScore, revContent, sno) {
	console.log("리뷰 수정모달 클릭")
	console.log("리뷰 번호 : " + revNo);
	console.log("리뷰 스코어 : " + revScore);
	console.log("리뷰 내용 : " + revContent);
	console.log("리뷰 스터디룸 번호 : " + sno);
	
	/* $(":input:radio[name='reviewStar']").prop("checked", false); */
	$("#sRoomReviewContent").text(revContent);
	//$("button").remove("#sRooomReviewBtn")
	$(".revfooter").html("");	
	
	var revArea="";
	revArea += '<button type="button" class="close-modal" onclick="closeModal()" id="close">취소</button>';
	revArea += '<button type="button" onclick="revUpdate(' + revNo + ',' + sno + ')" class="button">수정하기</button>';
	
	$(".revfooter").html(revArea);
	//$("#sRooomReviewBtn").attr("onclick", "revUpdate(" + revNo + "," + sno + ")")
	$(".rev").css("display", "block");  
}

// 리뷰 삭제
function deletesRoomRev(reno, srno) {
	var reno = reno;
	console.log("[리뷰삭제] 삭제할 리뷰번호 : " + reno);
	
	swal({
		title: "작성하신 리뷰를 삭제 하시겠습니까?",
		showCancleButton: true,
		confirmButtonColor: "#6cc4dc",
		buttons: ["아니요", "예"]
	}).then(function(isConfirm) {
		if(isConfirm) {
			$.ajax({
				url: "/sRoom/sRoomRevDelete",
				type: "POST",
				data: { "sRoomReviewNo" : reno, "sRoomNo" : srno},
				success : function(r) {
					console.log("[리뷰 삭제] AJAX 요청완료");
					$("#sRoomRevArea").html(r);
		 		 
				}
			}) // ajax 
		} // isConfirm
	})
	
}


</script>

<div class="infoBox">
	<h6 class="review_intro"> 후기 개수 
		<strong class="review_point"><em>${reviewInfo.CNT }</em>개</strong>
		<span class="dot"></span> 
		<span>평균 별점
			<strong class="review_point">
				<em>${reviewInfo.AVG }</em>
			</strong>
		</span>
	</h6>
	<hr>
	<ul class="Qna_list">
		<li class="qna_hr"><c:choose>
				<c:when test="${not empty reviewList }">
					<c:forEach items="${reviewList }" var="reviewList">
						<div class="rev_box" id="revCont${reviewList.SROOMREVIEW_NO }">
							<span>
								<img src="/upload/${reviewList.FILEUPLOAD_STOR }" class="pimg" onerror="this.src='https://ifh.cc/g/BQ84hH.jpg'">
							</span>
							<p class="write_name">${reviewList.MEMBER_NICK }</p>

							<c:forEach begin="0" end="4" var="i">
								<c:choose>
									<c:when test="${reviewList.SROOMREVIEW_SCORE > i }">
										⭐
									</c:when>
									<c:otherwise>
										<i class="far fa-star"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<p class="qna_cont">${reviewList.SROOMREVIEW_CONTENT }</p>
							<p class="write_date">
								<fmt:formatDate value="${reviewList.SROOMREVIEW_DATE }" pattern="yy-MM-dd HH:mm:ss" />
							</p>

							<c:if test="${member_no eq reviewList.MEMBER_NO}">
								<button class="miniBtn" type="button"
									onclick="updateRevModalPopUp(${reviewList.SROOMREVIEW_NO }, '${reviewList.SROOMREVIEW_SCORE}', '${reviewList.SROOMREVIEW_CONTENT }', ${reviewList.SROOM_NO } )">수정</button>
								<button class="miniBtn" type="button"
									onclick="deletesRoomRev(${reviewList.SROOMREVIEW_NO }, ${reviewList.SROOM_NO })">삭제</button>
							</c:if>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="qna_box_empty">🔎 등록된 리뷰가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</li>
	</ul>
</div>
<div class="revBtnBox">
	<a href="#" id="RevmoreBtn">더보기</a> <a href="#" id="RevhideBtn" style="margin-bottom: 20px;">접기</a>
</div>
