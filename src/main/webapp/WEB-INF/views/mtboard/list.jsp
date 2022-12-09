<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토찾기</title>
<c:import url="../layout/header.jsp" /> 

<!-- css연결 -->
<link rel="stylesheet" href="/resources/css/mtBoardList.css?ver=2"> 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	var curPage = 1;    	
	console.log(curPage);
})


function pageMove(page_no) {
	$.ajax({
		type: "Get"
	   , url: "/mtboard/listPaging"
	   , data: {
		   curPage:page_no
	   }
	   , dataType: "html"
	   , success: function( p ) {
		   $("#listPaging").html(p)
	   }
		
	})
}
</script>



<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 멘토지원 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
	
			<p class="mentoring_txt">
				☁️ 당신의 지식을 함께 공유해 볼 수 있어요 ☁️
			</p>
	
		<a class="btn btn-primary" href ="/mtboard/mentoApply" type="button">멘토 지원하기</a>
	</div>
</div>

<main class="all_content">

<div class="content-container">

	<!-- 왼쪽 정렬 항목-->
	<div class="left_sort">
  
    <div class="field">
    <table class="field_tb">   
    <tr>
    <th>☁️ 분야 ☁️</th>
    </tr>
     
    <tr> 
  	<td>
  	<input type="checkbox" id="field_01" value="1">
  	<label>개발 · 프로그래밍</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_02" value="2">
  	<label>어학 · 외국어</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_03" value="3">
  	<label>직무 · 마케팅</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_04" value="4">
  	<label>커리어</label>
	</td>
	</tr>
	
	<tr>
	<td>
  	<input type="checkbox" id="field_05" value="5">
  	<label>기타</label>
	</td>
	</tr>
	</table>
	</div>
	
	
	<a href="/mtboard/list" class="field_reset">
	<i class="fa-solid fa-arrow-rotate-right"></i>
	초기화 
	</a>
	</div> <!-- 왼쪽정렬 항목 끝 -->
	
	


<div class="right_sort">
<div class="container_rdo">

<div class="radio_bt">	
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">최신순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
  <label class="form-check-label" for="flexRadioDefault2">후기 많은 순</label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
  <label class="form-check-label" for="flexRadioDefault2">좋아요순</label>
</div>
</div>

  

<div id="listPaging">
<c:import url="/WEB-INF/views/mtboard/listPaging.jsp?ver=2" />
</div>

</div><!-- .글목록container -->
</div> <!-- right -->

	<!-- <!-- 검색바 -->
  <div class="container-fluid">
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search"
      onfocus="this.placeholder=''" onblur="this.placeholder='검색어를 입력하세요'">
      <button class="btn" type="submit">☁️</button>
    </form>
  </div>

</div> <!-- container --> 



</main>
</main>

<c:import url="../layout/footer.jsp" />  
</body>
</html>