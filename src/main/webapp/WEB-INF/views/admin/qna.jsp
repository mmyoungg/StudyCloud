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

</head>
<body>

<main id="main" class="main">
  
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
                            <th scope="col">스터디룸 명</th>
                            <th scope="col">제목</th>
                            <th scope="col">아이디</th>
                            <th scope="col">닉네임</th>
                            <th scope="col">등록일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${qna }" var="qna">
                   	<c:choose>
                       <c:when test="${qna.SROOMQNA_STEP eq 0 }"> <!-- 문의글일 경우 -->
                       <tr>
                           	<td>${qna.SROOMQNA_NO }</td>
                           	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">${qna.SROOMQNA_TITLE }</a></td>
							<td>${qna.MEMBER_ID }</td>
							<td>${qna.MEMBER_NICK }</td>
							<td>${qna.SROOMQNA_DATE }</td>
		               </tr>
		               </c:when>
                       <c:when test="${qna.SROOMQNA_STEP ne 0 }"> <!-- 답변글일 경우 -->
                       <tr>
                           	<td> -> ${qna.SROOMQNA_NO }</td> <!-- 넘버에 들여쓰기 -->
                           	<td><a href="/sRoom/detail?sRoomNo=${qna.SROOM_NO }">${qna.SROOM_NAME }</a></td>
							<td><a href="/admin/qna/view?sRoomQnaNo=${qna.SROOMQNA_NO }&sRoomNo=${qna.SROOM_NO }">${qna.SROOMQNA_TITLE }</a></td>
							<td>${qna.MEMBER_ID }</td>
							<td>${qna.MEMBER_NICK }</td>
							<td>${qna.SROOMQNA_DATE }</td>
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