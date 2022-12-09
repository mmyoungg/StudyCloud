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

<style type="text/css">

/* 메인 */
.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

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
    font-weight: 400;
    color: white;
}

.table tbody td {
    padding: 5px;
    margin: 0;
    font-size: 14px;
}

/* 버튼 */
.btnOk {
	width: 50px;
	background-color: #fff;
	color: #6cc4dc;
	padding: 5px;
	border: 1px solid #6cc4dc;
	border-radius: 10px;
}

.btnView {
	width: 50px;
	background-color: #6cc4dc;
	color: #fff;
	padding: 5px;
	border: 1px solid #aacde5;
	border-radius: 10px;
}

</style>


<script type="text/javascript">

<!-- 신청서 모달 -->
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>


</head>
<body>


<main id="main" class="main">
<form action="/admin/mento" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>멘토 신청 관리</h1>
    </div>

    <section class="adminMento">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive">
				<table class="table">
					<thead>
                        <tr>
                            <th>No</th>
                            <th>아이디</th>
                            <th>닉네임</th>
                            <th>이름</th>
                            <th>회원등급</th>
                            <th>관리</th>
                            <th>신청서</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach items="${list }" var="applymt">
                       <tr>
                           	<td>${applymt.applymtNo }</td>
							<td>${applymt.member.memberId }</td>
							<td>${applymt.member.memberNick }</td>
							<td>${applymt.member.memberName }</td>
							<td>
								<c:choose>
								<c:when test="${applymt.member.authority eq 1}">
									일반
								</c:when>
								
								<c:when test="${applymt.member.authority eq 2}">
									스터디장
								</c:when>
								
								<c:when test="${applymt.member.authority eq 3}">
									멘토
								</c:when>
								</c:choose>
							</td>
							<td><button type="submit" class="btnOk" name="memberNo" value="${applymt.member.memberNo }">승인</button></td>
</form>
                            <td><button type="button" class="btnView" id="btnView" data-bs-toggle="modal" data-bs-target="#applyModal${applymt.applymtNo }">신청서</button></td>
							
							<!-- 모달 -->
							<div class="modal fade" id="applyModal${applymt.applymtNo }" tabindex="-1" aria-labelledby="applyModal" aria-hidden="true">
							<div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
							<div class="modal-content">
							  	<div class="modal-header">
							    	<h5 class="modal-title" id="applyModal">${applymt.member.memberNick } 님의 스터디 신청서</h5>
						  			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
							
								<!-- 모달 내용 -->
								<div class="modal-body">
							  		<p>Study Cloud 아이디</p>
							  		<p>${applymt.member.memberId }</p><hr>
							
									<p>이메일</p>
									<p>${applymt.member.memberEmail}</p><hr>
									
									<p>이름</p>
									<p>${applymt.member.memberName }</p><hr>
									
									<p>연락처</p>
									<p>${applymt.member.memberPhone }</p><hr>
									
									<p>희망분야</p>
									<p>${applymt.field }</p><hr>
									
									<p>소개글</p>
									<p>${applymt.applymtContent }</p>
						      	</div>
						      	
							    <div class="modal-footer">
							        <button type="button" class="btn btn-primary">승인</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						      	</div>
						    </div>
						  	</div>
							</div>
		                </tr>
                    </c:forEach>
                   	</tbody>
                </table>
   			</div><!-- 테이블 row end -->
			<span class="pull-right">total : ${paging.totalCount }</span>
			<c:import url="/WEB-INF/views/admin/paging.jsp" />
       	</div>
		</div><!-- main row end -->
	</section>




</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>