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
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
    font-family: 'MICEGothic Bold';
}

/* 헤더 메뉴 */
header {
	padding: 10px 0px;
}

.btnLogin{ /* 로그인 버튼 */
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

.btnLogin:hover{
    background-color:#000;
}

.btnLogin:focus{
    box-shadow:none;
    outline:none;
}

.menu {
	padding: 16px;

	font-size: 14px;
	font-weight: bold;
}

.menu:hover {
	color: #6cc4dc;
}

.buttonitems {
	font-size: 14px;
	color: #6cc4dc;
	font-weight: 500;
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
                <img class="navbar-brand name" src="/resources/img/Logo.png" height="70px"/>
                
                <!-- 토글 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <!-- 메뉴바 -->
                <div class="collapse navbar-collapse" id="navbarMenu">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"> <a class="nav-link menu" href="#">멘토 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link menu" href="#">멘티 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link menu" href="#">스터디 찾기</a> </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown menu" href="#" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">자유게시판</a></li>
                                <li><a class="dropdown-item" href="#">번개게시판</a></li>
                            </ul>
                        </li>

                        <li class="nav-item"> <a class="nav-link menu" href="#">스터디 공간 대여</a> </li>
                    </ul>
                    <div class="btn btnLogin">Login</div>
                </div>
            </div>
        </nav>
    </div>
</header><!-- header end -->


</body>
</html>