<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">
.header-box {
	color: white;
	height: 200%;
	background-color: #aacde5;
	text-align: center;
	padding: 60px;
/* 	margin: 20%; */
}

.container{
	margin: 0 auto;
	width: 950px;
	margin-top: 30px;
}

.form-control{
	background-color:  #f2f2f2; 
	border: #171214;
	text-align: center;
	
}

 .btn { 
 	background-color: #aacde5; 
 	border: none;
/* 	margin: 0 auto; */
/* 	justify-content: center; */
/* } */

/* .btn btn-secondary { */
/* 	border: none; */
/* 	background-color: #aacde5; */
/* } */
}

.button {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	
}

</style>

<body>

<div class="whole">
	<div class="header-box">
		번개 스터디를 만들어보세요!⚡<br>
		Publish the Flash-Gathering!
	</div>

<form action="">
	<div class="container">
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label"></label>
  			<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
		</div>
		
		<div class="mb-3">
  			<label for="exampleFormControlTextarea1" class="form-label"></label>
  			<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="내용을 입력하세요"></textarea>
		</div>
		
		<div class="mb-3">
  			<label for="formFileSm" class="form-label"></label>
 			<input class="form-control form-control-sm" id="formFileSm" type="file">
		</div>
		
		<div class="button">
<!-- 			<button type="button" class="btn" type="submit">등록하기</button> -->
			<input type="submit" id="submit" class="btn btn-secondary" value="등록하기" style="margin-right: 5px;">
			<input type="reset" id="cancel" class="btn btn-secondary" value="취소하기" style="margin-left: 5px;">
		</div>
		
	</div>
</form>

</div>
	
</body>
</html>