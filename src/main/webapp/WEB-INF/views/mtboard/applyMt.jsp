<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 지원폼</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/applyMt.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#apply_btn").click(function() {
		
		$("form").submit();
	})
})
</script>
</head>
<body>

<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
		<p class="mentoring_txt">
			☁️ 나누고 싶은 지식을 가진 누구나 멘토가 될 수 있어요! ☁️<br>
			자신만의 노하우를 널리 알려주세요
		</p>
		<a class="btn btn-primary" href="/mtboard/mentoApply" type="button">멘토 지원하기</a>
	</div>
</div>

<main class="all_content">
<form action="./applyMt" method="post" enctype="multipart/form-data">
<div class="applyForm">
<div class="naming">Study Cloud 아이디
<input class="form-control" type="text" aria-label="default input example" id="memberId" name="memberId" style="margin-top: 5px; font-size: 13px" value="${member_id}" readonly="readonly"></div>
<div class="naming">이메일
<input class="form-control" type="text" aria-label="default input example" id="memberEmail" name="memberEmail" style="margin-top: 5px; font-size: 13px" value="${member_email}" readonly="readonly"></div>
<div class="naming">이름
<input class="form-control" type="text" aria-label="default input example" id="memberName" name="memberName" style="margin-top: 5px; font-size: 13px" value="${member_name}" readonly="readonly"></div>
<div class="naming">연락처
<input class="form-control" type="text" aria-label="default input example" id="memberPhone" name="memberPhone" style="margin-top: 5px; font-size: 13px" value="${member_phone}" readonly="readonly"></div>

<div class="naming">분야
<select class="form-select" aria-label="Default select example" id="field" name="field" style="margin-top: 5px; font-size: 13px">
  <option>개발 · 프로그래밍</option>
   <option>어학 · 외국어</option>
  <option>직무 · 마케팅</option>
  <option>커리어</option>
  <option>기타</option>
</select>
</div>

<div class="naming">간단한 자기소개 글을 작성해주세요
<textarea class="form-control" id="applymtContent" name="applymtContent" rows="10" style="margin-top: 6px;"></textarea>

<!-- Modal 제출완료-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px">
      <div class="modal-header" style="border: none;">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: center;">
      <h5>☁️ 제출이 완료 되었습니다 ☁️</h5>
      </div>
      <div class="modal-footer" style="background-color: #e3eff9; border-top: none;">
        <a class="btn btn-primary" href="/mtboard/list" type="button" id="ok_btn">확인</a>
      </div>
    </div>
  </div>
</div>

 <!-- Modal 중복제출 화면구현 해야됨--> 
<!--<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px" >
      <div class="modal-header" style="border: none;">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: center;">
      <h5>☁️ 이미 등록된 멘토입니다 ☁️</h5>
      </div>
      <div class="modal-footer" style="background-color: #e3eff9; border-top: none;">
        <a class="btn btn-primary" href ="/mtboard/list" type="button" id="ok_btn">확인</a>
      </div>
    </div>
  </div>
</div> -->

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="apply_btn">제출하기</button>
</div>

</div>
</form>
</main>

</main>

<c:import url="../layout/footer.jsp" /> 
</body>
</html>