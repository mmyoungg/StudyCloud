<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>       
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

.content { width: 1000px; margin: 40px auto; }
table { text-align: center; margin: 10px auto;}
thead { background-color: #AACDE5; }
#check { margin: 10px 5px auto;}
#check-in { margin: 0 15px 0 15px; }
#searchBar { margin: 0 11px 0 500px; width: 250px;}
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.change { accent-color: red; }
.fBoard_top_logo img { width: 1000px; height: 300px; margin-bottom: 50px; }
.button-menu { margin: 0 auto; width: 1100px; text-align: center; padding: 30px; }
.button-op { padding: 40px; color: #6cc4dc; --bs-btn-border-radius: .5rem; }
.btn { background-color:  #6cc4dc; }

</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#writeBtn").click(function() {
		location.href="/freeBoard/write"
	})	
})

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


<form class="row gy-2 gx-3 align-items-center" id="check">

<div class="form-check col-auto" id="check-in">
  <input class="form-check-input change" type="checkbox" value="" id="titlecheck">
  <label class="form-check-label" for="titlecheck">제목</label>
</div>
<div class="form-check col-auto" id="check-in">
  <input class="form-check-input" type="checkbox" value="" id="titleContentcheck">
  <label class="form-check-label" for="titleContentcheck">제목+내용</label>
</div>
<div class="form-check col-auto" id="check-in">
  <input class="form-check-input" type="checkbox" value="" id="writercheck">
  <label class="form-check-label" for="writercheck">작성자</label>
</div>

<div class="align-items-center" id="searchBar">
  <div class="col-auto">
    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" placeholder="검색어를 입력하세요">
  </div>
</div>

<button class="col-auto button" type="button">검색</button>



</form>

<table class="table">
	<thead>
	<tr>
		<th scope="col">No.</th>
		<th scope="col">카테고리</th>
		<th scope="col">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">조회수</th>
		<th scope="col">등록일</th>
	</tr>
	</thead>
	
	<tbody>
    <tr>
      <th scope="row">1</th>
      <td>가입인사</td>
      <td>안녕하세요!</td>
      <td>자바초보</td>
      <td>0</td>
      <td>2022-11-16</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>질문</td>
      <td>자바스크립트 공부 어떻게 하시나요?</td>
      <td>Apple</td>
      <td>1</td>
      <td>2022-11-16</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>잡담</td>
      <td>요새 날씨가 너무 춥네요ㅠㅠ</td>
      <td>오쪼쪼</td>
      <td>11</td>
      <td>2022-11-15</td>
    </tr>
  </tbody>
</table>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="me-md-2 button" type="button" id="writeBtn">글쓰기</button>
</div>
</div>



</body>
</html>