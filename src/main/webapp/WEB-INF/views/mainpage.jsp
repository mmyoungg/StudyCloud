<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${path}/resources/css/mainpage.css" />

<!-- 슬라이더 버튼 css -->
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/flickity/1.1.0/flickity.min.css'>

<!-- ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>


<style type="text/css">

/* 리뷰 */
.testimonial-1 {
  background: #fff;
  padding: 14px;
  color: #000;
  border: 1px solid #6cc4dc;
  border-radius: 20px;
}

.col-md-4{
    margin-top:25px;
}

.name {
  font-weight: 700;
  font-size: 14px;
  margin-bottom: -3px;
}

.place {
  font-size: 13px;
  color: #988c8c;
}

.place-2 {
  font-size: 13px;
  color: #ffffff;
}

</style>


<script>
$(document).ready(function() {

	  $("#owl-one, #owl-two").each(function() {
	    $(this).owlCarousel({
	      items : 4, //10 items above 1000px browser width
	      itemsDesktop : [1000,6], //5 items between 1000px and 901px
	      itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
	      itemsTablet: [600,2], //2 items between 600 and 0;
	      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
	    });
	  });
	  
	  // Custom Navigation Events
	  $(".owl-next").click(function(){$(this).closest('.col-12').find('.owl-carousel').trigger('owl.next');})
	  $(".owl-prev").click(function(){$(this).closest('.col-12').find('.owl-carousel').trigger('owl.prev');})
	});
</script>


</head>
<body>

<!-- 배너 -->
<section class="banner">
	<div id="banner" class="carousel slide" data-bs-ride="carousel">

		<!-- 하단 인디케이터 -->
		<div class="carousel-indicators">
		    <button type="button" data-bs-target="#banner" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#banner" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#banner" data-bs-slide-to="2"></button>
		</div>

		<!-- 슬라이드 -->
		<div class="carousel-inner">
		    <div class="carousel-item active">
		        <img src="https://images.unsplash.com/photo-1614850715649-1d0106293bd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		        <img src="https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		        <img src="https://images.unsplash.com/photo-1614853035846-77b0a40a6b5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100">
		    </div>
		</div>

		<!-- 화살표 버튼 -->
		<div class="row col-md-6">
		    <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon"></span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
		        <span class="carousel-control-next-icon"></span>
		    </button>
	    </div>
	</div>
 	</section>


<!-- 검색창 -->
<section class="search">
	<div class="container">
		<div class="content">
			<p class="search_title">
			    검색창 멘트
			</p>
     			<div class="search_wrap">
    					<input class="search_input" type="text" placeholder="Search">
			</div>
 		</div>
	</div>
</section><!-- searchBox end -->


<!-- 지금 뜨고있는 멘토 -->
<section class="mentoRank">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <p class="mentoRank-title">지금 뜨고있는 멘토! 🎢</p>
                <div id="owl-one" class="mento-list owl-carousel owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage">
                            <!-- 1 -->
                            <div class="owl-item active">
                                <div class="mento-item">
                                    <a href="#" class="mento-title">초보자도 쉽게 배우는 프론트앤드</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 2 -->
                            <div class="owl-item">
                                <div class="mento-item color">
                                    <a href="#" class="mento-title">비전공자도 가능한 웹사이트 만들기</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                    
                            <!-- 3 -->
                            <div class="owl-item">
                                <div class="mento-item">
                                    
                                    <a href="#" class="mento-title">Spring MVC를 이용해 웹사이트 만들기1</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!-- 4 -->
                            <div class="owl-item">
                                <div class="mento-item">
                                    <a href="#" class="mento-title">Spring MVC를 이용해 웹사이트 만들기2</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!-- 5 -->
                            <div class="owl-item">
                                <div class="mento-item">
                                    <a href="#" class="mento-title">5</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <span class="mento-profile-inital text-success">CD</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!-- 6 -->
                            <div class="owl-item">
                                <div class="mento-item">
                                    <a href="#" class="mento-title">6</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <!-- 7 -->
                            <div class="owl-item">
                                <div class="mento-item featured">
                                    <a href="#" class="mento-title">7</a>
                                    <p class="mento-name">OOO 멘토</p>
                                    <ul class="mento-participants">
                                        <li class="mento-profile">
                                            <img class="mento-profile-pic" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Profile Pic" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div>
            
                    <div class="owl-nav">
                    <div class="owl-nav">
                        <button type="button" role="presentation" class="owl-prev">
                            <div class="owl-nav-wrapper">
                                <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-chevron-left"
                                style="color: #6cc4dc"
                                >
                                <polyline points="15 18 9 12 15 6"></polyline>
                            </svg>
                        </div>
                    </button>
                    <button type="button" role="presentation" class="owl-next">
                          	<div class="owl-nav-wrapper">
                               <svg
                                xmlns="http://www.w3.org/2000/svg" 
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                class="feather feather-chevron-right"
                                style="color: #6cc4dc"
                                 >
                                <polyline points="9 18 15 12 9 6" class="owl-next"></polyline>
                           	</svg>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div><!-- container end -->
</section><!-- mentoRank end -->


