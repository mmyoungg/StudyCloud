<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script type="text/javascript"> 

function cmtUpdate(cmtNo, content, nick) {
	console.log(cmtNo);
	console.log(content);
	console.log(nick);
	
	$('#cont'+cmtNo).html("");
	
	var area = "";
	
	area += '<strong class="cmt_writer">' + nick + '</strong>';
	area += '<div class="cmt_cont_box">';
	area += '<textarea class="form-control" id="fBoardCmt" rows="2" name="content_' + cmtNo + '">' + content + '</textarea>';
	area += '</div>';
	area += '<div class="CmtBtnBox">'
	area += '<a class="CmtBtn" id="updateCmtBtn" onclick="updateCmt(' + cmtNo + ')">수정</a>';
	area += '<a class="CmtBtn" id="deleteCmtBtn" onclick="pagingAjax()">취소</a>';
	area += '</div>'
	$('#cont'+cmtNo).html(area);
}

function updateCmt(cmtNo) {
	var updateContent =  $('[name=content_' + cmtNo + ']').val();
	
	console.log("[댓글 업데이트] 댓글번호 : " + cmtNo);
	console.log("[댓글 업데이트] 수정된 내용 : " + updateContent);
	
	$.ajax({
		url: "/freeBoard/cmtUpdate",
		type: "POST",
		data: { "commtNo" : cmtNo, "commtContent" : updateContent },
		success : function() {
			console.log("[댓글 수정] AJAX 요청완료");
			pagingAjax();
			
		}
	})
}

function cmtDelete(cmtNo) {
	console.log("[댓글 삭제] 댓글번호 : " + cmtNo);
	
	swal({
		title: "삭제 하시겠습니까?",
		showCancleButton: true,
		confirmButtonColor: "#6cc4dc",
		buttons: ["아니요", "예"]
	}).then(function(isConfirm) {
		if(isConfirm) {
			$.ajax({
				url: "/freeBoard/cmtDelete",
				type: "POST",
				data: { "commtNo" : cmtNo },
				success : function() {
					console.log("[댓글 삭제] AJAX 요청완료");
					pagingAjax();
				}
			}) // ajax
		}
	}) // swal
}	
		
	




</script>
<div class="cmt_header">
댓글(${fBaordCmtCount })
</div>
 <c:forEach items="${fBaordCmt }" var="cmtList">
<div class="cmt_box" id="cont${cmtList.COMMT_NO }">
	<strong class="cmt_writer">${cmtList.MEMBER_NICK }</strong>
	<div class="cmt_cont_box">
		<div class="cmt_cont">${cmtList.COMMT_CONTENT }</div>
	</div>
	<p class="cmt_date"><fmt:formatDate value="${cmtList.COMMT_DATE }" pattern="yy-MM-dd HH:mm:ss"/></p>
	<a class="miniBtn" onclick="cmtUpdate(${cmtList.COMMT_NO}, '${cmtList.COMMT_CONTENT }', '${cmtList.MEMBER_NICK }')">수정</a>
	<a class="miniBtn" onclick="cmtDelete(${cmtList.COMMT_NO})">삭제</a>
</div>
</c:forEach>


<nav aria-label="Page navigation example">
<div class="text-center">
	<ul class="pagination justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" onclick="pagingAjax(1, ${fBoardView.FBOARD_NO})">처음으로</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a class="page-link" onclick="pagingAjax(${paging.startPage - paging.pageCount },${fBoardView.FBOARD_NO})">&laquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a class="page-link">&laquo;</a></li>
	</c:when> --%>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a class="page-link" onclick="pagingAjax(${paging.curPage - 1 },${fBoardView.FBOARD_NO})">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active page-item"><a class="page-link" onclick="pagingAjax(${i },${fBoardView.FBOARD_NO})">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a class="page-link" onclick="pagingAjax(${i })">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a class="page-link" onclick="pagingAjax(${paging.curPage + 1 },${fBoardView.FBOARD_NO})">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a class="page-link" onclick="pagingAjax(${paging.startPage + paging.pageCount },${fBoardView.FBOARD_NO})">&raquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a class="page-link">&raquo;</a></li>
	</c:when> --%>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pagingAjax(${paging.totalPage },${fBoardView.FBOARD_NO})">끝으로</a></li>	
	</c:if>
	
	</ul>
</div>
</nav>

 