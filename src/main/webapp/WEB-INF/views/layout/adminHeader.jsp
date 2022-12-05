<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 5.2.2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

/* 전체 폰트 적용 */
@font-face {
    font-family: 'paybooc';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
    font-family: 'paybooc';
}

 #main { 
 	margin-top: 60px; 
   	padding: 20px 30px; 
   	transition: all 0.3s; 
} 

 @media (max-width: 1199px) { 
   #main { 
     padding: 20px; 
   } 
 } 

 /* 메인 타이틀 */
 .pagetitle { */
   margin-bottom: 10px; 
 } 

 .pagetitle h1 { 
   font-size: 24px; 
   margin-bottom: 0; 
 } 

/* @media (max-width: 1199px) {  */
/*   .header .search-bar { */
/*     position: fixed; */
/*     top: 50px; */
/*     left: 0; */
/*     right: 0; */
/*     padding: 20px; */
/*     box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1); */
/*     background: white; */
/* /*     z-index: 9999; */ */
/*     transition: 0.3s; */
/*     visibility: hidden; */
/*     opacity: 0; */
/*   } */

/* /*   .header .search-bar-show { */ */
/* /*     top: 60px; */ */
/* /*     visibility: visible; */ */
/* /*     opacity: 1; */ */
/* /*   } */ */
/* } */

/* 헤더 */
.header {
	display: flex;
	align-items: center;
}

.logo {
	display: flex;
	align-items: center;
}

.logo img {
  max-height: 50px;
  margin-right: 6px;
}

.header { /* 헤더 지우면안댐 */
/*   transition: all 0.5s; */
/*   z-index: 997; */
  height: 60px;
  box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1);
  background-color: #fff; /* 헤더 색상 */
  padding-left: 50px;
  padding-top: 5px;
}

/* .header .toggle-sidebar-btn { /* 지우면안댐 */ */
/*   font-size: 32px; */
/*   padding-left: 10px; */
/*   cursor: pointer; */
/*   color: #012970; */
/* } */

@media (max-width: 1199px) { /* 지우면 안댐 */
  .header .search-bar {
    position: fixed;
    top: 50px;
    left: 0;
    right: 0;
    padding: 20px;
    box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
    background: white;
/*     z-index: 9999; */
/*     transition: 0.3s; */
/*     visibility: hidden; */
/*     opacity: 0; */
  }

}

.header .search-form { /* 지우며ㅑㄴ안댐 */
  width: 100%;
}

.header .search-form button { /* 지우면안댐 */
  border: 0;
  padding: 0;
  margin-left: -30px;
  background: none;
}

/* 사이드바 */
.sidebar {
  position: fixed;
  top: 60px; /* 헤더에서 내려오는 정도 */
  left: 0;
  bottom: 0;
  width: 300px;
/*   z-index: 996; */
  transition: all 0.3s;
  padding: 20px;
/*   overflow-y: auto; */
  scrollbar-width: thin;
  scrollbar-color: #aab7cf transparent;
  box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
  background-color: #fff;
}

@media (max-width: 1199px) {
  .sidebar {
    left: -300px;
  }
}

.sidebar::-webkit-scrollbar {
  width: 5px;
  height: 8px;
  background-color: #fff;
}

@media (min-width: 1200px) {

  #main,
  #footer {
    margin-left: 300px;
  }
}

@media (max-width: 1199px) {
  .toggle-sidebar .sidebar {
    left: 0;
  }
}

@media (min-width: 1200px) {

  .toggle-sidebar #main,
  .toggle-sidebar #footer {
    margin-left: 0;
  }

  .toggle-sidebar .sidebar {
    left: -300px;
  }
}

.sidebar-nav {
  padding: 0;
  margin: 0;
  list-style: none;
}

/* 사이드바 폰트 */
#sidebarMenu {
  padding: 0;
  margin: 0;
  margin: 10px;
  list-style: none;
}

#sidebarMenu > a {
	display: flex;
	align-items: center;
	padding: 10px 15px;
	font-size: 16px;
	font-weight: bold;