<!-- 마감임박 스터디 -->
<section class="studyRank">
	<div class="container">
     <div class="row">
         <div class="col-12">
             <p class="studyRank-title">마감임박 스터디! ⏰</p>
             <div id="owl-two" class="study-list owl-carousel owl-loaded owl-drag">
                 <div class="owl-stage-outer">
                     <div class="owl-stage">
                         <!-- 1 -->
                         <div class="owl-item active">
                             <div class="study-item">
                                 <a href="#" class="study-title">초보자도 쉽게 배우는 프론트앤드</a>
                                 <p class="study-name">OOO 멘토</p>
                                 <ul class="study-participants">
                                     <li class="study-profile">
                                     </li>
                                 </ul>
                             </div>
                         </div>
                 
                         <!-- 2 -->
                         <div class="owl-item">
                             <div class="study-item color">
                                 <a href="#" class="study-title">비전공자도 가능한 웹사이트 만들기</a>
                                 <p class="study-name">OOO 멘토</p>
                                 <ul class="study-participants">
                                     <li class="study-profile">
                                     </li>
                                 </ul>
                             </div>
                         </div>
                 
                         <!-- 3 -->
                         <div class="owl-item">
                             <div class="study-item">
                                 <a href="#" class="study-title">Spring MVC를 이용해 웹사이트 만들기1</a>
                                 <p class="study-name">OOO 멘토</p>
                                 <ul class="study-participants">
                                     <li class="study-profile">
                                     </li>
                                 </ul>
                             </div>
                         </div>
                         
                         <!-- 4 -->
                         <div class="owl-item">
                             <div class="study-item">
                                 <a href="#" class="study-title">Spring MVC를 이용해 웹사이트 만들기2</a>
                                 <p class="study-name">OOO 멘토</p>
                                 <ul class="study-participants">
                                     <li class="study-profile">
                                     </li>
                                 </ul>
                             </div>
                         </div>
                         
                         <!-- 5 -->
                         <div class="owl-item">
                             <div class="study-item">
                                 <a href="#" class="study-title">5</a>
                                 <p class="study-name">OOO 멘토</p>
                                 <ul class="study-participants">
                                     <li class="study-profile">
                                     </li>
                                 </ul>
                             </div>
                         </div>
                         
                     </div>
                 </div>
         
                 <div class="owl-nav">
                     <button type="button" role="presentation" class="owl-prev">
                         <div class="owl-nav-wrapper">
                             <svg
                             xmlns="http://www.w3.org/2000/svg"
                             width="24"
                             height="24"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke="currentColor"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round"
                             class="feather feather-chevron-left"
                             style="color: #6cc4dc">
                             <polyline points="15 18 9 12 15 6"></polyline>
                         </svg>
                     </div>
                 </button>
                 <button type="button" role="presentation" class="owl-next">
                       	<div class="owl-nav-wrapper">
                            <svg
                             xmlns="http://www.w3.org/2000/svg" 
                             width="24"
                             height="24"
                             viewBox="0 0 24 24"
                             fill="none"
                             stroke="currentColor"
                             stroke-width="2"
                             stroke-linecap="round"
                             stroke-linejoin="round"
                             class="feather feather-chevron-right"
                             style="color: #6cc4dc">
                             <polyline points="9 18 15 12 9 6" class="owl-next"></polyline>
                        	</svg>
                     </div>
                 </button>
             </div>
         </div>
     </div>
 </div><!-- container end -->
</section><!-- 마감임박 스터디 end -->


<!-- 인기 스터디룸 -->
<section class="studyroom">
	<div class="container">
     	<div class="row">
        	<div class="col-12">
            	<p class="studyRank-title">인기 스터디룸</p>
   				
   				<div class="card" style="width: 18rem;">
				  <img src="/resources/img/studyroom1.jfif" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">[강남] 스터디 클라우드 1호점</h5>
				    <p class="card-text">소개소개가격가격</p>
				  </div>
				</div>
         	</div>
     	</div>
 	</div><!-- container end -->
</section><!-- studyroom end -->	


<!-- 멘토링 리뷰 -->
<section class="review">
	<div class="container mt-5">
        <div class="row">
        <p class="studyRank-title">멘토링 리뷰</p>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/VhRkMc.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">코딩매니아</span>
                        	<span class="place">개발 / 자바</span>
                       	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/3a2cg1.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">닉네임로컬호스트</span>
                        	<span class="place">디자인 / UI & UX </span>
                       	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/JHR0Xz.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">아이스아메리카노</span>
                        	<span class="place">개발 / 자격증</span>
                       	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- 스터디 리뷰 -->
<section class="review">
	<div class="container mt-5">
        <div class="row">
        <p class="studyRank-title">스터디 리뷰</p>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/VhRkMc.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">코딩매니아</span>
                        	<span class="place">개발 / 자바</span>
                       	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/3a2cg1.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">닉네임로컬호스트</span>
                        	<span class="place">디자인 / UI & UX </span>
                       	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/JHR0Xz.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">아이스아메리카노</span>
                        	<span class="place">개발 / 자격증</span>
                       	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<c:import url="layout/footer.jsp" />

</body>
</html>