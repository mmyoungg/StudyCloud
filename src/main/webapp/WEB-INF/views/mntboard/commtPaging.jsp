<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mnt_wrap3">
<h5>댓글<span class="reply_cnt"> 3</span></h5>
<hr>
<br>

<!-- 댓글작성 -->
<form class="mb-3" name="insertCommt" id="insertCommt" method="post">
<input type="hidden" name="mntBoardNo" value="${param.mntboardNo }">
	
	
	<label for="memberNick" id="memberNick" >&nbsp;${mntViewBoard.MEMBER_NICK }</label>
	<div>
		<textarea class="col-auto form-control" id="reviewContents" name="commtContent"
				  placeholder="댓글을 입력해주세요"></textarea>
	</div>
 <!-- Post 구현해야됨 -->
	 <button class="btn btn-primary" id="btnReview">등록</button>
	
</form>	
</div>					
<!-- 댓글 끝 -->

<c:forEach items="${CommtList }" var="commt">
	<ul class="reply_content_ul">
	<!-- 첫번째 댓글 -->
	<li>
		<div class="comment_wrap">
		<div class="reply_top">
			<span class="id_span">☁️ ${commt.MEMBER_NICK  } ☁️</span>
			<span class="date_span"><fmt:formatDate pattern="yyyy-MM-ddㅤHH:mm" value="${commt.COMMT_DATE }"/></span>
				<a class="updateCmbtn">수정</a><a class="deleteCmbtn">삭제</a>
					</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt">
		${commt.COMMT_CONTENT  }
			</div>
			</div>
		</div>
	</li>
	</ul>
</c:forEach>	


<nav aria-label="Page navigation example">
	  <ul class="pagination">

	<%-- 첫 페이지로 이동 --%>
	 <c:if test="${commtPaging.curPage ne 1 }">
		<li class="page-item">
      <a class="page-link" onclick="cntMove(1)" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${commtPaging.startPage ne 1 }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${commtPaging.startPage - commtPaging.pageCount })">1</a></li>
	</c:when>
	<%--  <c:when test="${Commtpaging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>  --%>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	 <c:if test="${commtPaging.curPage > 1 }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${commtPaging.curPage - 1 })">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${commtPaging.startPage }" end="${commtPaging.endPage }" var="i">
	<c:if test="${commtPaging.curPage eq i }">
		<li class="active page-item"><a class="page-link" onclick="cntMove(${i })">${i }</a></li>
	</c:if>
	<c:if test="${commtPaging.curPage ne i }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${i })">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	 <c:if test="${commtPaging.curPage < commtPaging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${Commtpaging.curPage + 1 })">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${commtPaging.endPage ne commtPaging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${commtPaging.startPage + commtPaging.pageCount })">&raquo;</a></li>
	</c:when>
	 <%-- <c:when test="${Commtpaging.endPage eq Commtpaging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when> --%>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${commtPaging.curPage ne commtPaging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="cntMove(${commtPaging.totalPage })" aria-label="Next">
        <span aria-hidden="true">&raquo;</span></a></li>	
	</c:if>
	
  </ul>
</nav>

                      