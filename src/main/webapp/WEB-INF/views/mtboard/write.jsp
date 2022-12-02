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
<script src="../resources/js/mtBoardWrite.js?ver=3"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<!-- 플랫피커 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

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

 <!-- 플랫피커 -->
<!--<div class="form-group">
<label for="date">&nbsp;<img src="https://ifh.cc/g/DKHHRY.png" style="width: 20px; margin-left: 5px; margin-bottom: 3px;">
일정 선택<span class="rq">*</span></label>
<input type="text" id="date" name="date" class="form-control" placeholder="날짜를 선택하세요"  style="margin-top: 3px; font-size: 13px">
</div>
 -->

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

</script>
</form>


</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>