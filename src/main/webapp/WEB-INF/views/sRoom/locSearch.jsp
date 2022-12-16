<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.search_box_empty { text-align: center; height: 350px; line-height: 350px; font-weight: bold; background-color: #e3eff9; 
					font-weight: bold; font-size: 20px; margin: 15px 0 15px 0; }		 
</style> 	
<script type="text/javascript"> 
function locPagingAjax(pageNo, loc) {
	var page_no = pageNo;
	var sRoomLoc = loc;
	console.log(page_no);
	console.log(sRoomLoc);
	
	
	 $.ajax({
		type:"POST",
		url: "/sRoom/locSearch",
		dataType: "html", 
		data: {"curPage" : page_no, "sRoomLoc" : sRoomLoc },
		success : function(r){
			console.log('[검색결과 리스트] AJAX 요청 완료');
			$("#sRoomListContent").html(r);
		} 
	}) 
}
</script>
<c:choose>
	<c:when test="${not empty sRoomLocSearchList }">
		<div class="row row-cols-1 row-cols-md-4 g-4 sRoomList">
			<c:forEach items="${sRoomLocSearchList }" var="locList">
				<div class="col">
					<div class="card">
					<a href="/sRoom/detail?sRoomNo=${locList.SROOM_NO }"> 
						<img src="/upload/${locList.FILEUPLOAD_STOR }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title sRoomTitle">${locList.SROOM_NAME }</h5>
							<table>
								<tr>
									<td class="price">${locList.SROOM_PRICE }</td>
									<td style="font-size: 11px;">원/시간</td>
									<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="fa-solid fa-heart" style="color: #f8bbd0;"></i>&nbsp;${locList.MCNT }&nbsp;&nbsp;
										<i class="fa-solid fa-comment"></i>&nbsp;${locList.RCNT }
									</td>
								</tr>
								<tr>
									<td colspan="2" class="small"><i class="fa-solid fa-user" style="color: #aacde5;"></i>최소 ${locList.SROOM_PEOPLE }명부터</td>
								</tr>
							</table>
						</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<nav aria-label="Page navigation example">
			<div class="text-center">
				<ul class="pagination justify-content-center">
		
					<%-- 첫 페이지로 이동 --%>
					<c:if test="${paging.curPage ne 1 }">
						<li class="page-item"><a class="page-link"
							onclick="locPagingAjax(1, '${sRoomLoc}')">처음으로</a></li>
					</c:if>
		
					<%-- 이전 페이징 리스트로 이동 --%>
					<c:choose>
						<c:when test="${paging.startPage ne 1 }">
							<li><a class="page-link"
								onclick="locPagingAjax(${paging.startPage - paging.pageCount }, '${sRoomLoc}')">&laquo;</a></li>
						</c:when>
					</c:choose>
		
					<%-- 이전 페이지로 가기 --%>
					<c:if test="${paging.curPage > 1 }">
						<li><a class="page-link"
							onclick="locPagingAjax(${paging.curPage - 1 }, '${sRoomLoc}')">&lt;</a></li>
					</c:if>
					
					<%-- 페이징 리스트 --%>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="i">
						<c:if test="${paging.curPage eq i }">
							<li class="active page-item"><a class="page-link"
								onclick="locPagingAjax(${i }, '${sRoomLoc}')">${i }</a></li>
						</c:if>
						<c:if test="${paging.curPage ne i }">
							<li><a class="page-link"
								onclick="locPagingAjax(${i }, '${sRoomLoc}')">${i }</a></li>
						</c:if>
					</c:forEach>
		
					<%-- 다음 페이지로 가기 --%>
					<c:if test="${paging.curPage < paging.totalPage }">
						<li><a class="page-link"
							onclick="locPagingAjax(${paging.curPage + 1 }, '${sRoomLoc}')">&gt;</a></li>
					</c:if>
		
					<%-- 다음 페이징 리스트로 이동 --%>
					<c:choose>
						<c:when test="${paging.endPage ne paging.totalPage }">
							<li><a class="page-link"
								onclick="locPagingAjax(${paging.startPage + paging.pageCount }, '${sRoomLoc}')">&raquo;</a></li>
						</c:when>
					</c:choose>
		
					<%-- 끝 페이지로 이동 --%>
					<c:if test="${paging.curPage ne paging.totalPage }">
						<li class="page-item"><a class="page-link"
							onclick="locPagingAjax(${paging.totalPage }, '${sRoomLoc}')">끝으로</a></li>
					</c:if>
		
				</ul>
			</div>
		</nav>
	</c:when>
	<c:otherwise>
		<div class="search_box_empty">🔎 조회된 리스트가 없습니다.</div>
	</c:otherwise>
</c:choose>