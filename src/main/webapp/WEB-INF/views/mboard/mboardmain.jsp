<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">

.whole {
/* 	margin: 0 auto; */
/* 	width: 1100px; */
}

.header-box {
	color: white;
	height: 200%;
	background-color: #aacde5;
	text-align: center;
	padding: 60px;
/* 	margin: 20%; */
}

.container{
	margin: 0 auto;
	width: 1000px;
}

.nav-m {
	padding-bottom: 5px;
}

.button-menu {
	margin: 0 auto;
	width: 1100px;
	text-align: center;
	padding: 30px;
}

.button-op {
	padding: 40px;
	color: #6cc4dc;
	--bs-btn-border-radius: .5rem;
}

.btn {
	background-color:  #6cc4dc;
}

/* .table { */
/* 	border-top: 2px; */
/* 	background-color: #aacde5; */
/* } */

table {
	table-layout: fixed;
}

th {
	color: #ffffff;
	text-align: center;
}

.table-head {
 	background-color: #aacde5;
}

.table-primary {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}

.d-flex {
	float: right;
	padding-bottom: 7px;
}

.form-control {
	width: 300px;
}

.form-check {
	float: left;
/* 	margin: 20px; */
	padding-right: 30px;
}

.pagination {
	justify-content: center;
	--bs-pagination-color:  #6cc4dc;
}

hr {
	margin: 0 auto;
	width: 1100px;
}

.btn-check {
	color: #6cc4dc
}

.btn-group {
	padding-top: 5px;
	float: right;
}




</style>

</head>
<body>

<div class="whole">

	<div class="header-box">
		실시간 번개 스터디에 참여해보세요!⚡<br>
		Join the Flash-Gathering!
	</div>
	
	<div class="button-menu">
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">자유게시판💭</button>
		</span>
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">번개게시판⚡</button>
		</span>
	</div>
	
	<br><br><br><br>
	<div class="container">
		<div class="nav-m">
			<div class="form-check">
	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
	  			<label class="form-check-label" for="flexRadioDefault1">최신순</label>
			</div>
			
			<div class="form-check">
	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
	  			<label class="form-check-label" for="flexRadioDefault1">인기순</label>
			</div>
			
			<div class="form-check">
	  			<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
	  			<label class="form-check-label" for="flexRadioDefault1">댓글많은순</label>
			</div>
		
			<form class="d-flex" role="search">
	        	<input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요" aria-label="Search">
	        	<button class="btn btn-outline-light" type="submit">Search</button>
	     	</form>
	     	
     	</div>
     	
		<table class="table">
			<thead class="table-head">
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list }" var="meetingboard">
					<tr>
						<td>${meetingboard.mboardNo }</td>
						<td>${meetingboard.mboardtitle }</td>
						<td>${meetingboard.membernick }</td>
						<td>${meetingboard.mboardhit }</td>
						<td><fmt:formatDate value="${meetingboard.mboarddate }" pattern="yy-MM-dd HH:mm:ss"/></td>
				</c:forEach>
			</tbody>
		</table>
		
		<br><br><br><br><br><br>
		<hr>
		
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="on">
  			<label class="btn btn-outline-light" for="btnradio1">등록하기</label>

  			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="on">
  			<label class="btn btn-outline-light" for="btnradio2">수정하기</label>

  			<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="on">
  			<label class="btn btn-outline-light" for="btnradio3">삭제하기</label>
		</div>
		
		<br><br><br><br><br><br>
		<c:import url="/WEB-INF/views/mboard/paging.jsp" />


	</div><!-- container 끝 -->
</div><!-- whole 끝 -->





</body>
</html>