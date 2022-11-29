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
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		//작성된 내용을 #content에 반영
		updateContents();
		
		$("form").submit();
	})
	
})

function updateContents() {
	// 작성된 내용을 #content에 반영
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


<br>

<div class="form-group">
<label for="title">&nbsp;제목<span class="rq">*</span></label>
<input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력해주세요"  style="margin-top: 5px; font-size: 13px"></div>

<div class="form-group">
<label for="content">소개글을 작성 해주세요<span class="rq">*</span></label>
<textarea id="content" name="content" rows="11"></textarea>
</div>


<!-- 서블릿컨텍스트에 멀티파트 설정 해줘야됨 -->
<div class="form-group">
	<label for="file"></label>
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

$(function() {
    $('#startDatePicker').datepicker();
});

$(function() {
    $('#endDatePicker').datepicker();
});

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 'yy-mm-dd' 를 보편적으로 사용
    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    yearSuffix: '년',	
    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
    buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
    buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
    buttonText: "Select date"	// 조그만한 아이콘 툴팁
});

</script>
</form>


</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>