<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content { width: 1000px; margin: 70px auto; }
label{ text-align: center; }
form { margin: 40px 5px auto;}

.sRoom_insert_btn { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.sRoom_insert_btn_cancel { border: 2px solid #6CC4DC; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: #6CC4DC; background-color: white;}
.sRoom_insert_wrap { font-size: 14px; }	  
</style>

</head>
<body>

<div class="content">
<div class="sRoom_insert_wrap">
<h5>스터디룸 등록</h5>

<form name="form" action="/admin/sRoominsert" method="post" enctype="multipart/form-data">

<div class="mb-3 row">
	<label for="sRoom_name" class="col-sm-2 col-form-label">스터디룸 이름</label>
    <div class="col-sm-10">
    	<input type="text" class="form-control" id="sRoom_name" name="sRoom_name">
    </div>
</div>
    
<div class="mb-3 row">
	<label for="sRoom_addr" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
    	<input type="text" class="form-control" id="sRoom_addr" name="sRoom_addr">
    </div>
</div>

<div class="mb-3 row input-group">
	<label for="sRoom_price" class="col-sm-2 col-form-label">가격 (원/시간)</label>
    <div class="col-sm-4" style="margin-left: 2px;">
    	<input type="text" class="form-control" id="sRoom_price" name="sRoom_price">
    </div>
    
	<label for="sRoom_people" class="col-sm-2 col-form-label">인원</label>
    <div class="col-sm-4">
    	<input type="text" class="form-control" id="sRoom_people" name="sRoom_people" style="width: 330px;">
    </div>
</div>

<div class="mb-3 row">
	<label for="sRoom_intro" class="col-sm-2 col-form-label">공간소개</label>
  	<div class="col-sm-10">
  		<textarea class="form-control" id="sRoom_intro" name="sRoom_intro" rows="10"></textarea>
  	</div>
</div>

<div class="mb-3 row">
	<label for="sRoom_role" class="col-sm-2 col-form-label">이용&환불규정</label>
    <div class="col-sm-10">
  		<textarea class="form-control" id="sRoom_role" name="sRoom_role" rows="10"></textarea>
  	</div>
</div>

<div class="mb-3 row">
	<label for="sRoom_image" class="col-sm-2 col-form-label">파일첨부</label>
	<div class="col-sm-10">
		<input class="form-control" type="file" id="sRoom_image" name="sRoom_image" style="width: 280px;">
	</div>	
</div>	

<div class="text-center" style="margin-top: 70px;">
	<button id="insert" class="sRoom_insert_btn">등록</button>
	<button id="cancel" class="sRoom_insert_btn_cancel">취소</button>
</div>

</form>

</div>
</div>

</body>
</html>