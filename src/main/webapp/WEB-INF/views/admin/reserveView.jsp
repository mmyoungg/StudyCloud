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

/* 목록 버튼 클릭 시 예약 관리 페이지 이동 */
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./reserve"
	})
})

</script>


<style type="text/css">

/* 사이드바 */
#sidebarMenu {
    /* width: 200px; */
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
.date {
	max-width: 200px;
}

</style>


</head>
<body>


<!-- 관리자 사이드바 -->
<div class="container-fluid">
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
	 		        <p class="menuName">✔ 예약 정보</p>
			    </div>
			    
			    <!-- 예약 상세 정보 테이블 -->
	 			<div class="table-responsive px-2 text-center">
	                <table class="table table-borderless">
	                    <tr>
	                        <td>스터디룸 명</td>
	                        <td>스터디클라우드</td>
	                    </tr>
	                    <tr>
	                        <td>이름</td>
	                        <td>서은영</td>
	                    </tr>
	                    <tr>
	                        <td>예약 일자</td>
	                        <td>2022.11.06</td>
	                    </tr>
	                    <tr>
	                        <td>예약 시간</td>
	                        <td>13:00 ~ 15:00</td>
	                    </tr>
	                    <tr>
	                        <td>예약인원</td>
	                        <td>5명</td>
	                    </tr>
	                    <tr>
	                        <td>연락처</td>
	                        <td>010-0000-0000</td>
	                    </tr>
	                    <tr>
	                        <td>요청사항</td>
	                        <td>요청사항 없음</td>
	                    </tr>
	                </table>
	            </div>
	            
	            <div class="text-center">
					<button id="btnList" class="btn btn-primary">목록</button>
				</div>
			</div><!-- wrap end -->
        </main>
    </div>
</div><!-- container -->

<c:import url="../layout/footer.jsp" />

</body>
</html>