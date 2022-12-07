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

<!-- 테이블 css -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/admin/mento.css" />

<style type="text/css">

/* 메인 */
.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
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

    <section class="dashboard">
      	<div class="row">

     	<!-- 테이블 -->
       	<div class="col-lg-12">
				
		    <div class="table-responsive px-2">
				<table class="table table-borderless">
					<thead>
                        <tr>
                            <th style="width: 5%">No</th>
                            <th style="width: 20%">아이디</th>
                            <th style="width: 10%">닉네임</th>
                            <th style="width: 20%">이름</th>
                            <th style="width: 20%">회원등급</th>
                            <th style="width: 10%">관리</th>
                            <th style="width: 10%">신청서</th>
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
                            <td><button type="button" class="btn" id="btnView" data-bs-toggle="modal" data-bs-target="#applyModal${applymt.applymtNo }">신청서</button></td>
							
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
       	</div>
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>