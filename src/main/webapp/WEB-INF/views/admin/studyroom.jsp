<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/studyroom/write"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

</head>
<body>


<div class="container">

<h1>스터디룸 예약 리스트</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
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

</div><!-- .container -->

</body>
</html>