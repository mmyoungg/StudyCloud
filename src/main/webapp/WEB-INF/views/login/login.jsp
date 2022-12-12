<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

/*
$(document).ready(function() {

	var msg = "${message}"

	var msg_wrapper =  document.getElementById('msg_wrapper')

	if(msg === 'error'){
		console.log("err")
		msg_wrapper.style.display == 'block'
	
		}else {
		console.log("succ")
		msg_wrapper.style.display == 'none'
} */


$(function(e){
// 	e.preventDefault()
	$("#btn").click(function(){
	 memberId = $("#memberId").val();
	 var memberPw =$("#memberPw").val();
	 
	 if(memberId == ""){
	  alert("아이디를 입력하세요");
	  $("#memberId").focus(); //입력포커스 이동

	  return; //함수 종료
	}
	 
	if(memberPw == ""){
	 alert("비밀번호를 입력하세요"); 
	 $("#memberPw").focus();
	  return;
	}
	 
	})
})

<!-- 카카오 스크립트 -->


// 카카오 로그인

Kakao.init('ebc8fc53624cdd3b21b34f099837f10c');
console.log(Kakao.isInitialized()); // sdk초기화여부판단

function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']);
      }
  });  

//카카오로그아웃 

  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
          	console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
    }  


</script>

<style type="text/css" >


.padding {
    padding: 10rem !important
}

body {
    background-color: #f9f9fa
    
}

/* card css */

.card {
    border: 0;
    border-radius: 0px;
    margin-bottom: 30px;
    margin-left: 10%;
    width: 100%;
    -webkit-box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    -webkit-transition: .5s;
    transition: .5s;
}

.card-title {
    font-family: Roboto,sans-serif;
    font-weight: 300;
    line-height: 3.2;
    margin-bottom: 0;
    padding: 15px 20px;
    border-bottom: 1px solid rgba(77,82,89,0.07);
    margin: 0 auto;
    
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
    line-height: 2;
	text-align: center;    
}

/* card 내부 */

.fw-400 {
    font-weight: 400 !important;
}

.col-md-6 {
    flex: 0 0 auto; 
    width: 50%;
}


.form-group {
    margin-bottom: 1rem;
}

.form-text {
	width: 270px;
	color: #323232;
	font-size: 11pt;
	font-weight: 540;
}

.form-control {
    border-color: #ebebeb;
    border-radius: 2px;
    color: #8b95a5;
    padding: 2px 12px;
    font-size: 14px;
    line-height: inherit;
    -webkit-transition: 0.2s linear;
    transition: 0.2s linear;
    width: 60%;
    margin: 0 auto;
    
}

.card-body>*:last-child {
    margin-bottom: 0;
}

.form-control:focus {
    border-color: #6CC4DC;
    color: #4d5259;
    -webkit-box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
    box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
}

/* button css */

#btn {
	width: 60%;
	padding: 12px;
	margin-bottom: 15px;
	
}

.btn-primary {
    background-color: #6CC4DC;
    border-color: #6CC4DC;
    color: #fff;
}
.btn-bold {
    font-family: Roboto,sans-serif;
    text-transform: uppercase;
    font-weight: 500;
    font-size: 12px;
}



.btn-primary:hover {
    background-color: #3F92B7;
    border-color: #3F92B7;
    color: #fff;
}

#btn:hover {
    cursor: pointer;
}

.wrapper {
    display: flex;
    margin: 0 auto 0.5rem;
    font-size: .875rem;
}

a {
    color: #737373;
    padding: 0.375rem 0.5rem;
    font-weight: 400;
}

a, a:hover {
    text-decoration: none;
}
a {
    color: #323232;
    background-color: transparent;
}

.line {
    margin: auto 0.75rem;
    width: 0.0625rem;
    height: 0.75rem;
    background-color: #e1e1e1;
}


</style>
</head>

<body>

<div class="page-content page-container" id="page-content">
	<form action="/login" method="post" name="form1">
		<div class="padding">
			<div class="row container d-flex justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="card">
						<h4 class="card-title fw-400">Login</h4>
						<br>

						<div class="card-body">
							<div class="form-group">
								<div class="form-text">아이디</div>
								<input class="form-control" type="text" id="memberId" name="memberId">
							</div>
							<div class="form-group">
								<div class="form-text">비밀번호</div>
								<input class="form-control" type="password" id="memberPw" name="memberPw">
							</div><br>
							
  							<div id="msg_wrapper" style="display:none"> 아이디 또는 비밀번호가 일치하지 않습니다.</div> 
								
								<c:if test="${message eq 'error'}">
								  <script type="text/javascript">
								    var e = document.getElementById("msg_wrapper");
								    e.style.display = 'block';
								    e.style.color = 'red';
								  </script>
								</c:if>

							<div class="wrapper col-12">
								<div class="wrapper">
									<a href="/login/findid" class="">아이디 찾기</a>
									<div class="line"></div>
									<a href="/login/findpw" class="">비밀번호 찾기</a>
								</div>
								<br>
								<br>
							</div>

							<div class="col-lg-12 text-center mt-3">
							<button class="btn btn-bold btn-primary" id="btn">Login</button>
							<img src="https://ifh.cc/g/7XpWOg.png" alt="카카오계정 로그인" onclick="kakaoLogin();"
								style="height: 46px; width: 62%; padding-left: 14px;"> <a href="javascript:void(0)"></a> <br>
								
<!-- 								<ul> -->
<!-- 								<li onclick="kakaoLogout();"> -->
<!-- 							      <a href="javascript:void(0)"> -->
<!-- 							          <span>카카오 로그아웃</span> -->
<!-- 							      </a> -->
<!-- 								</li> -->
<!-- 								</ul> -->
						</div>
								
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
</body>
</html>

<%@ include file="../layout/footer.jsp" %>