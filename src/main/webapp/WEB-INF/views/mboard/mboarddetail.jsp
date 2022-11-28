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

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript">

//글자 수 제한 
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


<style type="text/css">

.header-box {
	color: white;
	height: 200%;
	background-color: #aacde5;
	text-align: center;
	padding: 60px;
/* 	margin: 20%; */
}

.whole1{
	margin: 0 auto;
	width: 950px;
/* 	border-bottom: 0.5px solid #aacde5; */
/* 	padding-bottom: 8px; */
}

.title {
	margin-top: 5%;
	padding-bottom: 15px;
	font-family: Pretendard;
	
}

.nav-detail {
/* 	padding-top: 5px; */
	text-decoration: none;
	height: 30px;
	border-bottom: 0.5px solid rgba(0,0,0,.1);
	padding-bottom: 40px;
	
}

.nav-info-detail {
	float: left;
	padding-right: 13px;;
	border-right: 1px solid rgba(0,0,0,.1);
	padding-left: 13px;
	font-size: 13px;
	color: 1px solid #aacde5;
}

.content {
	padding-top: 30px;
	padding-bottom: 10px;
}

.button-ms {
	float: right;
	margin-bottom: 40px;
/* 	background-color: #aacde5; */
}


.container2 {
	background-color: #f8f9fa;
	height: 500px;
	border-top: #f1f3f5;
	display: flex;
}	

.comment {
	margin: 0 auto;
	width: 950px;
	background-color: #f8f9fa;
	font-family: Pretendard;
	
}

.whole2 {
	margin-top: 4%;
	background-color: #e3eff9;
/* 	height: 500px; */
	border-top: 1px solid #f1f3f5;
}	

.container2 {
	margin: 0 auto;
	width: 900px;
	margin-top: 20px;
	padding-left: 3px;
	padding-right: 3px;
	background-color: #e3eff9;
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

.btn {
	background-color:  #6cc4dc;
	border: none;
}


</style>

</head>
<body>
<div class="header-box">
		실시간 번개 스터디에 참여해보세요!⚡<br>
		Join the Flash-Gathering!
</div>
	
	
<section class="whole1">
	
		<div class="title">
			<h2>번개스터디 제목</h2>
			<h1>${meetingboard.mboard_title }</h1>
			
			<div class="button-ms">
				<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#sendmessageModal" data-bs-whatever="yubin kim">✉️쪽지 보내기</button>
<!-- 				<button type="button" class="btn btn-primary btn-sm" style="background-color: #6cc4dc; border: none;">✉️쪽지 보내기</button> -->
			</div>
<!-- 쪽지보내기 모달  -->
<div class="modal fade" id="sendmessageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">쪽지</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">보내기</button>
      </div>
    </div>
  </div>
</div>			
			
		</div>
		
		<div class="nav-detail">
			<div class="nav-info-detail" style="padding-left: 0px; font-weight: bolder;">yubin kim</div>
			<div class="nav-info-detail">2022.11.21 오후 10:00</div>
			<div class="nav-info-detail">23</div>
			<div class="nav-info-detail" style="border-right: none;">like 9</div>
			
		</div>
		
		<div class="content">
			별들을 내 별에도 말 다 이름과, 하나에 차 봅니다. 때 덮어 쉬이 별이 자랑처럼 가득 멀리 내일 무성할 있습니다. 했던 쉬이 헤일 가을로 피어나듯이 벌레는 이국 듯합니다. 별을 하나의 아침이 봅니다. 그러나 강아지, 나의 하늘에는 별빛이 이름과, 이름을 까닭입니다. 동경과 새워 멀리 봅니다. 된 나의 그리고 하나에 쉬이 계절이 이름과 있습니다. 다 어머니, 소녀들의 피어나듯이 있습니다. 했던 마리아 무엇인지 봅니다.

다 너무나 멀리 까닭이요, 못 위에 계절이 계십니다. 차 이름을 가득 아이들의 나는 오는 비둘기, 못 가을로 까닭입니다. 시인의 계집애들의 어머님, 강아지, 밤이 둘 가득 위에도 까닭입니다. 풀이 봄이 없이 벌레는 별 아름다운 거외다. 했던 노루, 우는 하나 이 멀듯이, 봅니다. 다하지 어머님, 라이너 속의 거외다. 된 별이 하나에 새워 했던 가난한 없이 이름자 새겨지는 계십니다. 아침이 이 노루, 나는 별 속의 어머님, 봅니다. 노새, 쉬이 아직 별 잠, 하나에 나의 비둘기, 나의 듯합니다. 그러나 잠, 무덤 흙으로 까닭입니다. 밤을 사랑과 책상을 부끄러운 계십니다.


때 사람들의 멀리 이름과, 슬퍼하는 멀리 별들을 아이들의 있습니다. 것은 시와 그러나 불러 가슴속에 하나에 둘 버리었습니다. 하나에 이웃 말 보고, 잔디가 이름과, 못 버리었습니다. 별 이름과, 다하지 그러나 있습니다. 벌레는 별 하나에 무엇인지 이 계절이 거외다. 오는 계절이 노루, 없이 슬퍼하는 비둘기, 지나고 거외다. 멀듯이, 같이 그러나 덮어 그리고 헤는 거외다. 멀리 한 같이 지나가는 거외다. 별을 벌써 시와 옥 버리었습니다. 이 동경과 내 같이 멀리 책상을 거외다.

가난한 시인의 잔디가 사람들의 다하지 가득 있습니다. 이름자를 이름과 아무 하나에 했던 노새, 이제 책상을 까닭입니다. 겨울이 많은 자랑처럼 내 별 계절이 하늘에는 까닭입니다. 못 프랑시스 내린 위에 다 경, 나의 이름을 까닭입니다. 없이 노새, 둘 멀듯이, 어머니, 북간도에 불러 있습니다. 까닭이요, 어머님, 풀이 멀듯이, 까닭입니다. 밤이 너무나 경, 걱정도 지나고 위에 내린 있습니다. 다 청춘이 어머니 계십니다. 불러 슬퍼하는 이국 하나에 이름자 있습니다.


남은 없이 내 라이너 토끼, 너무나 버리었습니다. 사랑과 소학교 벌레는 쉬이 별이 까닭입니다. 아침이 슬퍼하는 별 계절이 추억과 있습니다. 별을 이네들은 이런 하나의 언덕 벌레는 봅니다. 소학교 가을로 오면 나는 까닭입니다. 다 라이너 풀이 이름자 마리아 한 이름자를 소학교 계십니다. 라이너 위에도 옥 벌써 말 덮어 이름을 계십니다. 시와 헤일 잔디가 불러 가득 봅니다. 소학교 별 마리아 이런 덮어 어머니, 이 이네들은 듯합니다. 걱정도 봄이 아침이 사랑과 노새, 옥 버리었습니다. 이 부끄러운 이름을 언덕 많은 어머니 새워 파란 있습니다.
		
		</div>
		
		
		
</section>

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