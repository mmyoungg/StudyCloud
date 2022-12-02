<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp" />       

<style type="text/css">

.content { width: 1000px; margin: 40px auto; }
table { text-align: center; margin: 10px auto;}
thead { background-color: #AACDE5; }
table a { text-decoration: none; color: #282828; }
table a:hover { color: #3f92b7 }
#fBoard-check { margin: 10px 5px auto; position: relative;}
#fBoard-check-in { margin: 0 15px 0 15px; }
#fBoard-searchBar { margin: 0 11px 10px 500px; width: 250px; position: absolute; right: 65px; }
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin-bottom: 18px; 
		  border-radius: 5px; color: white; right: 0; position: absolute; }
.change { accent-color: red; }
.fBoard_top_logo img { width: 1000px; height: 300px; margin-bottom: 50px; }
.button-menu { margin: 0 auto; width: 1100px; text-align: center; padding: 30px; }
.button-op { padding: 40px; color: #6cc4dc; --bs-btn-border-radius: .5rem; }
.btn { background-color:  #6cc4dc; }
.fBoard-write-button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  				border-radius: 5px; color: white; }
		  				
/* 페이징 CSS */		  				
.page-link { color: #282828; }
.page-link:hover { background-color: #e3eff9; }
.active>.page-link { background-color: #3f92b7; border-color: #3f92b7; }

</style>

<script type="text/javascript">
$(document).ready(function() {
	var pageNo = ${paging.curPage};
	console.log(pageNo); // 현재페이지 확인
	pagingAjax(pageNo);	
	
	$("#writeBtn").click(function() {
		location.href="/freeBoard/write"
	})
})		

function pagingAjax(pageNo) {
	var page_no = pageNo;
	console.log(page_no);
	
	$.ajax({
		type:"GET",
		url: "/freeBoard/listAjax",
		dataType: "html", 
		data : {curPage: page_no},
		success : function(r){
		console.log('성공..?');
			$("#fBoard_content").html(r);
		} 
	})
}
	


</script>


</head>
<body>
<div class="content">

<div class="button-menu">
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">자유게시판💭</button>
		</span>
		<span class="button-op">
			<button type="button" class="btn" data-bs-toggle="button" style="color: #ffffff">번개게시판⚡</button>
		</span>
</div>

<div class="sRoom_list_top">
	<h5 style="color: #6cc4dc;">💭<strong>자유게시판</strong></h5>
</div>


<div class="fBoard_top_logo">
	<img src="https://ifh.cc/g/sjLaXa.jpg">
</div>


<form class="row gy-2 gx-3 align-items-center" id="fBoard-check">

<div class="form-check col-auto" id="fBoard-check-in">
  <input class="form-check-input change" type="checkbox" value="" id="titlecheck">
  <label class="form-check-label" for="titlecheck">제목</label>
</div>
<div class="form-check col-auto" id="fBoard-check-in">
  <input class="form-check-input" type="checkbox" value="" id="titleContentcheck">
  <label class="form-check-label" for="titleContentcheck">제목+내용</label>
</div>
<div class="form-check col-auto" id="fBoard-check-in">
  <input class="form-check-input" type="checkbox" value="" id="writercheck">
  <label class="form-check-label" for="writercheck">작성자</label>
</div>

<div class="align-items-center" id="fBoard-searchBar">
  <div class="col-auto">
    <input type="text" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" placeholder="검색어를 입력하세요">
  </div>
</div>

<button class="col-auto button" type="button">검색</button>

</form>
<div id="fBoard_content"></div>
<%-- <c:import url="/WEB-INF/views/freeBoard/listAjax.jsp" /> --%>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="me-md-2 fBoard-write-button" type="button" id="writeBtn">글쓰기</button>
</div>
</div>



</body>
</html>