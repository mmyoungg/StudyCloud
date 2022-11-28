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

.reserve_tb { width: 100%; }
.reserve_th { padding: 15px 20px 10px 10px; font-size: 20px; font-weight: bold; color: #3f92b7; }
.reserve_tb td { padding: 0 20px 10px 10px; }
input[type='checkbox'] { width:20px; height:20px; background:white; border-radius:5px;
    					 border:2px solid #555; margin-top: 1%; }
.reserve_info_wrap { margin: 70px 0 40px 0; }
.detail-reserve-button { background-color: #6CC4DC; border: 0; width: 325px; padding: 10px; margin: 30px 0 10px 10px; 
		  border-radius: 5px; color: white; }

</style>
<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('reserve_checked');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
	
function payCheck() {
  	
	var payCheck = document.getElementById("reserve_checked");

	if( payCheck.checked == false ) {  
		 alert("결제약관 필수사항을 모두 체크해주세요."); 
		 return false; 
	}
} 	
</script>

</head>
<body>

<div class="content">
<div class="reserve_info_wrap">
<h2>예악자 정보</h2>
<hr>

<form name="form" action="./write" method="post" enctype="multipart/form-data">

  <div class="mb-3 row">
    <label for="reserve_name" class="col-sm-2 col-form-label">성함</label>
    <div class="col-sm-8">
      <input type="text" readonly class="form-control-plaintext" id="reserve_name" value="예약자 이름">
    </div>
  </div>
    
  <div class="mb-3 row">
    <label for="reserve_phone" class="col-sm-2 col-form-label">연락처</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="reserve_phone">
    </div>
  </div>
  
  <div class="mb-3 row">
   <label for="reserve_request" class="col-sm-2 col-form-label">요청사항</label>
  	<div class="col-sm-10">
  		<textarea class="form-control" id="content" rows="6"></textarea>
  	</div>
  </div>


<div class="reserve_info_wrap">
  <h2>예약 정보</h2>
  <hr>
  
  <table class="reserve_tb">
  <tr>
  	<td class="reserve_th">스터디룸 이름</td>
  	<td class="reserve_th">예약 날짜</td>
  </tr>
  <tr>
  	<td>스터디룸 이름</td>
  	<td>2022-11-08</td>
  </tr>
  <tr></tr>
  <tr>
  	<td class="reserve_th">예약 시간</td>
  	<td class="reserve_th">예약 인원</td>
  </tr>
  <tr>
  	<td>11:00~13:00</td>
  	<td>4명</td>
  </tr>
  
  </table>
</div>   
 
 <div class="reserve_info_wrap">
  <h2>서비스 동의</h2>
  <hr>
  
  <div class="reserve_info_wrap"> 
	  <input type='checkbox' name="reserve_checked" id="reserve_checked" value="selectall" onclick="selectAll(this)" /> <b>전체동의</b><br/> 
	  <input type='checkbox' name="reserve_checked" id="reserve_checked" value="checked_ok" /> 예약조건 확인 및 결제진행 동의 (필수)<br/>
	  <input type='checkbox' name="reserve_checked" id="reserve_checked" value="checked_ok" /> 환불규정 안내에 대한 동의 (필수)<br/> 
	  <input type='checkbox' name="reserve_checked" id="reserve_checked" value="checked_ok" /> 개인정보 제 3자 제공 동의 (필수)<br/> 
	  <input type='checkbox' name="reserve_checked" id="reserve_checked" value="checked_ok" /> 개인정보 수집 및 이용 동의 (필수)<br/>
  </div>
 </div> 

<div class="text-center">
	<button id="writeBtn" class="detail-reserve-button">결제하기</button>
</div>


</form>

</div>
</div>

</body>
</html>