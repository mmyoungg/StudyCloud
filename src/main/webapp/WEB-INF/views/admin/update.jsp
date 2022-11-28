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


<!-- member css -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/admin/member.css" />


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

#btnSave {
    background-color: #6cc4dc;
    color: #fff;
    border-radius: 5px;
}

</style>


<script type="text/javascript">

/* 목록 버튼 클릭 시 회원 관리 페이지 이동 */
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./member"
	})
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
				        <a class="nav-link" href="./update" style="color: #6cc4dc;">
				        정보수정
				        </a>
				    </li>
				</ul>
			</div>
		</nav><!--사이드바 end -->
		
		
		<!-- 내 정보 수정 -->
		<main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
		
			<div class="wrap">
			    <div class="justify-content-between flex-wrap flex-md-nowrap">
	 		        <p class="menuName">비밀번호 재설정</p>
			    </div>
			    
			    <div class="view-account">
					<form class="form-horizontal form-inline">
						<div class="row mb-3">
						  	<label for="id" class="col-sm-2 col-form-label">관리자 ID</label>
						  	<div class="col-sm-10">
						    	<p>admin</p>
						  	</div>
						</div>
						<div class="row mb-3">
						  	<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					  		<div class="col-sm-4">
						    	<input type="password" class="form-control" id="password">
						  	</div>
						</div>
						<div class="row mb-3">
						  	<label for="password" class="col-sm-2 col-form-label">비밀번호 확인</label>
					  		<div class="col-sm-4">
						    	<input type="password" class="form-control" id="password">
						  	</div>
						</div>
						
			            <div class="text-center">
							<button id="btnSave" class="btn">수정</button>
						</div>
	            	</form>
		    	</div>
			</div><!-- wrap end -->
        </main>
    </div>
</div><!-- container -->

<c:import url="../layout/footer.jsp" />

</body>
</html>