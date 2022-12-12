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
</style>
<script type="text/javascript">
$(document).ready(function() {
	moreAndHide()
})

function moreAndHide() {
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
		var length = $(".rev_box:hidden").length - 2;
		console.log($(".rev_box").length)
		$(".rev_box").slice(2, length).slideUp();
		$("#RevhideBtn").hide();
		$("#RevmoreBtn").show();
	})
	
} 	



</script>
    
<div class="infoBox">
	<ul class="Qna_list">
		<li class="qna_hr">
			<c:choose>
				<c:when test="${not empty reviewList }">
					<c:forEach items="${reviewList }" var="reviewList">
						<div class="rev_box" id="qnaCont${reviewList.SROOMREVIEW_NO }">
							<span><img src="/upload/${reviewList.FILEUPLOAD_STOR }" class="pimg" onerror="this.src='https://ifh.cc/g/BQ84hH.jpg'"></span>
							<p class="write_name">${reviewList.MEMBER_NICK }</p>
							<p class="qna_cont" style="font-weight: bold;">[ ${reviewList.SROOMREVIEW_SCORE } ]</p>
							<p class="qna_cont">${reviewList.SROOMREVIEW_CONTENT }</p>
							<p class="write_date"><fmt:formatDate value="${reviewList.SROOMREVIEW_DATE }" pattern="yy-MM-dd HH:mm:ss"/></p>
							
							<c:if test="${member_no eq reveiwList.MEMBER_NO}">
								<button class="miniBtn" type="button" onclick="updateModalPopUp(${reviewList.SROOMREVIEW_NO }, '${reviewList.SROOMREVIEW_SCORE}', '${reviewList.SROOMREVIEW_CONTENT }', ${reviewList.SROOM_NO } )">수정</button>
								<button class="miniBtn" type="button" onclick="deletesRoomQna(${reviewList.SROOMREVIEW_NO }, ${reviewList.SROOM_NO })">삭제</button>
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
	<a href="#" id="RevmoreBtn">더보기</a>
	<a href="#" id="RevhideBtn">접기</a>
</div>