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
*{
    margin: 0;padding: 0
}
.body{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}
.btnLogin{
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
/* font */
.navbar-brand{
	font-weight: 700;
	font-size: 22px;
}
.cloud{
	color:  #6cc4dc;
} 
.buttonitems{
	font-size: 12px;
	color: #6cc4dc;
	font-weight: 500;
}
</style>

</head>
<body>

<div class="wrap">

<header>
    <div class="container mt-3">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <!-- studyCloud 이미지 -->
                <!-- <img src="https://ifh.cc/g/5poc1s.png" height="50px"/> -->
                <!-- <img src="https://ifh.cc/g/4Zh25b.png" height="50px"/> -->
                <a class="navbar-brand name" href="#">Study<span class="cloud">Cloud</span></a>
                
                <!-- 토글 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <!-- 메뉴바 -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <!-- <li class="nav-item"> <a class="nav-link active" aria-current="page" href="#"><span class="home">Home</span></a> </li> -->
                        <li class="nav-item"> <a class="nav-link" href="#">멘토 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" href="#">멘티 찾기</a> </li>
                        <li class="nav-item"> <a class="nav-link" href="#">스터디 찾기</a> </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown" href="#" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                            </ul>
                        </li>

                        <li class="nav-item"> <a class="nav-link" href="#">스터디 공간 대여</a> </li>
                    </ul>
                    <div class="btn btn-dark btnLogin">Login</div>
                </div>
            </div>
        </nav>
    </div>
</header><!-- header end -->