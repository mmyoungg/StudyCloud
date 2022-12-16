<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin member detail</title>

<!-- member css -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/admin/member.css" />


<style type="text/css">

/* 메인 */

#btnSave {
    background-color: #6cc4dc;
    color: #fff;
}

#btnList {
	background-color: #fff;
	color: #6cc4dc;
	border-color: #6cc4dc;
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
    	<h1>회원 정보 수정</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
        	<div class="row">
				
			<div class="view-account">
					<form class="form-horizontal form-inline">
			       	<!-- 프로필 사진 -->
	                <div class="row mb-3">
				 		<label for="profile" class="col-sm-2 col-form-label">프로필 사진</label>
					  	<div class="col-sm-10">
	                    	<img class="profile" src="https://bootdey.com/img/Content/avatar/avatar1.png">
				  		</div>
	      			</div>
					                   
	               	<div class="row mb-3">
					 	<label for="name" class="col-sm-2 col-form-label">이름</label>
					  	<div class="col-sm-4">
					    	<input type="text" class="form-control" id="name">
					  	</div>
					</div>
					<div class="row mb-3">
					  	<label for="id" class="col-sm-2 col-form-label">아이디</label>
					  	<div class="col-sm-4">
					    	<input type="text" class="form-control" id="id">
					  	</div>
					</div>
					<div class="row mb-3">
					  	<label for="phone" class="col-sm-2 col-form-label">연락처</label>
					  	<div class="col-sm-4">
					    	<input type="text" class="form-control" id="phone">
					  	</div>
					</div>
					<div class="row mb-3">
					  	<label for="email" class="col-sm-2 col-form-label">이메일</label>
				  		<div class="col-sm-4">
					    	<input type="email" class="form-control" id="email">
					  	</div>
					</div>
					
		            <div class="text-center">
						<button id="btnSave" class="btn">수정</button>
						<button id="btnList" class="btn">목록</button>
					</div>
	
	            	</form>
		    	</div>
       	</div>
	</div><!-- main row end -->
	
	</section>

	</div><!-- main container end -->
</main><!-- main end -->		
		
</body>
</html>