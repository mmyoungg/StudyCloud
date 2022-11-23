<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

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
    -webkit-box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    -webkit-transition: .5s;
    transition: .5s;
}

.card-title {
    font-family: Roboto,sans-serif;
    font-weight: 300;
    line-height: 1.8;
    margin-bottom: 0;
    padding: 15px 20px;
    border-bottom: 1px solid rgba(77,82,89,0.07);
        margin: 0 auto;
    
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
    line-height: 2.5;
	text-align: center;    
}

/* card 내부 */

.fw-400 {
    font-weight: 400 !important;
}

.col-md-6 {
    flex: 0 0 auto; 
    width: 60%;
}

.form-id, .form-phone, .form-email {
	width: 350px;
	color: #323232;
	font-size: 10pt;
	font-weight: 540;
}

.form-pwck {
	width: 380px;
	color: #323232;
	font-size: 10pt;
	font-weight: 540;
}

.form-pw {
	width: 350px;
	color: #323232;
	font-size: 10pt;
	font-weight: 540;
}

.form-name {
	width: 330px;
	color: #323232;
	font-size: 10pt;
	font-weight: 540;
}

.form-group {
	padding: 12px;
}

.form-group-id {
	height: 72px;
}

.form-control {
    border-color: #ebebeb;
    border-radius: 2px;
    color: #8b95a5;
    padding: 1px 1px;
    font-size: 12px;
    line-height: inherit;
    -webkit-transition: 0.2s linear;
    transition: 0.2s linear;
    width: 50%;
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
	width: 50%;
	padding: 12px;
	margin-bottom: 10px;
}

#btnchk {
	width: 10%;
	padding: 6px;
	display: inline;
	margin-left: 430px;
	margin-top: -85px;
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


</style>
</head>

<body>

<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
<div class="col-md-6 col-lg-4">
            <form class="card">
              <h4 class="card-title fw-400">JOIN</h4><br>

              <div class="card-body">
                <div class="form-group-id">
                <div class="form-id">
                아이디
                </div>
                <div>
                  <input class="form-control" type="text" placeholder="  아이디는 4~20자 소문자 + 숫자 + _ , -">
              	 <button class="btn btn-bold btn-primary btnsm" id="btnchk">중복확인</button><br>
                </div>
                	
                </div>

                <div class="form-group">
                <div class="form-pw">
                비밀번호
                </div>
                  <input class="form-control" type="password" placeholder="  영문, 숫자, 특수문자를 포함하여 8자리 이상">
                </div>
                <div class="form-group">
                <div class="form-pwck">
                비밀번호확인
                </div>
                  <input class="form-control" type="password" placeholder="">
                </div>
                <div class="form-group">
                <div class="form-name">
                이름
                </div>
                  <input class="form-control" type="text">
                </div>
                <div class="form-group">
                <div class="form-phone">
                연락처
                </div>
                  <input class="form-control" type="text">
                </div>
                 <div class="form-group">
                <div class="form-email">
                이메일
                </div>
                  <input class="form-control" type="text">
                </div>
                <br>
                
                
                <!-- 회원가입 버튼 -->
                
                <div class= buts>
                <button class="btn btn-bold btn-primary" id="btn">JOIN</button><br>
                <img src="https://ifh.cc/g/7XpWOg.png" alt="카카오 회원가입" style="height: 48px; width: 50%;"/></a>
                </div>
				<br><br>
              </div>
            </form>
          </div>
           </div>
            </div>
             </div>
</body>
</html>

<%@ include file="../layout/footer.jsp" %>