<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>StudyCloud☁️</title>
<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript">
// 글자 수 제한 
$(document).ready(function() {
	$('.commentbox').keyup(function () {
		var content = $(this).val();
		$('#counter').html("("+content.length+"/ 최대 200자"+")");  //글자수 실시간 카운트
		
		if (content.length > 200) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0,200));
			$('#counter').html("(200 / 최대 200자)");
		}
	});
});
</script>


<script type="text/javascript">

//입력하지 않고 제출할 시
function check() {
	
	var form = document.userInfo;
	
	if (!form.username.value){
		alert("이름을 입력하세요.")
		return false;
	}
		
	if (!form.userage.value){
		alert("나이를 입력하세요.")
		return false;
	}
	
	if (!form.usershelter.value){
		alert("거주하는 지역을 입력하세요.")
		return false;
	}
	
	if (!form.userjob.value){
		alert("직업을 입력하세요")
		return false;
	}
	
	if (!form.usermotto.value){
		alert("스터디에 참여하고 싶은 이유와 한 줄 포부를 입력하세요.")
		return false;
	}
}

	
// 		$(document).ready(function() {
// 		 	$("#btnApply").click(function() {
// 		 		confirm("신청이 성공적으로 완료되었습니다! 스터디 개설자의 수락 후 [마이페이지->나의 스터디]에서 신청 내역을 확인하실 수 있습니다.");
// 		 	})
// 		 })
		
	
	
// 	const applyFormModal = document.getElementById('applyFormModal')
// 	applyFormModal.addEventListener('show.bs.modal', event => {
// 	  // Button that triggered the modal
// 	  const button = event.relatedTarget
// 	  // Extract info from data-bs-* attributes
// 	  const recipient = button.getAttribute('data-bs-whatever')
// 	  // If necessary, you could initiate an AJAX request here
// 	  // and then do the updating in a callback.
// 	  //
// 	  // Update the modal's content.
// 	  const modalTitle = applyFormModal.querySelector('.modal-title')
// 	  const modalBodyInput = applyFormModal.querySelector('.modal-body input')

// 	  modalTitle.textContent = `${member_name}님이 스터디를 신청하였습니다.`
// 	  modalBodyInput.value = member_name
// 	})
	
	
</script>

<script type="text/javascript">
신청서 제출 완료 시
 $(document).ready(function() {
 	$("#btnApply").click(function() {
		if (return true;) {
 		confirm("신청이 성공적으로 완료되었습니다! 스터디 개설자의 수락 후 [마이페이지->나의 스터디]에서 신청 내역을 확인하실 수 있습니다.");
		}
 	})
 })

</script>





<style type="text/css">

@media (max-width:800px){
	.left, .main, .right {
	
	width:100%; 
	}
	
}

.header-box {
	color: white;
	height: 200%;
	background-color: #aacde5;
	text-align: center;
	padding: 60px;
/* 	margin: 20%; */
}

.whole1 {
	margin: 0 auto;
	margin-top: 4%;
	width: 900px;
	display: flex;
}

.content {
/* 	float: left; */
	
}

img {
	width : 36px;
	height: 36px;
	filter: invert(46%) sepia(93%) saturate(308%) hue-rotate(153deg) brightness(94%) contrast(87%);
}

.con-detail {
	width: 100%;
	margin-top: 3%;
	margin-bottom: 3%;
}

.con-detail-1 {
/* 	margin-left: 10%; */
	padding-left: 2%;
}

hr{
	margin-top:20px;
	margin-bottom: 20px;
}

.box1 {
	margin-top: 7%;
}

.publisher-comment {
	margin-bottom: 40px;
}

.button-bar {
	justify-content: center;
	display: flex;
}

.con-detail-2 {
	padding-left: 2px;
}

.button {
	margin-left: 30px;
	margin-right: 30px;
	
}

.whole2 {
	margin-top: 4%;
	background-color: #e3eff9;
	height: 500px;
	border-top: 1px solid #f1f3f5;
}	

.container2 {
	margin: 0 auto;
	width: 900px;
	margin-top: 20px;
	padding-left: 3px;
	padding-right: 3px;
}

.form-control{
	background-color:  #f2f2f2; 
	border: #171214;
	text-align: center;
	
}

.commentbox {
	border-color: #dad6d6;
	$box-shadow:  0 .5rem 1rem rgba($black, .15);
}

textarea {
	resize: none;
	border: none;
	box-shadow: 1px 1px 7px #CFCFCF;
/* 	border-radius: 0.5rem; */
	background-color: #FAFAFA;
	
}

textarea:focus {
	outline: none;
	outline-color: 2px solid #aacde5;
}

:root {
	--bs-body-color: #60392a; 
}






</style>


</head>
<body>

<div class="header-box">
		다양한 스터디에 참여해보세요!<br>
		Join the Studies!
</div>


