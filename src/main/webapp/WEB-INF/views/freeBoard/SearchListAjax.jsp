<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script type="text/javascript"> 

/* function pagingAjax(pageNo, checked, keyword) {
	var page_no = pageNo;
	console.log(page_no);
	
	$.ajax({
		type:"GET",
		url: "/freeBoard/cmtListAjax",
		dataType: "html", 
		data : {curPage: page_no, fBoardNo: BoardNo},
		success : function(r){
		console.log('[댓글 페이징] AJAX 요청 완료');
			$("#fBoardCmtList").html(r);
		} 
	})
}
 */

</script>
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
		<li class="page-item"><a class="page-link" onclick="pagingSearchAjax(1, '${checked}', '${keyword }')">처음으로</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a class="page-link" onclick="pagingSearchAjax(${paging.startPage - paging.pageCount }, '${checked}', '${keyword }')">&laquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a class="page-link">&laquo;</a></li>
	</c:when> --%>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a class="page-link" onclick="pagingSearchAjax(${paging.curPage - 1 }, '${checked}', '${keyword }')">&lt;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active page-item"><a class="page-link" onclick="pagingSearchAjax(${i }, '${checked}', '${keyword }')">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a class="page-link" onclick="pagingSearchAjax(${i }, '${checked}', '${keyword }')">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a class="page-link" onclick="pagingSearchAjax(${paging.curPage + 1 }, '${checked}', '${keyword }')">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a class="page-link" onclick="pagingSearchAjax(${paging.startPage + paging.pageCount }, '${checked}', '${keyword }')">&raquo;</a></li>
	</c:when>
<%-- 	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a class="page-link">&raquo;</a></li>
	</c:when> --%>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a class="page-link" onclick="pagingSearchAjax(${paging.totalPage }, '${checked}', '${keyword }')">끝으로</a></li>	
	</c:if>
	
	</ul>
</div>
</nav>