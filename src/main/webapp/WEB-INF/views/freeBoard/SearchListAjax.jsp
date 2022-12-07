<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<table id="contentlist" class="table">
	<thead>
	<tr>
		<th scope="col">No.</th>
		<th scope="col">카테고리</th>
		<th scope="col">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">조회수</th>
		<th scope="col">등록일</th>
	</tr>
	</thead>

	<tbody>
	    <c:forEach items="${fBoardSearchList }" var="fBoardS">
		<tr>
			<td>${fBoardS.FBOARD_NO }</td>
			<td>${fBoardS.CATEGORY_NAME }</td>
			<td><a href="./view?fBoardNo=${fBoardS.FBOARD_NO }">${fBoardS.FBOARD_TITLE }</a></td>
			<td>${fBoardS.MEMBER_NICK }</td>
			<td>${fBoardS.FBOARD_HIT }</td>
			<td><fmt:formatDate value="${fBoardS.FBOARD_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>




<nav aria-label="Page navigation example">
<div class="text-center">
	<ul class="pagination justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a class="page-link" onclick="pagingAjax(1)">처음으로</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a class="page-link" onclick="pagingAjax(${paging.startPage - paging.pageCount })">&laquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a class="page-link">&laquo;</a></li>
	</c:when> --%>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a class="page-link" onclick="pagingAjax(${paging.curPage - 1 })">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active page-item"><a class="page-link" onclick="pagingAjax(${i })">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a class="page-link" onclick="pagingAjax(${i })">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a class="page-link" onclick="pagingAjax(${paging.curPage + 1 })">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a class="page-link" onclick="pagingAjax(${paging.startPage + paging.pageCount })">&raquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a class="page-link">&raquo;</a></li>
	</c:when> --%>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pagingAjax(${paging.totalPage })">끝으로</a></li>	
	</c:if>
	
	</ul>
</div>
</nav>