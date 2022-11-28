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


<!-- 캘린더 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin/calendar.css" />

<!-- 폰트 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	

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
    display: flex;
    align-items: center;
    padding: 16px 0 16px 0;
    border-bottom: 1px solid #dee2e6;
}

.btnLogin {
    padding: 5px 16px;
}

/* 메인 */
main {
	margin: 0 auto;
}

.today-wrap {
	padding-left: 30px;
	padding-right: 30px;
}

.table-wrap {
	padding-left: 30px;
	padding-right: 30px;
	margin: 0;
	margin-top: 50px;
}

.mainTitle {
    font-weight: bold;
}

/* 투데이 카운트 */
.card {
    border: 1.5px solid #6cc4dc;
    border-radius: 15px;
    width: 250px;
}

.card-body {
	padding: 20px 30px 20px 30px;
}

.span {
	text-align: center;
}

.cnt { /* 숫자 크기 */
	font-size: 50px; 
}

.cntText {
	font-size: 16px; 
}

.table-group-divider {
    border-top-color: #6cc4dc;
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
	                  	<a class="nav-link" href="#" style="color: #6cc4dc;">
	                     	홈
	                     </a>
                  	</li>
				    <li class="nav-item">
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
				        <a class="nav-link" href="./reserve">
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


		<!-- 메인 컨텐트 -->
		<main class="col-md-8 ms-sm-auto col-lg-10 px-md-4" >
		    <div class="row today-wrap dashboard">
		    
		    	<!-- 투데이 멘토신청 -->
		        <div class="col" id="mento-wrap">
		            <p class="mainTitle">멘토 신청</p>
		            <div class="card">
		                <div class="card-body">
		                    <p class="card-title">today</p>
		                    <div class="text-center">
		                    	<span class="cnt">24</span>
		                    	<span class="cntText">&nbsp개의 신청 목록</span>
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		        <!-- 투데이 스터디 신청 -->
		        <div class="col" id="study-wrap">
		            <p class="mainTitle">스터디 신청</p>
		            <div class="card">
		                <div class="card-body">
		                    <p class="card-title">today</p>
		                    <div class="text-center">
		                    	<span class="cnt">9</span>
		                    	<span class="cntText">&nbsp개의 신청 목록</span>
		                    </div>
		                </div>
		            </div>
		        </div>
               
				<!-- 캘린더 -->
		        <div class="col" id="calendar-wrap">
             		<div class="elegant-calencar">
						<div class="calendarHeadWrap d-flex align-items-center">
							<p id="reset">reset</p>
					        <div id="calendarHead" class="p-0">
					            <div class="pre-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-left"></i></div>
					            <div class="head-info">
					                <div class="head-day"></div>
					                <div class="head-month"></div>
					            </div>
					            <div class="next-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i></div>
					        </div>
				      	</div>
					      	
				      	<div class="calendar-wrap">
					        <table id="calendar">
					            <thead>
					                <tr>
					                    <th>Sun</th>
					                    <th>Mon</th>
					                    <th>Tue</th>
					                    <th>Wed</th>
					                    <th>Thu</th>
					                    <th>Fri</th>
					                    <th>Sat</th>
					                </tr>
					            </thead>
					            
					            <tbody>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					            </tbody>
					        </table>
				      	</div>
			      	</div>
				</div><!-- 달력 end  -->
			</div><!-- row -->
           

			<!-- QnA 테이블 -->
			<div class="row table-wrap">
				<div class="col-sm-6">
				    <p class="mainTitle">QnA 답변</p>
				    <table class="table qnaTable">
				        <thead>
				            <tr>
				                <th scope="col">#</th>
				                <th scope="col">제목</th>
				                <th scope="col">작성자</th>
				   			 </tr>
						</thead>
						<tbody class="table-group-divider">
						    <tr>
						        <th scope="row">1</th>
						        <td>제목1</td>
						        <td>작성자1</td>
							</tr>
							<tr>
							    <th scope="row">2</th>
							    <td>제목2</td>
							    <td>작성자2</td>
							</tr>
							<tr>
							    <th scope="row">3</th>
							    <td>제목3</td>
							    <td>작성자3</td>
				            </tr>
							<tr>
							    <th scope="row">4</th>
							    <td>제목4</td>
							    <td>작성자4</td>
				            </tr>
							<tr>
							    <th scope="row">5</th>
							    <td>제목5</td>
							    <td>작성자5</td>
				            </tr>
				        </tbody>
				    </table>
				</div>
				    
				    
				<!-- 예약 관리 -->
				<div class="col-sm-6">
				    <p class="mainTitle">예약 리스트</p>
				    <table class="table qnaTable">
				        <thead>
				            <tr>
				                <th scope="col">#</th>
				                <th scope="col">스터디룸</th>
				                <th scope="col">예약자</th>
				   			 </tr>
						</thead>
						<tbody class="table-group-divider">
						    <tr>
						        <th scope="row">1</th>
						        <td>제목1</td>
						        <td>작성자1</td>
							</tr>
							<tr>
							    <th scope="row">2</th>
							    <td>제목2</td>
							    <td>작성자2</td>
							</tr>
							<tr>
							    <th scope="row">3</th>
							    <td>제목3</td>
							    <td>작성자3</td>
				            </tr>
							<tr>
							    <th scope="row">4</th>
							    <td>제목4</td>
							    <td>작성자4</td>
				            </tr>
							<tr>
							    <th scope="row">5</th>
							    <td>제목5</td>
							    <td>작성자5</td>
				            </tr>
				        </tbody>
				    </table>
				</div>
				
            </div><!-- 테이블 end -->
            
        </main>
    </div>
</div><!-- container -->


<c:import url="../layout/footer.jsp" />


<!-- 캘린더 js -->
<script type="text/javascript" src="${path}/resources/js/admin/calendar.js"></script>

</body>
</html>