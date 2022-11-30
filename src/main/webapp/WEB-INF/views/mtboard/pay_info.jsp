<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보확인｜결제</title>
<c:import url="../layout/header.jsp" /> 

<style type="text/css">

.mento_intro {
    background-color: #aacde5;
    height: 200px;
}

.mento_intro_content {
    position: relative;
    padding: 84px 2rem 38px;
    text-align: center;
}

.all_content {
    margin: 260px 150px 0px 150px;
    height: 1100px;
}

.pay_content {
	width: 50%;
    margin: 0 auto;
    font-size: 15px;
    padding: 30px;
}

.refund_txt, span {
	line-height: 2;
}

a {
    color: white;
    cursor: pointer;
    float: right;
    margin-top: 65px;
}

.btn {
    border: solid 1px #6cc4dc;
    background-color: #6cc4dc;
}

.btn:hover {
    border: solid 1px #6cc4dc;
    background-color: #6cc4dc;
}
    
.total_price {
	font-size: 20px;
}

.btn_back {
	 border: solid 1px #fff;
     background-color: #fff;
     color: #696969;
     text-decoration: none;
     font-size: 18px;
     margin-top: 70px;
     margin-right: 20px;
}

.btn_back:hover {
	 border: solid 1px #fff;
    background-color: #fff;
    color: #696969;
    text-decoration: none;
}

</style>

</head>
<body>


<main id="main">
<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>

<main class="all_content">

<div class="pay_content">

<div class="refund_wrap">
<h1 style="margin-bottom: 80px;">정보 확인</h1>

<table class="info_table" style="line-height: 2.5">
<tr>
	<td class="info_name" scope="row" style="width: 20%">멘토</td>
	<td>멘토아이디</td><%-- <td>${viewBoard.boardNo }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">멘티</td>
	<td>멘티아이디</td><%-- <td>${viewBoard.writerId }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">일정</td>
	<td>2022-11-05 (토), 15:00 ~ 16:00</td><%-- <td>${viewBoard.writerNick }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">연락처</td>
	<td>멘티연락처</td><%-- <td>${viewBoard.writerNick }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">이메일</td>
	<td>멘티이메일</td><%-- <td>${viewBoard.writerNick }</td> --%>
</tr>
</table>
<br><br>

<hr>

<br><br>

<div class="total_price">
<span>결제금액</span><span style="float: right">20,000 원</span>
</div>

<!-- 이전 클릭시 작성한 양식 그대로 남기고 띄우기 -->
<a class="btn btn-primary" href="/mtboard/pay_info" type="button">결제</a>
<a class="btn_back" href="/mtboard/applyMnt" type="button">이전</a>

</div><!-- pay_content 끝 -->
</div>
</main>
</main>
















<c:import url="../layout/footer.jsp" /> 
</body>
</html>