<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin QnA List</title>

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
    padding: 5px;
    margin: 0;
    font-size: 14px;
}

a {
	text-decoration: none;
	color: #212529;
}

</style>

</head>
<body>

<main id="main" class="main">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>QnA 관리</h1>
    </div>

    <section class="adminQna">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive">
				<table class="table">
					<thead>
                        <tr>
                            <th>No</th>
                            <th>제목</th>
<!--                             <th>스터디룸 명</th> -->
                            <th>아이디</th>
                            <th>닉네임</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${qna }" var="qna">
                   	<c:choose>
                       <c:when test="${qna.SROOMQNA_STEP eq 0 }"> <!-- 문의글일 경우 -->
                       <tr>
                           	<td style="text-align: center">${qna.SROOMQNA_NO }</td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">${qna.SROOMQNA_TITLE }</a></td>
<%--                            	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td> --%>
							<td style="text-align: center">${qna.MEMBER_ID }</td>
							<td style="text-align: center">${qna.MEMBER_NICK }</td>
							<td style="text-align: center">${qna.SROOMQNA_DATE }</td>
		               </tr>
		               </c:when>
                       <c:when test="${qna.SROOMQNA_STEP ne 0 }"> <!-- 답변글일 경우 -->
                       <tr>
                           	<td style="text-align: center">${qna.SROOMQNA_NO }</td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">&emsp;RE : ${qna.SROOMQNA_TITLE }</a></td>
<%--                            	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td> --%>
							<td style="text-align: center">${qna.MEMBER_ID }</td>
							<td style="text-align: center">${qna.MEMBER_NICK }</td>
							<td style="text-align: center">${qna.SROOMQNA_DATE }</td>
		               </tr>
		               </c:when>
                   	</c:choose>
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