<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

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

/* 슬라이드 */
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
<div class="container">
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
		        <img src="/resources/img/banner(1).jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		        <img src="/resources/img/banner(2).jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		        <img src="/resources/img/banner(1).jpg" class="d-block w-100">
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
                <p class="mentoRank-title">지금 뜨고있는 멘토 ✨</p>
                <div id="owl-one" class="mento-list owl-carousel owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage">
						
						<!-- 멘토 리스트 -->
						<c:forEach items="${mtList }" var="hashmap">
                            <div class="owl-item active">
                                <div class="mento-item">
                               		<img src="" alt="게시글 첨부파일"><!-- 게시글 첨부파일 -->
                                   	<p class="mento-title">${hashmap.MTBOARD_TITLE }</p>
                                   	<p class="mento-name">${hashmap.MEMBER_NICK } 멘토</p>
                                   	<p class="mento-price">₩ ${hashmap.MT_PRICE }</p>
                                   	<button class="mento-field">${hashmap.FIELD }</button>
                                </div>
                            </div>
						</c:forEach>
                        </div>
                    </div><!-- 멘토 end -->
            
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
        </div>
    </div><!-- container end -->
</section><!-- mentoRank end -->


<!-- 마감임박 스터디 -->
<section class="studyRank">
	<div class="container">
     <div class="row">
         <div class="col-12">
             <p class="studyRank-title">마감임박 스터디 ⏰</p>
             <div id="owl-two" class="study-list owl-carousel owl-loaded owl-drag">
                 <div class="owl-stage-outer">
                     <div class="owl-stage">
                     
                     <!-- 스터디 리스트 -->
                     <c:forEach items="${sList }" var="hashmap">
                         <div class="owl-item active">
                             <div class="study-item">
                           		<img src="" alt="게시글 첨부파일"><!-- 게시글 첨부파일 -->
                               	<p class="study-title">${hashmap.STUDY_TITLE }</p>
                               	<p class="study-name">${hashmap.MEMBER_NICK } 스터디장</p>
                               	<p class="study-people">${hashmap.STUDY_PEOPLE } 명</p>
                               	<button class="study-tag">${hashmap.STUDY_TAG }</button>
                             </div>
                         </div>
                     </c:forEach>
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
     </div>
 </div><!-- container end -->
</section><!-- 마감임박 스터디 end -->



<!-- TEST -->
<%-- <c:forEach items="${srListFile }" var="hashmap"> --%>
<%-- <img src="/upload/${sRoomFile.fileUploadStor }" alt="studyroom-img"> --%>
<%-- <p>${hashmap.SROOM_NAME}</p> --%>
<%-- </c:forEach> --%>


<!-- 인기 스터디룸 -->
<section class="studyroom">
	<div class="container">
     	<div class="row">
        	<div class="col-12">
            	<p class="studyRank-title">인기 스터디룸</p>
				<div class="card-group" id="sRoom-wrap">
				
					<c:forEach items="${srList }" var="sr">
   					<div class="card" id="sRoom">
						<img src="/upload/${sr.FILEUPLOAD_STOR }" alt="studyroom-img">
						<div class="card-title">
				    		<p class="sRoomName">${sr.SROOM_NAME }</p>
				  		</div>
					</div>
					</c:forEach>
					
				</div>
         	</div>
     	</div>
 	</div><!-- container end -->
</section><!-- studyroom end -->	


<!-- 멘토링 리뷰 -->
<section class="review">
	<div class="container mt-5">
        <div class="row" id="mtReview">
        <p class="studyRank-title">멘토링 리뷰</p>
		<c:forEach items="${mtReviewList }" var="hashmap">
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" id="mark" src="https://i.imgur.com/ECXzJ1k.png" width="40">
                    <p>${hashmap.MTREVIEW_CONTENT }<br><br></p>
                    <div class="d-flex flex-row align-items-center">
                    	<img class="rounded-circle" src="https://ifh.cc/g/VhRkMc.jpg" width="40" height="40">
                        <div class="ml-2 about">
                        	<span class="d-block name">${hashmap.MEMBER_NICK }</span>
                        	<span class="place">개발 / 자바</span>
                       	</div>
                    </div>
                </div>
            </div>
		</c:forEach>
        </div>
    </div>
</section>


<!-- 스터디 리뷰 -->
<section class="review">
	<div class="container mt-5">
        <div class="row" id="stReview">
        <p class="studyRank-title">스터디 리뷰</p>
            <div class="col-md-4">
                <div class="testimonial-1">
                	<img class="mb-3" id="mark" src="https://i.imgur.com/ECXzJ1k.png" width="40">
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