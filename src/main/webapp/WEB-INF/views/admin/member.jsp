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


<!-- 게시판 테이블 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel ="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- 테이블 css -->
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
	padding: 0px 30px;
}

#btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

</style>


<script type="text/javascript">

/* 수정 버튼 클릭 시 회원 정보 페이지 이동 */
$(document).ready(function() {
	$("#btnView").click(function() {
		location.href = "./memberview"
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
				        <a class="nav-link" href="#" style="color: #6cc4dc;">
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
	 		        <p class="menuName">회원 관리</p>
			    </div>
			    <!-- 테이블 -->
			    <div class="table-responsive px-2">
	                <table class="table table-borderless">
	                    <thead>
	                        <tr>
	                            <th scope="col">No</th>
	                            <th scope="col">아이디</th>
	                            <th scope="col">닉네임</th>
	                            <th scope="col">이름</th>
	                            <th scope="col">회원등급</th>
	                            <th scope="col">관리</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid1</span></td>
	                            <td><span class="bg-blight">닉네임1</span></td>
	                            <td><span class="bg-bdark">이름1</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                            
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid2</span></td>
	                            <td><span class="bg-blight">닉네임2</span></td>
	                            <td><span class="bg-bdark">이름2</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid3</span></td>
	                            <td><span class="bg-blight">닉네임3</span></td>
	                            <td><span class="bg-bdark">이름3</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid4</span></td>
	                            <td><span class="bg-blight">닉네임4</span></td>
	                            <td><span class="bg-bdark">이름4</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid5</span></td>
	                            <td><span class="bg-blight">닉네임5</span></td>
	                            <td><span class="bg-bdark">이름5</span></td>
	                            <td><span class="bg-bdark">일반</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid6</span></td>
	                            <td><span class="bg-blight">닉네임6</span></td>
	                            <td><span class="bg-bdark">이름6</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid7</span></td>
	                            <td><span class="bg-blight">닉네임7</span></td>
	                            <td><span class="bg-bdark">이름7</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid8</span></td>
	                            <td><span class="bg-blight">닉네임8</span></td>
	                            <td><span class="bg-bdark">이름8</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid9</span></td>
	                            <td><span class="bg-blight">닉네임9</span></td>
	                            <td><span class="bg-bdark">이름9</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><span class="bg-blight">1128</span></td>
	                            <td><span class="bg-bdark">userid10</span></td>
	                            <td><span class="bg-blight">닉네임10</span></td>
	                            <td><span class="bg-bdark">이름10</span></td>
	                            <td><span class="bg-bdark">멘토</span></td>
	                            <td><button type="button" class="btn" id="btnView">수정</button></td>
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
</div>

<c:import url="../layout/footer.jsp" />

</body>
</html>