<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 테이블 css -->
<link rel="stylesheet" href="${path}/resources/css/admin/mento.css" />

<!-- 게시판 테이블 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- 데이트 피커 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>


<script type="text/javascript">

/* 데이트 피커 */
$(function() {
    $('#start').datepicker();
});

$(function() {
    $('#end').datepicker();
});


/* 수정 버튼 클릭시 예약 정보 페이지 이동 */
$(document).ready(function() {
	$("#btnView").click(function() {
		location.href = "/admin/reserveView"
	})
})

</script>


<style type="text/css">

/* 사이드바 */
#sidebarMenu {
/*     background-color: #f8f9fa; */
     box-shadow: inset -1px 0 0 rgb(0 0 0 / 10%);
}

#sidebarMenu ul>li>a { /* 사이드바 메뉴 리스트 폰트 */
    font-size: 16px;
    font-weight: bold;
    align-items: center;
    color: rgb(0 0 0 / 55%);
}

#sidebarMenu ul>li>a:hover { /* 사이드바 메뉴 hover */
    color: #6cc4dc;
}

.menuName {
    font-size: 20px;
    font-weight: bold;
    display: flex;
    align-items: center;
    padding: 16px 0 16px 0;
    border-bottom: 1px solid #dee2e6;
}

.btnLogin {
    padding: 5px 16px;
}

/* 메인 */
.wrap {
	padding: 0 30px;
}

/* 필터 검색 부분 */
.card {
    border: 2px solid #6cc4dc;
    border-radius: 15px;
}

/* 데이트 피커 */
.date > input {
	max-width: 200px;
}

#search {
	width: 55px;
	height: 50px;
	background-color: #6cc4de;
	border: none;
	color: #fff;
	border-radius: 10px;
}

.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

</style>


</head>
<body>


<!-- 관리자 사이드바 -->
<div class="container">
	<div class="row">
	   	<nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block collapse">
	       	<div class="position-sticky pt-3">
	           	<ul class="nav flex-column"> <!-- 사이드 바 메뉴 리스트 -->
	            	<li class="nav-item">
	                  	<a class="nav-link" href="./main">
	                     	홈
	                     </a>
                  	</li>
				    <li class="nav-item active">
				        <a class="nav-link" href="./mento">
				        멘토등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./study">
				        스터디등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./studyroom">
				        스터디룸등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./qna">
				        QnA관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="#" style="color: #6cc4dc;">
				        예약관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./member">
				        회원관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./update">
				        정보수정
				        </a>
				    </li>
				</ul>
			</div>
		</nav><!--사이드바 end -->
		
		
		<!-- 예약 테이블 -->
		<main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
			<div class="wrap">
			    <div class="justify-content-between flex-wrap flex-md-nowrap">
	 		        <p class="menuName">예약 리스트</p>
			    </div>
			    
			    <!-- 필터 검색 -->
			    <div class="filter">
				    <div class="card">
				    	<div class="card-body">
							
							<form action="post">
							
							<!-- 기간별 검색 -->
					        <div class="form-group">
				                <div class="input-group date" id="start">
				                    <input type="text" class="form-control" id="word">
				                    <span class="input-group-append">
				                        <span class="input-group-text bg-white d-block">
				                            <i class="fa fa-calendar"></i>
				                        </span>
				                    </span>
				                </div>
				                <div class="input-group date" id="end">
				                    <input type="text" class="form-control">
				                    <span class="input-group-append">
				                        <span class="input-group-text bg-white d-block">
				                            <i class="fa fa-calendar"></i>
				                        </span>
				                    </span>
				                </div>
				            </div>
					            
				            <!-- 스터디룸별 검색 -->
							<div class="dropdown" style="float: left;">
			  					<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    					스터디룸 명
			 					</button>
			  					<ul class="dropdown-menu">
			    					<li><a class="dropdown-item">스터디클라우드</a></li>
			    					<li><a class="dropdown-item">스터디클라우드</a></li>
			    					<li><a class="dropdown-item">스터디클라우드</a></li>
			  					</ul>
							</div>
							
							<button id="search">검색</button>
					            
					    	</form>
				        </div>
		    		</div>
			    </div>
			    
			    
			    <!-- 테이블 -->
			    <div class="table-responsive px-2">
	                <table class="table table-borderless">
	                    <thead>
	                        <tr>
	                            <th scope="col">No</th>
	                            <th scope="col">스터디룸 명</th>
	                            <th scope="col">예약자</th>
	                            <th scope="col">휴대폰 번호</th>
	                            <th scope="col">예약일시</th>
	                            <th scope="col">예약인원</th>
	                            <th scope="col">관리</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td><span class="bg-blight">13</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름13</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView"  id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">12</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름12</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">11</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름11</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">10</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름10</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">9</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름9</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">8</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름8</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">7</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름7</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">6</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름6</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">5</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름5</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">4</span></td>
	                            <td><span class="bg-bdark">스터디클라우드</span></td>
	                            <td><span class="bg-blight">이름4</span></td>
	                            <td><span class="bg-bdark">010-0000-0000</span></td>
	                            <td><span class="bg-bdark">2022.11.06</span></td>
	                            <td><span class="bg-bdark">5명</span></td>
		                        <td><button type="button" class="btn btnView" >수정</button></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <!-- 페이지 -->
	            <div class="d-flex align-items-center justify-content-between px-3 mt-3">
	                <div class="bg-bdark fs13">
	                	<span>Page</span>
	                	<input class="input-10 text-center" type="text" value="1">
	                	<span><span class="px-1">of</span>1</span>
	               	</div>
	                <div class="d-flex justify-content-end bg-bdark fs13">
	                	<span class="pe-1">Show</span>
	                	<input class="input-10" type="number" value="25">
	                	<span class="ps-2"><span class="pe-2">/</span>Page</span>
	               	</div>
	            </div>
			</div><!-- wrap end -->
        </main>
    </div>
</div><!-- container -->

<c:import url="../layout/footer.jsp" />


</body>
</html>