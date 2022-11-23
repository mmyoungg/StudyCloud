<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="layout/header.jsp" />

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/mainpage.css" />

<!-- 슬라이더 버튼 css -->
<link rel='stylesheet prefetch' href='//cdnjs.cloudflare.com/ajax/libs/flickity/1.1.0/flickity.min.css'>

<!-- ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha256-pTxD+DSzIwmwhOqTFN+DB+nHjO4iAsbgfyFq5K5bcE0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha256-UhQQ4fxEeABh4JrcmAJ1+16id/1dnlOEVCFOxDef9Lw=" crossorigin="anonymous" />

    
<script>
(function($) {
    'use strict';
    $(function () {
        //Event carousel
        $("#events").owlCarousel({
            loop:true,
            margin:0,
            autoPlay: 3000,
            responsive:{
                0:{
                    items:1
                },
                768:{
                    items:2
                },
                979:{
                    items:3
                },
                1199:{
                    items:4
                }
            },
            singleItem : false,
            dots: false,
            nav: true,
            navText : ["",""]
        });
        $(".btn-event-show").collapse();
        //Events: Tooltip
        $('.mento-profile').tooltip({ boundary: 'window' });
        feather.replace();
    });
})(jQuery);


(function($) {
    'use strict';
    $(function () {
        //Event carousel
        $("#events").owlCarousel({
            loop:true,
            margin:0,
            autoPlay: 3000,
            responsive:{
                0:{
                    items:1
                },
                768:{
                    items:2
                },
                979:{
                    items:3
                },
                1199:{
                    items:4
                }
            },
            singleItem : false,
            dots: false,
            nav: true,
            navText : ["",""]
        });
        $(".btn-event-show").collapse();
        //Events: Tooltip
        $('.study-profile').tooltip({ boundary: 'window' });
        feather.replace();
    });
})(jQuery);

</script>


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
				    Go ahead, hover over search
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
	                <div id="events" class="mento-list owl-carousel owl-loaded owl-drag">
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
	                        <button type="button" role="presentation" class="owl-prev">
	                            <div class="owl-nav-wrapper bg-soft-primary">
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
	                                class="feather feather-chevron-left text-primary">
	                                <polyline points="15 18 9 12 15 6"></polyline>
	                            </svg>
	                        </div>
	                    </button>
	                    <button type="button" role="presentation" class="owl-next">
	                            <div class="owl-nav-wrapper bg-soft-primary">
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
	                                class="feather feather-chevron-right text-primary">
	                                <polyline points="9 18 15 12 9 6"></polyline>
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
	                <div id="events" class="study-list owl-carousel owl-loaded owl-drag">
	                    <div class="owl-stage-outer">
	                        <div class="owl-stage">
	                            <!-- 1 -->
	                            <div class="owl-item active">
	                                <div class="study-item">
	                                    <a href="#" class="study-title">초보자도 쉽게 배우는 프론트앤드</a>
	                                    <p class="study-name">OOO 멘토</p>
	                                </div>
	                            </div>
	                    
	                            <!-- 2 -->
	                            <div class="owl-item">
	                                <div class="study-item color">
	                                    <a href="#" class="study-title">비전공자도 가능한 웹사이트 만들기</a>
	                                    <p class="study-name">OOO 멘토</p>
	                                </div>
	                            </div>
	                    
	                            <!-- 3 -->
	                            <div class="owl-item">
	                                <div class="study-item">
	                                    <a href="#" class="study-title">Spring MVC를 이용해 웹사이트 만들기1</a>
	                                    <p class="study-name">OOO 멘토</p>
	                                </div>
	                            </div>
	                            
	                            <!-- 4 -->
	                            <div class="owl-item">
	                                <div class="study-item">
	                                    <a href="#" class="study-title">Spring MVC를 이용해 웹사이트 만들기2</a>
	                                    <p class="study-name">OOO 멘토</p>
	                                </div>
	                            </div>
	                            
	                            <!-- 5 -->
	                            <div class="owl-item">
	                                <div class="study-item">
	                                    <a href="#" class="study-title">5</a>
	                                    <p class="study-name">OOO 멘토</p>
	                                </div>
	                            </div>
	                            
	                        </div>
	                    </div>
	            
	                    <div class="owl-nav">
	                        <button type="button" role="presentation" class="owl-prev">
	                            <div class="owl-nav-wrapper bg-soft-primary">
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
	                                class="feather feather-chevron-left text-primary">
	                                <polyline points="15 18 9 12 15 6"></polyline>
	                            </svg>
	                        </div>
	                    </button>
	                    <button type="button" role="presentation" class="owl-next">
	                            <div class="owl-nav-wrapper bg-soft-primary">
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
	                                class="feather feather-chevron-right text-primary">
	                                <polyline points="9 18 15 12 9 6"></polyline>
	                            </svg>
	                        </div>
	                    </button>
	                </div>
	            </div>
	        </div>
	    </div><!-- container end -->
	    </div>
    </section><!-- 마감임박 스터디 end -->



<c:import url="layout/footer.jsp" />
