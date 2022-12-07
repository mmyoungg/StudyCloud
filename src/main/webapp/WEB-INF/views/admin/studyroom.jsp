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

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/studyroom/write"
	})
})
</script>

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
    padding: 10px;
    margin: 0;
    font-size: 14px;
}

</style>

</head>
<body>

<main id="main" class="main">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>스터디룸 등록</h1>
    </div>

    <section class="adminStudyroom">
   	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
			
		    <div class="table-responsive">
			<table class="table">
                
			<thead>
				<tr>
					<th>글번호</th>
					<th>스터디룸 명</th>
					<th>한줄 소개</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${list }" var="studyroom">
				<tr>
					<td>${studyroom.sRoomNo }</td>
					<td>${studyroom.sRoomName }</a></td>
					<td>${studyroom.sRoomIntro }</td>
					<td>${studyroom.sRoomPrice } /시간</td>
				</tr>
			</c:forEach>
			</tbody>
			
			</table>
			
			<button id="btnWrite" class="btn pull-left">글쓰기</button>
			<span class="pull-right">total : ${paging.totalCount }</span>
			<div class="clearfix"></div>
			
			<c:import url="/WEB-INF/views/admin/paging.jsp" />

   			</div><!-- 테이블 row end -->
      	</div>
		</div><!-- main row end -->

	</section>
	</div><!-- main container end -->
	
</main><!-- main end -->

</body>
</html>