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


<main id="main" class="main">
<form action="/admin/mento" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>예약 리스트</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		   <!-- 필터 검색 -->
			    <div class="filter">
				    <div class="card">
				    	<div class="card-body">
							
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
			<span class="pull-right">total : ${paging.totalCount }</span>
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>