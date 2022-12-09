<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin studyroom view</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/studyroom"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/studyroom/update?sRoomNo=${studyroom.sRoomNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/studyroom/delete?sRoomNo=${studyroom.sRoomNo }"
	})
})
</script>

<style type="text/css">

/* 전체 폰트 적용 */
@font-face {
    font-family: 'paybooc';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0 auto;
	padding: 0;
    font-family: 'paybooc';
}

#studyroomView {
	margin-top: 100px;
	margin-bottom: 150px;
}

.content {
	padding: 10px;
}

.sRoomTitle {
	margin-top: 50px;
}


img {
	height: 350px;
}

p {
	margin-bottom: 0;
}

#sRoomRole {
	border: 1px solid #ccc;
	border-radius: 10px;
	margin-top: 20px;
	padding: 10px;
}

h5, h6 {
	font-weight: bold;
}

#sRoomInfo {
	background-color: #edf8ff;
	padding: 20px;
}

/* 버튼 */
.button {
	text-align: center;
	margin-top: 30px;
}

#btnList {
	background-color: #fff;
	color: #6cc4dc;
	font-weight: bold;
	padding: 5px;
	border: 1px solid #6cc4dc;
	border-radius: 10px;
}

#btnUpdate {
	background-color: #6cc4dc;
	color: #fff;
	font-weight: bold;
	padding: 5px;
	border: 1px solid #fff;
	border-radius: 10px;

}

#btnDelete {
	background-color: #3f92b7;
	color: #fff;
	font-weight: bold;
	padding: 5px;
	border: 1px solid #fff;
	border-radius: 10px;

}

</style>

</head>
<body>


<section class="main">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-8" id="studyroomView">
				<h1>스터디룸 등록 미리보기</h1>
				<hr>

				<div style="text-align:center;"> 
			    	<img src="/upload/${sRoomFile.fileUploadStor }" alt="studyroom-img">
				</div>
				
				<div class="sRoomTitle">
				    <h6>${studyroom.sRoomIntro }</h6>
					<h2>${studyroom.sRoomName }</h2>
				</div>
					
				<hr>
					
				<div class="content-wrap">
				<div class="content" id="sRoomInfo">
					<div class="content">
					    <h5>공간소개</h5>
						${studyroom.sRoomInfo }
					</div>
					
					<hr>
									
					<div class="content">
	                    <h6>인원</h6>
						<p>${studyroom.sRoomPeople } 명</p>
					</div>
					
					<div class="content">
	                    <h6>주소</h6>
						<p>${studyroom.sRoomAddr }</p>
					</div>
				</div>

				<div class="content" id="sRoomRole">
                    <h6>이용안내 & 환불규정</h6>
					<p>${studyroom.sRoomRole }</p>
				</div>
				
				</div>
				
			    <div class="button">
					<button id="btnList">목록</button>
					<button id="btnUpdate">수정</button>
					<button id="btnDelete">삭제</button>
				</div>
	        </div>
	    </div>
	</div>
</section>

</body>
</html>