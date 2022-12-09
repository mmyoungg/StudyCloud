<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="row row-cols-1 row-cols-md-4 g-4 sRoomList">
   <c:forEach items="${sRoomList }" var="sRoomList"> 
  <div class="col">
    <div class="card"> <a href="/sRoom/detail?sRoomNo=${sRoomList.SROOM_NO }">
      <img src="/upload/${sRoomList.FILEUPLOAD_STOR }" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title sRoomTitle">${sRoomList.SROOM_NAME }</h5>
        <table>
        	<tr>
        		<td class="price">${sRoomList.SROOM_PRICE }</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;${sRoomList.MCNT }&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;${sRoomList.RCNT }</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 ${sRoomList.SROOM_PEOPLE }명부터</td>
        	</tr>
        	
        </table>
      </div>
   </a> </div>
  </div>
  </c:forEach>
</div>

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



