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

<main id="main" class="main">
  
	<div class="container">
  
    <div class="pagetitle">
    	<h1>회원관리</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
        	<div class="row">
				
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
      		</div><!-- 테이블 row end -->
       	</div>
	</div><!-- main row end -->
	
	</section>

	</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>