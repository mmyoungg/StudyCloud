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

/* 메인 */
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


<main id="main" class="main">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>비밀번호 재설정</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
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
		    	</div>
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->
		

</body>
</html>