<section class="whole1">
	
	<div class="container">
			<h2>${detailSboard.STUDY_TITLE }</h2>
			<br>
			<div class="content">
				<div class="con-detail">
					<div class="title">
					<img src="/resources/se2/img/users-solid.svg">
					<span class="con-detail-1" id="people" name="people">${detailSboard.STUDY_PEOPLE }명</span>
					</div>
				</div>
				
				<div class="con-detail">
					<div class="location">
					<img src="/resources/se2/img/location-dot-solid.svg">
					<span class="con-detail-1" id="location" name="location">${detailSboard.STUDY_ADDRESS }</span>
					</div>
				</div>
				
				<div class="con-detail">
					<div class="day">
					<img src="/resources/se2/img/calendar-days-solid.svg">
					<span class="con-detail-1" id="day" name="day">${detailSboard.STUDY_DATE }</span>
					</div>
				</div>
				
				<div class="con-detail">
					<div class="time">
					<img src="/resources/se2/img/clock-regular.svg">
					<span class="con-detail-1" id="time" name="time">${detailSboard.STUDY_TIME }</span>
					</div>				
				</div>
				
				<div class="box1">개설자의 말💁‍♂️</div>
				<hr>
				<div class="publisher-comment">
					${detailSboard.STUDY_NOTIFY }
				</div>
				
				<div class="button-bar">
				
					<div class="button" style="float: left; padding-top: 3px;">
						<img src="/resources/se2/img/heart-regular.svg" style="width: 20px; height: 20px">
						<span class="con-detail-2" style="font-size:14px;">찜하기</span>
					</div>
					
					<div class="button" style="float: left;">
						<button type="button" class="btn btn-primary" 
							data-bs-toggle="modal" data-bs-target="#applyFormModal" data-bs-whatever="@getbootstrap" data-bs-target="#staticBackdrop"
							style="background-color: #6cc4dc; border: none;">신청하기</button> 
					</div>
					
					<div class="button" style="padding-top: 3px;">
						<img src="/resources/se2/img/share-nodes-solid.svg" style="width: 20px; height: 20px">
						<span class="con-detail-2" style="font-size:14px;">공유하기</span>
					</div>
					
<!-- 스터디 신청 폼 모달 -->
<div class="modal fade" id="applyFormModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">스터디 신청을 환영합니다!</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<form action="/detail/enroll" method="get" class="applyform" name="userInfo" onsubmit="return check()">
			<div class="modal-body">
					<div class="input-group mb-3">
						<span class="input-group-text">✔️</span>
						<div class="form-floating">
							<input type="text" class="form-control" id="username" placeholder="성함을 입력해주세요"> 
							<label for="floatingInputGroup1">성함을 입력해주세요.</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">❓</span>
						<div class="form-floating">
							<input type="text" class="form-control" id="userage" placeholder="나이를 입력해주세요"> 
							<label for="floatingInputGroup1">나이를 입력해주세요.</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">🏠</span>
						<div class="form-floating">
							<input type="text" class="form-control" id="usershelter" placeholder="거주하는 지역을 입력해주세요"> 
							<label for="floatingInputGroup1">거주하는 지역을 입력해주세요.</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">👨</label>
						<select class="form-select" id="userjob" style="background-color: #F2F2F2; height: 60px; border: none;">
							<option selected>어떤 일을 하시나요?</option>
							<option value="1">학생</option>
							<option value="2">취준생</option>
							<option value="3">직장인</option>
							<option value="4">군인</option>
							<option value="5">주부</option>
							<option value="5">기타</option>
						</select>
					</div>
					<br>
					<div class="form-floating">
						<textarea class="form-control" id="usermotto" style="height: 100px;"></textarea>
						<label for="floatingTextarea2">스터디에 참여하고 싶은 이유와 한 줄 포부를 작성해주세요.</label>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="btnCancel" data-bs-dismiss="modal" style="border: none;">취소</button>
				<input class="btn btn-primary" type="submit" value="신청하기" id="btnApply" style="background-color: #6cc4dc; border: none;" data-bs-target="#exampleModalToggle2">
<!-- 				<button type="button" class="btn btn-primary" id="btnApply" style="background-color: #6cc4dc; border: none;">신청하기</button> -->
			</div>
				</form>
<!-- 			</form> -->
		</div>
	</div>
</div><!-- 첫번째 모달 끝 -->

<!-- 두번째 모달 -->
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Modal 2</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Hide this modal and show the first with the button below.
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Back to first</button>
      </div>
    </div>
  </div>
</div>







				</div>
			</div>
		</div>
</section>
		
<!-- 				<div class="whole2"> -->
<!-- 					<div class="container2"> -->
<!-- 						<div class="mb-3"> -->
<!--   							<label for="exampleFormControlTextarea1" class="form-label"></label> -->
<!--   							<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="내용을 입력하세요"></textarea> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 댓글 부분 -->
<section class="whole2"> 
 		<div class="container2"> 
 			<div class="mb-3">
 				
 				<div class="comment-box">
 					<form name="commentInsertForm" method="post" enctype="multipart/form-data">				
 					<div class="comtitle"><h3 style="color: #C1C2C2">Comments</h3></div>
 					<div class="cominput">
 						<textarea class="commentbox" name="com-content"  style="width: 894px; height: 200px;"></textarea>
 					
 					<div class="com2">
 						<div class="com-btn" style="float: right;">
 							<button type="button" class="btn btn-primary btn-sm" style="background-color: #6cc4dc; border: none;">댓글 등록</button>
 						</div>
 						
 						<span style="color: #aaa; font-size: 14px;" id="counter">(0 / 최대 200자)</span>
 					</div>
 					</div>
 					</form>
 				</div>
 				
 			</div>
 		</div> 
</section>

<c:import url="../layout/footer.jsp" />
</body>
</html>