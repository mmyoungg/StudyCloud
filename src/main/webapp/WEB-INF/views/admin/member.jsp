<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin memberList</title>

<style type="text/css">

/* 테이블 */
.table {
	text-align: center;
	vertical-align: middle;
	margin-top: 20px;
}

.table thead {
    background-color: #3f92b7;
}

.table thead th {
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}

.table tbody td {
    padding: 5px;
    margin: 0;
    font-size: 14px;
}

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

    <section class="memberList">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
        	<div class="row">
			    <div class="table-responsive">
	                <table class="table">
	                    <thead>
	                        <tr>
	                            <th>No</th>
	                            <th>아이디</th>
	                            <th>닉네임</th>
	                            <th>이름</th>
	                            <th>이메일</th>
	                            <th>연락처</th>
	                            <th>회원등급</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach items="${list }" var="member">
	                        <tr>
	                            <td>${member.memberNo }</td>
	                            <td>${member.memberId }</td>
	                            <td>${member.memberNick }</td>
	                            <td>${member.memberName }</td>
	                            <td>${member.memberEmail }</td>
	                            <td>${member.memberPhone }</td>
	                            <td>
	                            	<c:choose>
									<c:when test="${member.authority eq 1}">
										일반
									</c:when>
									
									<c:when test="${member.authority eq 2}">
										스터디장
									</c:when>
									
									<c:when test="${member.authority eq 3}">
										멘토
									</c:when>
									</c:choose>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                    </tbody>
	                </table>
      		</div><!-- 테이블 row end -->
      		<!-- 페이징 -->
      		<c:import url="/WEB-INF/views/admin/paging.jsp" />
       	</div><!-- main row end -->
	</div><!--  table end -->
	
	</section>

	</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>