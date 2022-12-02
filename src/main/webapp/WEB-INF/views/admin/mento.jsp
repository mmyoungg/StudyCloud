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

/* 사이드바 */
#sidebarMenu {
/*     background-color: #f8f9fa; */
     box-shadow: inset -1px 0 0 rgb(0 0 0 / 10%);
}

#sidebarMenu ul>li>a { /* 사이드바 메뉴 리스트 폰트 */
    font-size: 16px;
    font-weight: bold;
    align-items: center;
    color: rgb(0 0 0 / 55%);
}

#sidebarMenu ul>li>a:hover { /* 사이드바 메뉴 hover */
    color: #6cc4dc;
}

.menuName {
    font-size: 20px;
    font-weight: bold;
    display: flex;
    align-items: center;
    padding: 16px 0 16px 0;
    border-bottom: 1px solid #dee2e6;
}

.btnLogin {
    padding: 5px 16px;
}

/* 메인 */
.wrap {
	padding: 0 30px;
}

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


$(document).ready(function() {
	$("#btnUpdate").click(function() {
		location.href = "/admin/memto/view"
	})
})

</script>


</head>
<body>


<!-- 관리자 사이드바 -->
<div class="container">
	<div class="row">
	   	<nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block collapse">
	       	<div class="position-sticky pt-3">
	           	<ul class="nav flex-column"> <!-- 사이드 바 메뉴 리스트 -->
	            	<li class="nav-item">
	                  	<a class="nav-link" href="./main">
	                     	홈
	                     </a>
                  	</li>
				    <li class="nav-item active">
				        <a class="nav-link" href="#" style="color: #6cc4dc;">
				        멘토등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./study">
				        스터디등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./studyroom">
				        스터디룸등록
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./qua">
				        QnA관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./reserve">
				        예약관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./member">
				        회원관리
				        </a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" href="./update">
				        정보수정
				        </a>
				    </li>
				</ul>
			</div>
		</nav><!--사이드바 end -->


		<!-- 멘토 등록 -->
		<main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
		<form action="/admin/mento" method="post" >
			<div class="wrap">
			    <div class="justify-content-between flex-wrap flex-md-nowrap">
	 		        <p class="menuName">멘토 신청 관리</p>
			    </div>
			    <!-- 테이블 -->
			    <div class="table-responsive">
	                <table class="table table-borderless">
	                    <thead>
	                        <tr>
	                            <th style="width: 5%">No</th>
	                            <th style="width: 20%">아이디</th>
	                            <th style="width: 20%">닉네임</th>
	                            <th style="width: 20%">이름</th>
	                            <th style="width: 20%">회원등급</th>
	                            <th style="width: 10%">신청서</th>
	                            <th style="width: 5%">관리</th>
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
	                            <td><button type="button" class="btn btnView" data-bs-toggle="modal" data-bs-target="#applyModal${applymt.applymtNo }">신청서</button></td>
	                            <td><button type="button" class="btn btnUpdate">변경</button></td>
	                            
									<!-- 모달 -->
									<div class="modal fade" id="applyModal${applymt.applymtNo }" tabindex="-1" aria-labelledby="applyModal" aria-hidden="true">
									  <div class="modal-dialog modal-dialog modal-dialog-scrollable"> <!-- 모달창 스크롤 -->
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="applyModalLabel">${applymt.member.memberNick } 님의 멘토 신청서</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <!-- 모달 내용 -->
									      <div class="modal-body">
									        	<p>Study Cloud 아이디</p>
									        	<p>${applymt.member.memberId }</p><hr>
									        	
									        	<p>이메일</p>
									        	<p>${applymt.member.memberEmail }</p><hr>
									        	
									        	<p>이름</p>
									        	<p>${applymt.member.memberName }</p><hr>
	
									        	<p>연락처</p>
									        	<p>${applymt.member.memberPhone }</p><hr>
	
									        	<p>희망분야</p>
									        	<p>${applymt.field }</p><hr>
	
									        	<p>소개글</p>
									        	<p>${applymt.applymtContent }
								        		</p>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary" id="btnOk">승인</button>
									        <button type="button" class="btn btn-secondary" id="btnCancel" data-bs-dismiss="modal">취소</button>
									      </div>
									    </div>
									  </div>
									</div>
	                        </tr>
							</c:forEach>
							        
	                    </tbody>
	                </table>
	            </div>
	          <span class="pull-right">total : ${paging.totalCount }</span>
			</div><!-- wrap end -->
		</form>
        </main>
    </div>
</div><!-- container -->

<c:import url="../layout/footer.jsp" />

</body>
</html>