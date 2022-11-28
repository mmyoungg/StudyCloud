<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>       
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<style type="text/css">
.content { width: 1000px; margin: 70px auto; }
label{ text-align: center; }
form { margin: 40px 5px auto;}
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }

</style>
<script type="text/javascript"></script>

</head>
<body>

<div class="content">
<h2>자유게시판</h2>

<form name="form" action="./write" method="post" enctype="multipart/form-data">

  <div class="mb-3 row">
    <label for="id" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-8">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="작성자닉네임">
    </div>
  </div>
  
  <div class="mb-3 row">
    <label for="category" class="col-sm-2 col-form-label">카테고리</label>
    <div class="col-sm-10">
     <!--  <input type="text" class="form-control" id="title"> -->
     <select class="form-select" aria-label="Default select example">
 		<option selected>카테고리 선택</option>
  		<option value="1">잡담</option>
  		<option value="2">질문</option>
  		<option value="3">가입인사</option>
	 </select>
    </div>
  </div>
  
  <div class="mb-3 row">
    <label for="title" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="title">
    </div>
  </div>
  
  <div class="mb-3">
  <textarea class="form-control" id="content" rows="10"></textarea>
</div>
  

<div class="mb-3">
	<input class="form-control" type="file" id="file" multiple>
</div>

<div class="text-center">
	<button id="writeBtn" class="button">글쓰기</button>
	<button id="cancel" class="button">취소</button>
</div>


</form>


</div>

</body>
</html>