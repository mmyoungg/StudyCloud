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
    <div class="padding">
        <div class="row container d-flex justify-content-center">
<div class="col-md-6 col-lg-4">
            <form class="card">
              <h4 class="card-title fw-400">Login</h4><br>

              <div class="card-body">
                <div class="form-group">
                <div class="form-text">
                아이디
                </div>
                  <input class="form-control" type="text">
                </div>

                <div class="form-group">
                <div class="form-text">
                비밀번호
                </div>
                  <input class="form-control" type="password" placeholder="">
                </div>

                <div class="wrapper col-12">
                	<div class="wrapper">
                		<a href="/login/findid" class="">아이디 찾기</a>
                	<div class="line"></div>
                	<a href="/login/findpw" class="">비밀번호 찾기</a>
                	</div><br><br>
                </div>
                
                <button class="btn btn-bold btn-primary" id="btn">Login</button><br>
                <img src="https://ifh.cc/g/7XpWOg.png" alt="카카오계정 로그인" style="height: 48px; width: 60%;"/></a>
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