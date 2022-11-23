<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">

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
	width: 950px;
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

.sboard-list {
	width: 100%;
	height: 10%;
}

.study {
	width: 100%;
	height: 50%;
}

.study-info {
	border: 1px solid #aacde5;
	border-radius: .7rem;
	height: 100px;
	padding-top: 1%;
	box-shadow: 2px 2px light grey;
	margin-top: 3%;
	
}

.badge {
/* 	margin: 20px; */
	margin-left: 31px;
	margin-right: 10px;
	margin-bottom: 30px;
	margin-top: 30px;
	background-color: #3f92b7;
/* 	.bg-{color} : #e3eff9; */
}


.title-and-detail {
	float: right;
	margin-right: 65%;
/* 	margin-left: 10%; */
	padding-top: 1%;
/* 	margin-top: 10px; */
}

:root {
	--bs-border-radius: 0.7rem;
	--bs-body-color: #60392a;
	--bs-body-bg-rgb: 250,250,250;
}

/* img, svg { */
/* /*     vertical-align: text-right; */ */
/*     float: right; */
/* } */

.nav-option {
	width: 100px;
}

.icon {
	float: right;
}

.form-check {
	float: right;
/* 	float: right; */
/* 	margin: 20px; */
	padding-right: 30px;
	padding-top: 7px;
}

.pagination {
	justify-content: center;
	--bs-pagination-color:  #6cc4dc;
}

</style>

</head>
<body>

<div class="whole">

	<div class="header-box">
		다양한 스터디를 만들고 참여해보세요!<br>
		Publish And Join the Flash-Gathering!
	</div>
	
	<div class="button-menu">
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">스터디 개설하기</button>
		</span>
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">스터디 찾아보기</button>
		</span>
	</div>
	
	<br><br>
	

		<div class="container">
			<div class="nav-option">
				<!-- 인원 선택 드롭박스 -->
				<div class="dropdown" style="float: left;">
  					<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 30%; background-color: white; color: #3f92b7; border-color: #3f92b7;">
    					인원 선택
 					</button>
  					<ul class="dropdown-menu">
    					<li><a class="dropdown-item" href="#">1명</a></li>
    					<li><a class="dropdown-item" href="#">2명</a></li>
    					<li><a class="dropdown-item" href="#">3~4명</a></li>
    					<li><a class="dropdown-item" href="#">5명 이상</a></li>
  					</ul>
				</div>
				
				<div class="nav-option-sort">
				<!-- 정렬 -->
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
	  				<label class="form-check-label" for="flexRadioDefault1">내 주변 스터디 찾기</label>
				</div>
				
				</div>
		
			</div>
		
			<br><br>
		
		
			<ul class="sboard-list">
				<li class="study" style="list-style-type:none;">
					<div class="shadow p-3 mb-5 bg-body rounded">
						<span class="badge">모집중</span>
						<span class="title-and-detail">
							<h4 class="study-title">Spring 스터디</h4>
							<h6 class="study-detail">spring 스터디 모집합니다.</h6>
						</span>
					</div>
					
					<div class="shadow p-3 mb-5 bg-body rounded">
						<span class="badge">모집중</span>
						<span class="title-and-detail">
							<h4 class="study-title">Spring 스터디</h4>
							<h6 class="study-detail">spring 스터디 모집합니다.</h6>
<!-- 								<div class="icon"> -->
<!-- 									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> -->
<!--   									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> -->
<!-- 									</svg> -->
<!-- 								</div> -->
						</span>
					</div>
					
					<div class="shadow p-3 mb-5 bg-body rounded">
						<span class="badge">모집중</span>
						<span class="title-and-detail">
							<h4 class="study-title">Spring 스터디</h4>
							<h6 class="study-detail">spring 스터디 모집합니다.</h6>
							
						</span>
					</div>
					
					<div class="shadow p-3 mb-5 bg-body rounded">
						<span class="badge">모집중</span>
						<span class="title-and-detail">
							<h4 class="study-title">Spring 스터디</h4>
							<h6 class="study-detail">spring 스터디 모집합니다.</h6>
						</span>
					</div>
					
					<div class="shadow p-3 mb-5 bg-body rounded">
						<span class="badge">모집중</span>
						<span class="title-and-detail">
							<h4 class="study-title">Spring 스터디</h4>
							<h6 class="study-detail">spring 스터디 모집합니다.</h6>
						</span>
					</div>
				</li>
			</ul>
			
			<c:import url="/WEB-INF/views/mboard/paging.jsp" />
		</div>

		
		<br><br><br><br>

</div>

</body>
</html>