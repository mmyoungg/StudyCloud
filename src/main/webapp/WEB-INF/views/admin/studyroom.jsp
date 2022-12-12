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
	vertical-align: middle;
	margin-top: 20px;
}

.table thead {
    background-color: #3f92b7;
}

.table thead th {
	text-align: center;
    padding: 10px;
    font-size: 16px;
    font-weight: 400;
    color: white;
}

.table tbody td {
    padding: 10px;
    margin: 0;
    font-size: 14px;
}

a {
	text-decoration: none;
	color: #212529;
}

a:hover{

}

/* 버튼 */
#btnWrite {
	background-color: #6cc4dc;
	color: #fff;
	padding: 5px;
	border: 1px solid #aacde5;
	border-radius: 10px;
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
					<td style="text-align:center;">${studyroom.sRoomNo }</td>
					<td><a href="/admin/studyroom/view?sRoomNo=${studyroom.sRoomNo }">${studyroom.sRoomName }</a></td>
					<td>${studyroom.sRoomIntro }</td>
					<td style="text-align:center;">${studyroom.sRoomPrice } 원/시간</td>
				</tr>
			</c:forEach>

			</tbody>
			
			</table>
			
			<button id="btnWrite" class="btn pull-left">글쓰기</button>
			<div class="clearfix"></div>
			<span class="pull-right">total : ${paging.totalCount }</span>
			
			<c:import url="/WEB-INF/views/admin/paging.jsp" />

   			</div><!-- 테이블 row end -->
      	</div>
		</div><!-- main row end -->

	</section>
	</div><!-- main container end -->
	
</main><!-- main end -->

</body>
</html>