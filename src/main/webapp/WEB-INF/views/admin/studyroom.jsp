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

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/studyroom/write"
	})
})
</script>

</head>
<body>


<main id="main" class="main">
  
	<div class="container">
  
    <div class="pagetitle">
    	<h1>스터디룸 등록</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
        	<div class="row">
				
			    <!-- 테이블 -->
			    <div class="table-responsive px-2">
				<table class="table table-borderless">
	                
<!-- 				<table class="table table-striped table-hover table-condensed"> -->
				<thead>
					<tr>
						<th style="width: 10%;">글번호</th>
						<th style="width: 40%;">스터디룸 명</th>
						<th style="width: 40%;">한줄 소개</th>
						<th style="width: 10%;">가격</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="studyroom">
					<tr>
						<td>${studyroom.sRoomNo }</td>
				<%-- 		<td><a href="/studyroom/view?sRoomNo=${studyroom.sRoomNo }">${studyroom.title }</a></td> --%>
						<td>${studyroom.sRoomName }</a></td>
						<td>${studyroom.sRoomIntro }</td>
						<td>${studyroom.sRoomPrice }</td>
					</tr>
				</c:forEach>
				</tbody>
				</table>
				
				<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
				<span class="pull-right">total : ${paging.totalCount }</span>
				<div class="clearfix"></div>
				
				      		</div><!-- 테이블 row end -->
				       	</div>
					</div><!-- main row end -->
					
					</section>
				
					</div><!-- main container end -->
				</main><!-- main end -->


</body>
</html>