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

/* 목록 버튼 클릭 시 예약 관리 페이지 이동 */
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/reserve"
	})
})

</script>


<style type="text/css">

table {
	border: 1px solid #ccc;
}

th {
	width: 20%;
}

#btnList {
	background-color: #6CC4DC;
	border: 0;
	width: 70px;
	padding: 5px;
	margin: 2px; 
	border-radius: 5px;
	color: white;
}


</style>

</head>
<body>

<main id="main" class="main">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>예약 정보</h1>
    </div>

    <section class="dashboard">
      	<div class="row">

     	<!-- 예약 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive px-2">
                <table class="table">
                <c:forEach items="${view }" var="hashmap">
                	<tr>
                		<th>스터디룸 명</th>
                        <td>${hashmap.SROOM_NAME }</td>
                	</tr>
                	<tr>	
                		<th>예약자</th>
                        <td>${hashmap.MEMBER_NAME }</td>
                	</tr>	
                	<tr>
                		<th>예약일</th>
                        <td>${hashmap.RESERVE_DATE }</td>
                	</tr>
                    <tr>
                        <th>예약 시간</th>
                        <td>${hashmap.RESERVE_STIME } ~ ${hashmap.RESERVE_ETIME }</td>
                    </tr>
                    <tr>
                        <th>인원</th>
                        <td>${hashmap.RESERVE_PEOPLE } 명</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>${hashmap.MEMBER_PHONE }</td>
                    </tr>
                    <tr>
                        <th>요청사항</th>
                        <td>${hashmap.RESERVE_REQ }</td>
                    </tr>
                </c:forEach>
                </table>
	            <div class="text-center">
					<button id="btnList">목록</button>
				</div>
                
            </div>
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>