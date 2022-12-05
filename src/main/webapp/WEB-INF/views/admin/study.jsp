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

<style type="text/css">

/* 메인 */
#btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

</style>

<!-- 신청서 모달 -->
<script type="text/javascript">

const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

</script>


</head>
<body>

<main id="main" class="main">
<form action="/admin/study" method="post">
  
<div class="container">
  
    <div class="pagetitle">
    	<h1>스터디 신청 관리</h1>
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
                   	<c:forEach items="${list }" var="studyboard">
                       <tr>
                           	<td><span class="bg-blight">${studyboard.studyNo }</span></td>
							<td><span class="bg-bdark">${studyboard.member.memberId }</span></td>
							<td><span class="bg-blight">${studyboard.member.memberNick }</span></td>
							<td><span class="bg-bdark">${studyboard.member.memberName }</span></td>
							<td><span class="bg-bdark">${studyboard.member.authority }</span></td>
							<td><button type="submit" name="memberNo" value="${studyboard.member.memberNo }">확인</button></td>
</form>
                            <td><button type="button" class="btn" id="btnView" data-bs-toggle="modal" data-bs-target="#applyModal${studyboard.studyNo }">신청서</button></td>
							
							<!-- 모달 -->
							<div class="modal fade" id="applyModal${studyboard.studyNo }" tabindex="-1" aria-labelledby="applyModal" aria-hidden="true">
							<div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
							<div class="modal-content">
							  	<div class="modal-header">
							    	<h5 class="modal-title" id="applyModal">${studyboard.member.memberNick } 님의 스터디 신청서</h5>
						  			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
							
								<!-- 모달 내용 -->
								<div class="modal-body">
							  		<p>스터디 목적</p>
							  		<p>${studyboard.studyTitle }</p><hr>
							
									<p>인원</p>
									<p>${studyboard.studyPeople } 명</p><hr>
									
									<p>장소</p>
									<p>${studyboard.studyAddress }</p><hr>
									
									<p>날짜</p>
									<p>${studyboard.studyDate }</p><hr>
									
									<p>시간</p>
									<p>${studyboard.studyTime }</p><hr>
									
									<p>소개글</p>
									<p>${studyboard.studyContent }</p>
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