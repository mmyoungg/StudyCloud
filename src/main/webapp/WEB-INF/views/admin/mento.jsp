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
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin/mento.css" />


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

.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

</style>


<script type="text/javascript">

<!-- 신청서 모달 -->
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>


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
				        <a class="nav-link" href="#" style="color: #6cc4dc;">
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
				        <a class="nav-link" href="./qua">
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


		<!-- 멘토 등록 -->
		<main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
			<div class="wrap">
			    <div class="justify-content-between flex-wrap flex-md-nowrap">
	 		        <p class="menuName">멘토 신청 관리</p>
			    </div>
			    <!-- 테이블 -->
			    <div class="table-responsive">
	                <table class="table table-borderless">
	                    <thead>
	                        <tr>
	                            <th style="width: 5%">No</th>
	                            <th style="width: 20%">아이디</th>
	                            <th style="width: 20%">닉네임</th>
	                            <th style="width: 20%">이름</th>
	                            <th style="width: 20%">회원등급</th>
	                            <th style="width: 10%">신청서</th>
	                            <th class="text-center" style="width: 5%"></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid1</span></td>
	                            <td><span class="bg-blight">닉네임1</span></td>
	                            <td><span class="bg-bdark">이름1</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn btnView" data-bs-toggle="modal" data-bs-target="#exampleModal">신청서</button></td>
	                            
									<!-- 모달 -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">OOO 님의 멘토 신청서</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <!-- 모달 내용 -->
									      <div class="modal-body">
									        	<p>Study Cloud 아이디</p>
									        	<p>ABC</p><hr>
									        	
									        	<p>이메일</p>
									        	<p>ABC@email.com</p><hr>
									        	
									        	<p>이름</p>
									        	<p>OOO</p><hr>
	
									        	<p>연락처</p>
									        	<p>010-0000-0000</p><hr>
	
									        	<p>희망분야</p>
									        	<p>개발</p><hr>
	
									        	<p>소개글</p>
									        	<p>소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개
									        		소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개소개
								        		</p>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary">승인</button>
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									      </div>
									    </div>
									  </div>
									</div>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid2</span></td>
	                            <td><span class="bg-blight">닉네임2</span></td>
	                            <td><span class="bg-bdark">이름2</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid3</span></td>
	                            <td><span class="bg-blight">닉네임3</span></td>
	                            <td><span class="bg-bdark">이름3</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid4</span></td>
	                            <td><span class="bg-blight">닉네임4</span></td>
	                            <td><span class="bg-bdark">이름4</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid5</span></td>
	                            <td><span class="bg-blight">닉네임5</span></td>
	                            <td><span class="bg-bdark">이름5</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid6</span></td>
	                            <td><span class="bg-blight">닉네임6</span></td>
	                            <td><span class="bg-bdark">이름6</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid7</span></td>
	                            <td><span class="bg-blight">닉네임7</span></td>
	                            <td><span class="bg-bdark">이름7</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid8</span></td>
	                            <td><span class="bg-blight">닉네임8</span></td>
	                            <td><span class="bg-bdark">이름8</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid9</span></td>
	                            <td><span class="bg-blight">닉네임9</span></td>
	                            <td><span class="bg-bdark">이름9</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid10</span></td>
	                            <td><span class="bg-blight">닉네임10</span></td>
	                            <td><span class="bg-bdark">이름10</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn btnView" data-toggle="modal" data-target="#exampleModal">신청서</button></td>
	                            <td class="text-center"><span class="fas fa-check"></span></td>
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