/*   z-index: 9999; */
  
}

#sidebarMenu > a:hover { /* 메뉴 hover시 */
	color:  #6cc4dc;
}

.sidebar-nav .nav-link.collapsed {
/*   color: #012970; */
/*   background: #fff; */
}

.sidebar-nav .nav-content {
  padding: 5px 0 0 0;
  margin: 0;
  list-style: none;
}

/* /* 캘린더 */ */
/* .today { */
/*   width: 100%; */
/*   -webkit-box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3); */
/*   -moz-box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3); */
/*   box-shadow: 0px 15px 30px -16px rgba(0, 0, 0, 0.3); } */

/* .today-piece { */
/*   border-radius: 0.25rem; */
/*   padding: 1.6rem; */
/*   font-size: 1.25em; */
/*   text-align: center; */
/*   background: white; } */

/* .top { */
/*   border-bottom-right-radius: 0; */
/*   border-bottom-left-radius: 0; } */

/* .middle { */
/*   border-radius: 0; } */

/* .bottom { */
/*   border-top-right-radius: 0; */
/*   border-top-left-radius: 0; } */

/* .day, */
/* .year { */
/*   font-size: 0.65em; */
/*   font-weight: 500; */
/*   letter-spacing: 0.35em; */
/*   text-transform: uppercase; */
/*   color: white; */
/*   background: #52de97; } */

/* .month { */
/*   padding-top: 1.75rem; */
/*   padding-bottom: 0; */
/*   font-size: 1.5em; */
/*   font-weight: 200; } */

/* .date { */
/*   padding-top: 0; */
/*   padding-bottom: 1.75rem; */
/*   font-size: 3em; */
/*   font-weight: 100; */
/*   color: #000; } */

</style>

<script type="text/javascript">
/* 페이지 이동 */
$(document).ready(function() {
	$("#btnMento").click(function() {
		location.href = "/admin/mento"
	})
})

$(document).ready(function() {
	$("#btnStudy").click(function() {
		location.href = "/admin/study"
	})
})

$(document).ready(function() {
	$("#btnStudyroom").click(function() {
		location.href = "/admin/studyroom"
	})
})

$(document).ready(function() {
	$("#btnQna").click(function() {
		location.href = "/admin/qna"
	})
})

$(document).ready(function() {
	$("#btnReserve").click(function() {
		location.href = "/admin/reserve"
	})
})

$(document).ready(function() {
	$("#btnMember").click(function() {
		location.href = "/admin/member"
	})
})

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		location.href = "/admin/update"
	})
})

</script>

</head>
<body>


<!-- 헤더 -->
<header id="header" class="header fixed-top">

	<div class="d-flex align-items-center justify-content-between">
		<a href="./main" class="logo">
			<img src="/resources/img/Logo.png" alt="studycloud">
		</a>
	</div><!-- End Logo -->

</header>

<!-- 사이드바 -->
<section id="sidebar" class="sidebar">

	<div class="container">
		
		<ul class="sidebar-nav" id="sidebar-nav">
		
			<li class="nav-item" id="sidebarMenu">
				<a href="./main" class="nav-link" >
				  <span>홈</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnMento" class="nav-link collapsed" data-bs-toggle="collapse">
				  멘토 등록
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnStudy" class="nav-link collapsed" data-bs-toggle="collapse">
				  스터디 등록
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnStudyroom" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>스터디룸 등록</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnQna" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>qna 관리</span>
				</a>
			</li>

			<li class="nav-item" id="sidebarMenu">
				<a id="btnReserve" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>예약 관리</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnMember" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>회원 관리</span>
				</a>
			</li>
			
			<li class="nav-item" id="sidebarMenu">
				<a id="btnUpdate" class="nav-link collapsed" data-bs-toggle="collapse">
				  <span>정보 수정</span>
				</a>
			</li>
		
		</ul>
  
	</div><!-- container end -->

</section>

</body>
</html>