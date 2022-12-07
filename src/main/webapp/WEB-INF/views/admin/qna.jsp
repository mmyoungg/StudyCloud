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

</head>
<body>



<main id="main" class="main">
<form action="/admin/mento" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>QnA 관리</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive px-2">
				<table class="table table-borderless">
					<thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">아이디</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">이름</th>
                            <th scope="col">회원등급</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${list }" var="applymt">
                       <tr>
                           	<td><span class="bg-blight">${applymt.applymtNo }</span></td>
							<td><span class="bg-bdark">${applymt.member.memberId }</span></td>
							<td><span class="bg-blight">${applymt.member.memberNick }</span></td>
							<td><span class="bg-bdark">${applymt.member.memberName }</span></td>
							<td><span class="bg-bdark">${applymt.member.authority }</span></td>
							<td><button type="submit" name="memberNo" value="${applymt.member.memberNo }">확인</button></td>
</form>
		               </tr>
                    </c:forEach>
                   	</tbody>
                </table>
   			</div><!-- 테이블 row end -->
			<span class="pull-right">total : ${paging.totalCount }</span>
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>