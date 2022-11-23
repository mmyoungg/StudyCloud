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
<link rel="stylesheet" href="/resources/css/mtBoardWrite.css">   
<script src="../resources/js/mtBoardWrite.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>

<!-- 데이트피커 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>

<!-- 라이브러리 추가 예정 -->
<!-- <script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

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
 -->


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

<div class="naming">&nbsp;이메일<span class="rq"> *</span>
<input class="form-control" type="text" placeholder="이메일 주소를 입력해주세요"  style="margin-top: 3px; font-size: 13px"></div>
<div class="naming">&nbsp;이름<span class="rq"> *</span>
<input class="form-control" type="text" placeholder="실명을 입력해주세요"  style="margin-top: 3px; font-size: 13px"></div>


<div class="naming">&nbsp;분야<span class="rq"> *</span>
<select class="form-select"  id="apply_fd" style="margin-top: 3px; font-size: 13px">
  <option selected value="1">개발 · 프로그래밍</option>
  <option value="2">어학 · 외국어</option>
  <option value="3">직무 · 마케팅</option>
  <option value="4">커리어</option>
  <option value="5">기타</option>
</select>
</div>

<br><br><br>
<h6 style="font-weight: bold; padding-bottom: 20px">&nbsp;멘토링 정보</h6>


<div class="naming">&nbsp;직군<span class="rq"> *</span>
<select class="form-select form-select-sm" onchange="selectChange(this)">
  <option>선택</option>
  <option value="1">개발</option>
  <option value="2">디자인</option>
  <option value="3">마케팅</option>
  <option value="4">경영/인사</option>
</select>
</div>

<div class="naming">&nbsp;직무<span class="rq"> *</span>
<select id="select2" class="form-select form-select-sm">
 	<option>선택</option>
</select>
</div>

<div class="naming">&nbsp;경력<span class="rq"> *</span>
<select class="form-select form-select-sm">
  <option>선택</option>
  <option value="1">신입 (1년이하)</option>
  <option value="2">주니어 (1~3년)</option>
  <option value="3">미들 (4~8년)</option>
  <option value="4">시니어 (9년이상)</option>
</select>
</div>


<div class="naming">&nbsp;현직
<input class="form-control" type="text" placeholder="현재 근무하는 회사명을 적어주세요"  style="margin-top: 3px; font-size: 13px"></div>

<div class="naming">&nbsp;가격<span class="rq"> *</span>
<p>&nbsp;(원 / 5000원이상)</p>
<input class="form-control" type="text" placeholder="ex. 10,000원"  style="margin-top: 3px; font-size: 13px"></div>

<!-- 데이트피커 -->
<div class="naming">
<i class="fa-solid fa-calendar-days"></i>&nbsp;멘토링 가능 일정<span class="rq"> *</span>
<input class="form-control datepicker" id="date_pk">
</div>

<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>

<div class="naming">&nbsp;시간<span class="rq"> *</span><p>&nbsp;(1시간단위 / 중복가능)</p>
<select class="form-select"  id="time_select">
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
<div class="naming">&nbsp;제목
<input class="form-control" type="text" placeholder="제목을 입력해주세요"  style="margin-top: 5px; font-size: 13px"></div>

<!-- 라이브러리 추가예정 -->
<!-- <script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script> -->

<div class="form">
	<label for="file">&nbsp;첨부파일</label>
	<input type="file" id="file" name="file">
</div>
<br><br><br>
</div><!-- 스크롤바 -->


<div class="btn-zip">
 <a class="btn btn-primary" href="/mtboard/list" role="button">닫기</a>
 <!-- 글전송 구현해야됨 -->
 <a class="btn btn-primary" role="button">등록</a>
</div>

</div><!-- write_form 끝 -->

</form>
</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>