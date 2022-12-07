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

 #main { 
 	margin-top: 60px; 
   	padding: 20px 30px; 
   	transition: all 0.3s; 
} 

 /* 메인 타이틀 */
 .pagetitle { */
   margin-bottom: 10px; 
 } 

 .pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0;
   font-weight: bold; 
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
	                            <th scope="col">이메일</th>
	                            <th scope="col">연락처</th>
	                            <th scope="col">회원등급</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach items="${list }" var="member">
	                        <tr>
	                            <td><span class="bg-blight">${member.memberNo }</span></td>
	                            <td><span class="bg-bdark">${member.memberId }</span></td>
	                            <td><span class="bg-bdark">${member.memberNick }</span></td>
	                            <td><span class="bg-bdark">${member.memberName }</span></td>
	                            <td><span class="bg-bdark">${member.memberEmail }</span></td>
	                            <td><span class="bg-bdark">${member.memberPhone }</span></td>
	                            <td><span class="bg-bdark">${member.authority }</span></td>
	                            <td>
	                            	<select name="authority">
	                            		<option value="user">일반회원</option>
	                            		<option value="studyleader">스터디장</option>
	                            		<option value="mento">멘토</option>
	                            	</select>
	                            </td>
	                            
	                            
	                            
<!-- 	                            <td><button type="button" class="btn" id="btnView">수정</button></td> -->
	                        </tr>
	                    </c:forEach>
	                    </tbody>
	                </table>
      		</div><!-- 테이블 row end -->
      		<!-- 페이징 -->
      		<c:import url="/WEB-INF/views/admin/paging.jsp" />
       	</div>
	</div><!-- main row end -->
	
	</section>

	</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>