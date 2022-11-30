<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ include file="../layout/adminHeader.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 스마트 에디터 2 로드 -->
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

<div class="container">

<div class="content">
<div class="sRoom_insert_wrap">
<h5>스터디룸 등록</h5>

<form action="/admin/sRoominsert" method="post" enctype="multipart/form-data"> <!-- 첨부파일 첨부 -->

<div class="mb-3 row form-group">
	<label for="sroom_name" class="col-sm-2 col-form-label">스터디룸 이름</label>
    <div class="col-sm-10">
    	<input type="text" class="form-control" id="sroom_name" name="sroom_name">
    </div>
</div>
    
<div class="mb-3 row form-group">
	<label for="sroom_addr" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
    	<input type="text" class="form-control" id="sroom_addr" name="sroom_addr">
    </div>
</div>

<div class="mb-3 row input-group">
	<label for="sroom_price" class="col-sm-2 col-form-label">가격 (원/시간)</label>
    <div class="col-sm-4" style="margin-left: 2px;">
    	<input type="text" class="form-control" id="sroom_price" name="sroom_price">
    </div>
    
	<label for="sroom_people" class="col-sm-2 col-form-label">인원</label>
    <div class="col-sm-4">
    	<input type="text" class="form-control" id="sroom_people" name="sroom_people" style="width: 330px;">
    </div>
</div>

<div class="mb-3 row form-group">
	<label for="sroom_info" class="col-sm-2 col-form-label">공간소개</label>
  	<div class="col-sm-10">
  		<textarea class="form-control" id="sroom_info" name="sroom_info" rows="10"></textarea>
  	</div>
</div>

<div class="mb-3 row form-group">
	<label for="sroom_role" class="col-sm-2 col-form-label">이용&환불규정</label>
    <div class="col-sm-10">
  		<textarea class="form-control" id="sroom_role" name="sroom_role" rows="10"></textarea>
  	</div>
</div>

<div class="mb-3 row form-group">
	<label for="file" class="col-sm-2 col-form-label">파일첨부</label>
	<div class="col-sm-10">
		<input class="form-control" type="file" id="file" name="file" style="width: 280px;">
	</div>	
</div>	

<div class="text-center" style="margin-top: 70px;">
	<button id="btnWrite" class="sRoom_insert_btn">등록</button>
	<button id="btnCancel" class="sRoom_insert_btn_cancel">취소</button>
</div>

</form>

<!-- 스마트 에디터 스킨 적용 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</div>
</div>

</div><!-- container end -->



</body>
</html>