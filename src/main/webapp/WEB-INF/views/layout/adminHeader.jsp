<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>


<style type="text/css">

* {
	margin: 0;
}

header {
	padding: 10px 0px;
}

.navbar {
	background-color: #fff;
	padding-bottom: 20px;
}

.navbar-brand {
	margin: 0;
	padding-left: 12px;
	padding-right: 12px;
	height: 70px;
}

.nav-item {
	height: 60px;
}

#sidebarMenu {
/*     background-color: #f8f9fa; */
     box-shadow: inset -1px 0 0 rgb(0 0 0 / 10%);
}

.btnLogin {
    padding: 5px 16px;
    height: 35px;
    width: 120px;
    border: none;
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
    display:flex;
    justify-content:center;
    align-items:center;
}

.btnLogin:hover {
    background-color:#000;
}

.btnLogin:focus{
    box-shadow:none;
    outline:none;
}

</style>


</head>
<body>



<!-- 관리자 헤더 네비게이션바 -->
<header>
	<div class="container">
		<div class="navbar sticky-top">
	   		<img class="navbar-brand" href="#" src="/resources/img/Logo.png" />
	       	<div class="navbar-nav">
	           	<div class="nav-item">
	               	<a class="nav-link btnLogin" href="#">Login</a>
	           	</div>
	       	</div>
	       	<!-- 토글 버튼 -->
	       	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	    </div>
	</div>
</header>


</body>
</html>