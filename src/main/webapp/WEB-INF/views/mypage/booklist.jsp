<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<style type="text/css">

.card {
	border: 0;
	border-radius: 0px;
	padding: 10px;
	margin-left: 30%;
 	margin-bottom: 10%; 
 	margin-top: 10%;
 	width: 80%;
	-webkit-box-shadow: 0 2px 3px rgba(0, 0, 0, 0.03);
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.03);
	-webkit-transition: .5s;
	transition: .5s;
}

.title {
	margin-top: 5%;
	font-size: 18pt;
	font-weight: bold;
	text-align: center;
}

body {
	margin-top:20px;
	background-color: #f9f9fa
	
}

h3 {
    font-size: 16px;
}

.text-navy {
    color: #3F92B7;
}

.cart-product-imitation {
  text-align: center;
  padding-top: 30px;
  padding-right: 30px;
  height: 150px;
  width: 150px;
}

table.shoping-cart-table {
  margin-bottom: 0;
}

table.shoping-cart-table tr td {
  border: none;
  text-align: right;
}

table.shoping-cart-table tr td.desc,
table.shoping-cart-table tr td:first-child {
  text-align: left;
}

table.shoping-cart-table tr td:last-child {
  width: 10px;
}

.collapsed .ibox-content {
  display: none;
}

.ibox-title {
  -moz-border-bottom-colors: none;
  -moz-border-left-colors: none;
  -moz-border-right-colors: none;
  -moz-border-top-colors: none;
  border-color: #e7eaec;
  border-image: none;
  border-style: solid solid none;
  border-width: 3px 0 0;
  color: inherit;
  margin-bottom: 0;
  padding: 14px 15px 7px;
  min-height: 48px;
}

.ibox-content {
  color: inherit;
  padding: 15px 20px 20px 20px;
  margin-top: 20px;
  margin-bottom: -20px;
  border-color: #e7eaec;
  border-image: none;
  border-style: solid solid none;
  border-width: 1px 0;
}

.ibox-footer {
  color: inherit;
  border-top: 1px solid #e7eaec;
  font-size: 90%;
  background: #ffffff;
  padding: 10px 15px;
}

.desc {
	width: 50%;
}

/* 버튼 css */

.delete-button {
	background: #6CC4DC;
	box-shadow: none;
	border: none;
	margin-left: -20%;
	font-size: 12px;
	padding: 10px;
	width: 30%;
}

.delete-button:hover {
	background: #3F92B7;
}

.delete-button:focus {
	background: #3F92B7;
	box-shadow: none;
}

.profile-button:active {
	background: #3F92B7;
	box-shadow: none;
}

</style>
</head>

<body>

  <div class="col-md-9">
  	<div class="card">
  			<div class="title">예약 내역</div><br><br>
                <div class="ibox-content">
                    <div class="table-responsive">
                        <table class="table shoping-cart-table">
                            <tbody>
                            <tr>
        					    <td width="90">
                                <img src="https://modo-phinf.pstatic.net/20200716_57/1594864756852jOdzL_JPEG/mosaZPjgYw.jpeg?type=f336_336" alt="..." class="cart-product-imitation">
                                </td>                                    
                                <td class="desc">
                                    <div class="text-navy" >
                                    <h3>허슬버슬 스터디룸&공유오피스</h3>
                                    </div><br>
                                    <dl class="small m-b-none">
                                        <dt>예약 정보</dt><br>
                                        <dd>예약 날짜 : 2022년 11월 15일</dd>
                                        <dd>예약 시간 : 10시~15시</dd>
                                        <dd>인원 : 4명</dd>
                                    </dl>
                                </td>
                                <td>
								<button class="btn btn-primary delete-button" type="button">취소</button>                               
								</td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    
                <div class="ibox-content">
                    <div class="table-responsive">
                        <table class="table shoping-cart-table">
                            <tbody>
                            <tr>
        					    <td width="90">
                                <img src="https://modo-phinf.pstatic.net/20210118_192/1610946849604hfY3t_JPEG/mosazdlBnY.jpeg?type=f320_320" alt="..." class="cart-product-imitation">
                                </td>                                    
                          	    <td class="desc">
                                    <div class="text-navy" >
                                    <h3>ENI스터디룸</h3>
                                    </div><br>
                                    <dl class="small m-b-none">
                                        <dt>예약 정보</dt><br>
                                        <dd>예약 날짜 : 2022년 11월 21일</dd>
                                        <dd>예약 시간 : 17시~21시</dd>
                                        <dd>인원 : 6명</dd>
                                    </dl>
                                </td>
                                <td>
								<button class="btn btn-primary delete-button" type="button">취소</button>                               
								</td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    
                 <div class="ibox-content">
                    <div class="table-responsive">
                        <table class="table shoping-cart-table">
                            <tbody>
                            <tr>
       					    <td width="90">
                               <img src="https://ldb-phinf.pstatic.net/20150901_244/14410338887412ja3X_JPEG/SUBMIT_1416958175779_35966443.jpg" alt="..." class="cart-product-imitation">
                               </td>                                    
                                <td class="desc">
                                   <div class="text-navy" >
                                   <h3>옐로스톤 스터디룸</h3>
                                   </div><br>
                                   <dl class="small m-b-none">
                                       <dt>예약 정보</dt><br>
                                       <dd>예약 날짜 : 2022년 11월 26일</dd>
                                       <dd>예약 시간 : 15시~18시</dd>
                                       <dd>인원 : 5명</dd>
                                   </dl>
                               </td>
                                <td>
								<button class="btn btn-primary delete-button" type="button">취소</button>                               
								</td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
					</div>
                </div>
      

</body>
</html>

<%@ include file="../layout/footer.jsp" %>