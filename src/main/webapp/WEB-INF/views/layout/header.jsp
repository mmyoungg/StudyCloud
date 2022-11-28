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

/* 전체 폰트 적용 */
@font-face {
    font-family: 'paybooc';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
    font-family: 'paybooc';
}

/* 헤더 메뉴 */
#logo { /* 로고 이미지 */
	height: 70px;
}

#btnLogin{ /* 로그인 버튼 */
    height: 35px;
    width: 120px;border: none;
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
    display:flex;
    justify-content:center;
    align-items:center;
}

#btnLogin:hover{
    background-color:#000;
}

#btnLogin:focus{
    box-shadow:none;
    outline:none;
}

.nav-item {
	padding: 0 10px;
}

#menu { /* 메뉴바 폰트 */
	font-size: 16px;
	font-weight: bold;
}

#menu-wrap {
	padding-top: 40px; /* 로고랑 위치 정렬 */
	padding-left: 10px;
}

#menu:hover {
	color: #6cc4dc;
}

#btnMenu { /* 로그인/회원가입/마이페이지 */
	font-size: 14px;
	color: #6cc4dc;
/* 	font-weight: 500; */
	padding: 0;
	margin: 0 auto;
}

#btnMenu > .nav-item {
	padding: 0;
}

/* 드롭다운 메뉴 */
.dropdown:hover .dropdown-menu {
    display: flex;
	font-size: 14px;
}

.dropdown-item:hover {
	color: #6cc4dc;
}

</style>


</head>
<body>


<header>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <!-- studyCloud 이미지 -->
                <img class="navbar-brand name" id="logo" src="/resources/img/Logo.png" />
                
                <!-- 토글 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <!-- 메뉴바 -->
                <div class="collapse navbar-collapse" id="menu-wrap">
                    <ul class="navbar-nav me-auto mb-lg-0">
                        <li class="nav-item"> <a class="nav-link" id="menu" href="#">멘토 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="#">멘티 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="#">스터디 찾기</a> </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown menu" href="#" id="navbarDropdown menu" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">자유게시판</a></li>
                                <li><a class="dropdown-item" href="#">번개게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"> <a class="nav-link" id="menu" href="#">스터디 공간 대여</a> </li>
                    </ul>
                    
                    <div>
                    	<ul class="navbar-nav me-auto" id="btnMenu">
                    		<li class="nav-item"><a class="nav-link" href="./login/login">로그인</a></li>
                    		<li class="nav-item"><a class="nav-link" href="./join/join">회원가입</a></li>
                    		<li class="nav-item"><a class="nav-link" href="./mypage/mypageMain">마이페이지</a></li>
                    	</ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header><!-- header end -->


</body>
</html>