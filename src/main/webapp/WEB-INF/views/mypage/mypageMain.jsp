<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp"%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<style type="text/css" >

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

* {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif
	}

body {
	min-height: 100vh
	}

body::before { 
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
/* 	background: linear-gradient(#2d2dff, #ff2f2f); */
	clip-path: circle(25% at right)
	
	}
	
body::after {
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	min-height: 100vh;
	height: 100%;
/* 	background: linear-gradient(#870aec, #6e0b81); */
	clip-path: circle(20% at 10% 10%)
	}
	
.container { 
	margin-top: 80px;
	margin-bottom: 80px;
	position: relative;
	z-index: 100;
	}
	
.container .row .card {
	width: 300px;
	height: 300px;
	margin: 30px;
	background: rgba(255, 255, 255, 0.1);
	overflow: hidden;
	backdrop-filter: blur(5px);
	border-top: 1px solid rgba(255, 255, 255, 0.5);
	border-left: 1px solid rgba(255, 255, 255, 0.5);
	border-radius: 15px;
	cursor: pointer
	}

.container .row .card .card-body {
	padding: 1rem 1.2rem;
	color: #323232;
	}
	
.container .row .card .card-body .card-img img { 
	width: 60px;
	height: 60px;
	object-fit: cover;
	transform: translateY(50px);
	transition: 0.5s;
	border-radius: 50%
	}
	
.container .row .card .card-body .name {
	transform: translateY(50px);
	transition: 0.5s
	}
	
.container .row .card .card-body .testimonial {
	font-size: 0.9rem;
	pointer-events: none;
	transform: translateY(10px);
	transition: 0.5s;
	opacity: 0 
	}

.container .row .card:hover .card-body .testimonial, .container .row .card:hover .card-body .name, .container .row .card:hover .card-body .card-img img {
	transform: translateY(0px);
	opacity: 1
	}
	
@media(max-width: 991.5px) {

	body::after {
		clip-path: circle(40% at 10% 50%)
		}
	body::before {
		clip-path: circle(50% at right -10%)
		}
	}


</style>
</head>


<body>


<div class="container">
    <div class="row">
        <div class="col-lg-4 d-flex justify-content-center">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://images.pexels.com/photos/6625914/pexels-photo-6625914.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt=""> </div>
                    <div class="name h5">회원 프로필</div>
                    <div class="testimonial">프로필 사진 변경 <br> 내 쪽지함 <br> 회원 정보 수정 <br> 회원 탈퇴  </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt=""> </div>
                    <div class="name h5">참여중인 스터디</div>
                    <div class="testimonial">나의 멘토 <br> 나의 스터디 <br> 온라인 스터디 </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex justify-content-center">
            <div class="card">
                <div class="card-body text-center">
                    <div class="card-img pt-2 pb-3"> <img src="https://images.pexels.com/photos/4946604/pexels-photo-4946604.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" /> </div>
                    <div class="name h5"> 위시리스트 <br> 결제내역 </div>
                    <div class="testimonial">  </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<%@ include file="../layout/footer.jsp" %>
</html>