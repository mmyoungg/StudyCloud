<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘티찾기</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/mntBoardList.css"> 


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/mntboard/write"
	})
	
	/* $("#btnUpdate").click(function() {
		location.href = "/mtboard/update?boardNo=${viewBoard.boardNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/mtboard/delete?boardNo=${viewBoard.boardNo }"
	}) */
})


</script>



<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<p class="mentoring_txt">
				☁️ 무료 지식 공유에 참여해보세요 ☁️
			</p>
	</div>
</div>

<main class="all_content">

<div class="content-container">

	<!-- 왼쪽 정렬 항목-->
	<div class="left_sort">
  
    <div class="field">
    <table class="field_tb">   
    <tr>
    <th>☁️ 분야 ☁️</th>
    </tr>
     
    <tr> 
  	<td>
  	<input type="checkbox" id="field_01" value="1">
  	<label>개발 · 프로그래밍</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_02" value="2">
  	<label>어학 · 외국어</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_03" value="3">
  	<label>직무 · 마케팅</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_04" value="4">
  	<label>커리어</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_05" value="5">
  	<label>기타</label>
	</td>
	</tr>
	</table>
	</div>
	
	
	<a href="/mntboard/list" class="field_reset">
	<i class="fa-solid fa-arrow-rotate-right"></i>
	초기화 
	</a>
	</div> <!-- 왼쪽정렬 항목 끝 -->
	
	


<div class="right_sort">
<div class="container_rdo">

<div class="radio_bt">	
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">최신순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
  <label class="form-check-label" for="flexRadioDefault2">댓글 많은 순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
  <label class="form-check-label" for="flexRadioDefault2">좋아요순</label>
</div>
</div>

  

<table class="table">
<thead>
	<tr>
		<th scope="col" style="width: 7%;">No.</th>
		<th scope="col" style="width: 40%;">제목</th>
		<th scope="col" style="width: 15%;">작성자</th>
		<th scope="col" style="width: 10%;">조회수</th>
		<th scope="col" style="width: 10%;">🤍</th>
		<th scope="col" style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${mntBoardlist }" var="mntboard">
  <tr>
      <td scope="row" class="no">${mntboard.MNTBOARD_NO }</td>
      <td>
      <a id="boardno" href="/mntboard/view?mntboardNo=${mntboard.MNTBOARD_NO }">${mntboard.MNTBOARD_TITLE }</a>
      <c:if test="${mntboard.MNTBOARD_CMCNT  ne 0}">
		<small><b>[&nbsp;<c:out value="${mntboard.MNTBOARD_CMCNT}"/>&nbsp;]</b></small>
	 </c:if>
      </td>
      <td>${mntboard.MEMBER_NICK  }</td>
      <td>${mntboard.MNTBOARD_HIT }</td>
      <td>42</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mntboard.MNTBOARD_DATE }"/>
 </tr>
</c:forEach>
 
 <%-- <tr>
      <th scope="row" class="no">2</th>
      <td>
      면접 조언 부탁드려요
      <c:if test="${mtboarddto.reply_count ne 0}">
		<small><b>[&nbsp;<c:out value="${mtboarddto.reply_count}"/>&nbsp;]</b></small>
	 </c:if>
      </td>
      <td>백수</td>
      <td>10</td>
      <td>8</td>
      <td>2022-11-21</td>
    </tr>
	
    
  <tr>
      <th scope="row" class="no">3</th>
      <td>
      직무에 대해서 설명해주실분
      <c:if test="${mtboarddto.reply_count ne 0}">
		<small><b>[&nbsp;<c:out value="${mtboarddto.reply_count}"/>&nbsp;]</b></small>
	 </c:if>
	 </td>
      <td>언어달인</td>
      <td>7</td>
      <td>6</td>
      <td>2022-11-22</td>
  </tr> --%>
    
</tbody>
</table>

<!-- 회원만 보이게 -->
<div><button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button></div>
<!-- <button id="btnUpdate" class="btn btn-primary pull-right">수정</button>
<button id="btnDelete" class="btn btn-primary pull-right">삭제</button> -->

<br><br><br><br><br><br><br><br><br>

</div><!-- .글목록container -->
</div> <!-- right -->

<c:import url="/WEB-INF/views/mntboard/paging.jsp" />

	<!-- <!-- 검색바 -->
  <div class="container-fluid">
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search"
      onfocus="this.placeholder=''" onblur="this.placeholder='검색어를 입력하세요'">
      <button class="btn" type="submit">☁️</button>
    </form>
  </div>

</div> <!-- container --> 



</main>
</main>
<c:import url="../layout/footer.jsp" />  
</body>
</html>