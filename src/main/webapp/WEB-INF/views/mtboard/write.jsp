<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" /> 
<link rel="stylesheet" href="/resources/se2/css/mtBoardWrite.css">   
<script src="../resources/js/mtBoardWrite.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>

<!-- 데이트피커 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		//스마트에디터에 작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>



<!-- content 전체 wrap -->
<main id="main">
<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
	
			
			<h1>☁️ ☁️ ☁️</h1>
			
	</div>
</div>

<main class="all_content">

<form action="./write" method="post" enctype="multipart/form-data">

<div id="write_form">
<p class="form_txt">멘토링 소개</p>
<br><br><br><br>


<!-- 스크롤바 -->
<div class="scroll_scope">

<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;기본 정보</h6>

<div class="form-group">
<label for="email">&nbsp;이메일<span class="rq">*</span></label>
<input class="form-control" id="email" name="email" type="text" placeholder="이메일 주소를 입력해주세요"  style="margin-top: 3px; font-size: 13px">
</div>

<div class="form-group">
<label for="name">&nbsp;이름<span class="rq">*</span></label>
<input class="form-control" id="name" name="name" type="text" placeholder="실명을 입력해주세요"  style="margin-top: 3px; font-size: 13px">
</div>

<div class="form-group">
<label for="field">&nbsp;분야<span class="rq">*</span></label>
<select class="form-select"  id="apply_fd" name="apply_fd" style="margin-top: 3px; font-size: 13px">
  <option selected value="1">개발 · 프로그래밍</option>
  <option value="2">어학 · 외국어</option>
  <option value="3">직무 · 마케팅</option>
  <option value="4">커리어</option>
  <option value="5">기타</option>
</select>
</div>

<br><br><br>
<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;멘토링 정보</h6>

<div class="form-group">
<label for="jobgroup">&nbsp;직군<span class="rq">*</span></label>
<select class="form-select form-select-sm" id="jobgroup" name="jobgroup" onchange="selectChange(this)">
  <option>선택</option>
  <option value="1">개발</option>
  <option value="2">디자인</option>
  <option value="3">마케팅</option>
  <option value="4">경영/인사</option>
</select>
</div>

<div class="form-group">
<label for="jobduty">&nbsp;직무<span class="rq">*</span></label>
<select id="jobduty" name="jobduty" class="form-select form-select-sm">
 	<option>선택</option>
</select>
</div>

<div class="form-group">
<label for="career">&nbsp;경력<span class="rq">*</span></label>
<select id="career" name="career" class="form-select form-select-sm">
  <option>선택</option>
  <option value="1">신입 (1년이하)</option>
  <option value="2">주니어 (1~3년)</option>
  <option value="3">미들 (4~8년)</option>
  <option value="4">시니어 (9년이상)</option>
</select>
</div>

<div class="form-group">
<label for="co">&nbsp;현직</label>
<input class="form-control" type="text" id="co" name="co" placeholder="현재 근무하는 회사명을 적어주세요"  style="margin-top: 3px; font-size: 13px"></div>

<div class="form-group">
<label for="price">&nbsp;가격<span class="rq">*</span></label>
<p>&nbsp;(원 / 5000원이상)</p>
<input class="form-control" type="text" id="price" name="price" placeholder="ex. 10,000원"  style="margin-top: 3px; font-size: 13px"></div>

<!-- 데이트피커 -->
<div class="form-group">
<label for="date_pk">
<i class="fa-solid fa-calendar-days"></i>&nbsp;멘토링 가능 일정<span class="rq">*</span></label>
<input class="form-control datepicker" id="date_pk" name="date_pk">
</div>

<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>

<div class="form-group">
<label for="time_sel">&nbsp;시간<span class="rq">*</span></label><p>&nbsp;(1시간단위 / 중복가능)</p>
<select class="form-select"  id="time_sel" name="time_sel">
  <option selected value="1">09:00 ~ 10:00</option>
  <option value="2">10:00 ~ 11:00</option>
  <option value="3">11:00 ~ 12:00</option>
  <option value="4">12:00 ~ 13:00</option>
  <option value="5">13:00 ~ 14:00</option>
  <option value="6">15:00 ~ 16:00</option>
  <option value="7">16:00 ~ 17:00</option>
  <option value="8">17:00 ~ 18:00</option>
  <option value="9">18:00 ~ 19:00</option>
  <option value="10">19:00 ~ 20:00</option>
  <option value="11">20:00 ~ 21:00</option>
  <option value="12">21:00 ~ 22:00</option>
  <option value="13">22:00 ~ 23:00</option>
  <option value="14">23:00 ~ 24:00</option>
</select>
</div>

<br><br><br>

<div class="form-group">
<label for="title">&nbsp;제목</label>
<input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력해주세요"  style="margin-top: 5px; font-size: 13px"></div>

<div class="form-group">
<label for="content">소개글을 작성 해주세요</label>
<textarea id="content" name="content" rows="11"></textarea>
</div>


<!-- 서블릿컨텍스트에 멀티파트 설정 해줘야됨 -->
<div class="form-group">
	<label for="file">&nbsp;첨부파일</label>
	<input type="file" id="file" name="file">
</div>
<br><br><br>

</div><!-- 스크롤바 -->

<div class="btn-zip">
<input type="reset" id="cancel" class="btn btn-primary" value="닫기">
 <!-- 글전송 구현해야됨 -->
 <button class="btn btn-primary" id="btnWrite">등록</button>
</div>

</div><!-- write_form 끝 -->

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>
</form>


</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>