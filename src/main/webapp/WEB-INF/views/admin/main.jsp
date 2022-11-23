<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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


.bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}


header {
    border: 1px solid red;
}

#sidebarMenu {
    /* width: 200px; */
    background-color: #f8f9fa;
    box-shadow: inset -1px 0 0 rgb(0 0 0 / 10%);
}

#sidebarMenu ul>li>a { /* 사이드바 메뉴 리스트 폰트 */
    font-size: 14px;
    font-weight: bold;
    color: rgb(0 0 0 / 55%);
}

#sidebarMenu ul>li>a:hover { /* 사이드바 메뉴 hover */
    color: #6cc4dc;
}

.menuName {
    font-size: 20px;
    display: flex;
    align-items: center;
    padding: 16px 0 16px 0;
    border-bottom: 1px solid #dee2e6;
}

.navbar-brand {
    font-weight: 700;
    font-size: 22px;
    padding: 5px 16px;
}

.btnLogin {
    padding: 5px 16px;
}

.todayApply {
    padding: 0 30px 0 30px;
    margin-top: 20px;
}

.mainTitle {
    font-weight: bold;
}

.card {
    border: 2px solid #6cc4dc;
    border-radius: 15px;
}

.sndrow {
    padding: 0 30px 0 30px;
    margin-top: 40px;
}

.table-group-divider {
    border-top-color: #6cc4dc;
}


</style>


</head>
<body>

<div class="container"> <!-- 헤더 사이즈 [보류] -->
   <header class="navbar sticky-top">
       <a class="navbar-brand col-md-3 col-lg-2 me-0" href="#">StudyCloud</a>
       <div class="navbar-nav">
           <div class="nav-item">
               <a class="nav-link btnLogin" href="#">Login</a>
           </div>
       </div>
       <!-- 토글 버튼 -->
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </header>
</div>

<div class="container"> <!-- 컨텐트 사이즈 [보류] -->
<!-- <div class="container-fluid"> -->
   <div class="row">
       <nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block collapse">
           <div class="position-sticky pt-3">
               <ul class="nav flex-column"> <!-- 사이드 바 메뉴 리스트 -->
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       홈
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       멘토등록
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       스터디등록
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       스터디룸등록
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       QnA관리
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       예약관리
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       회원관리
                       </a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">
                       정보수정
                       </a>
                   </li>
               </ul>
           </div>
       </nav>

       <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
           <!-- <div class="justify-content-between flex-wrap flex-md-nowrap">
               <p class="menuName">Dashboard</p>
           </div> -->

           <div class="row todayApply">
               <div class="col-sm-6">
                   <p class="mainTitle">멘토 신청</p>
                   <div class="card">
                       <div class="card-body">
                           <h5 class="card-title">Special title treatment</h5>
                           <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                       </div>
                   </div>
               </div>
               <div class="col-sm-6">
                   <p class="mainTitle">스터디 신청</p>
                   <div class="card">
                       <div class="card-body">
                           <h5 class="card-title">Special title treatment</h5>
                           <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                       </div>
                   </div>
               </div>
           </div>


           <div class="row sndrow">
               <div class="col-sm-8">
                   <p class="mainTitle">QnA 답변</p>
                   <table class="table qnaTable">
                       <thead>
                           <tr>
                               <th scope="col">#</th>
                               <th scope="col">제목</th>
                               <th scope="col">작성자</th>
                               <!-- <th scope="col">Handle</th> -->
                           </tr>
                       </thead>
                       <tbody class="table-group-divider">
                           <tr>
                               <th scope="row">1</th>

                               <td>Mark</td>
                               <td>Otto</td>
                               <!-- <td>@mdo</td> -->
                           </tr>
                           <tr>
                               <th scope="row">2</th>

                               <td>Jacob</td>
                               <td>Thornton</td>
                               <!-- <td>@fat</td> -->
                           </tr>
                           <tr>
                               <th scope="row">3</th>

                               <td colspan="2">Larry the Bird</td>
                               <!-- <td>@twitter</td> -->
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-2">
                    <p class="mainTitle">달력공간</p>
                    <div class="title">
                    </div>
                </div>
            </div>
        </main>
    </div>
</div><!-- container -->
</body>
</html>