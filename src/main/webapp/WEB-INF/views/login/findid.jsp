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
    margin-left: -30%;
    width: 180%; 
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

.form-control {
    border-color: #ebebeb;
    border-radius: 2px;
    color: #8b95a5;
    padding: 1px 1px;
    font-size: 14px;
    line-height: inherit;
    -webkit-transition: 0.2s linear;
    transition: 0.2s linear;
    width: 50%;
    margin: 0 auto;
    display: inline;
    
}

.form-control:focus {
    border-color: #6CC4DC;
    color: #4d5259;
    -webkit-box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
    box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
}

.text-1, .text-2 {
	font-size: 14px;
}

/* button css */

#btn {
	width: 50%;
	padding: 12px;
	margin-bottom: 10px;
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
    font-size: 14px;
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
              <h4 class="card-title fw-400">아이디 찾기</h4><br>

              <div class="card-body">
               
               <div class="text-1">계정에 등록된 이메일을 입력 하시면</div>
               <div class="text-2">사용중인 계정의 아이디를 알려드립니다.</div>
               <br>
               
                이메일&nbsp; <input class="form-control" type="text"><br><br><br>

			<button class="btn btn-bold btn-primary" id="btn">아이디 찾기</button><br><br>
			</div>	
            </form>
          </div>
           </div>
            </div>
             </div>
</body>
</html>

<%@ include file="../layout/footer.jsp" %>