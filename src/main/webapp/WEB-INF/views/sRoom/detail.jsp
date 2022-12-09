<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ include file="../layout/header.jsp"%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"></script> -->

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/ca40b4f408.js"></script>

<!-- TimePicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- flatPickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fd53e5f5c7d4e395ac101da53469ee2&libraries=services,clusterer,drawing"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 sdk -->

<link rel="stylesheet" href="../resources/css/sRoomDetail.css?ver=1">
<script defer src="../resources/js/sRoomDetail.js?ver=2"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 비밀글 체크박스 이벤트
	$("input[name=sRoomQnaSecret]").change(function() {
		if( $(this).is(":checked") ) {
			$(this).val(1);
			console.log($(this).val())
		} else {
			$(this).val(0);
			console.log($(this).val())
		}
	})
			
	// QnA 등록
	$("#qnaWriteBtn").on("click", function() {
		var title = $("#sRoomQnATitle").val();
		var content = $("#sRoomQnAContent").val();
		if( !($("input[name=sRoomQnaSecret]").is(":checked")) ) {
			$("input[name=sRoomQnaSecret]").val(0);
		}
		var secret = $("input[name=sRoomQnaSecret]").val();
		var sRoom_No = ${sRoomView.SROOM_NO};
		console.log(title);
		console.log(content);
		console.log(secret);
		
		$.ajax({
			url: "/sRoom/qnaInsert",
			type: "POST",
			data: { "sRoomQnATitle" : title, "sRoomQnAContent" : content, "sRoomQnaSecret" : secret, sRoomNo : sRoom_No },
			success : function(r){
				console.log('[QnA 등록] AJAX 요청 성공');
				$("#sRoomQnATitle").val('');
				$("#sRoomQnAContent").val('');
				$(".modal-custom").css("display", "none");
				$("#sRoomQnaArea").html(r);
				
			} 
		})
	}) // QNA
	
}) // end

</script>
</head>


<body>
<input type="hidden" id="sAddr" value="${sRoomView.SROOM_ADDR}">
<input type="hidden" id="sName" value="${sRoomView.SROOM_NAME}">

<div class="content">
	<div class="detail-wrap">
		<div class="left">
			<h2>💠 ${sRoomView.SROOM_NAME}</h2>
			<img src="/upload/${sRoomView.FILEUPLOAD_STOR }" class="img-fluid" alt="...">
			<div id="sRoom-menu-wrap">
				<ul class="sRoom-menu-ul">
					<li><a href="#sec1" id="move">공간소개</a></li>
					<li><a href="#sec2" id="move">이용&환불규정</a></li>
					<li><a href="#sec3" id="move">오시는길</a></li>
					<li><a href="#sec4" id="move">QnA</a></li>
					<li><a href="#sec5" id="move">리뷰</a></li>
				</ul>
			</div>
			
			<div class="sec-1 scroll" id="sec1">
				<h3>💠 스터디룸 소개</h3>
				<div class="infoBox">
					${sRoomView.SROOM_INFO }
				</div>
			</div>
			
			<div class="sec-2 scroll" id="sec2">
				<h3>❕ 이용&환불규정</h3>
				<div class="infoBox">
					${sRoomView.SROOM_ROLE }
				</div>
			</div>
			
			<div class="sec-3 scroll" id="sec3">
				<div class="qna">
					<h3 class="qna_h3">🚖 오시는길</h3>
				</div>
				<div class="infoBox">
					<div id="map" style="width:100%; height:400px; margin-top: 30px;"></div>
					<div class="mapInfoDiv">
								<h4>${sRoomView.SROOM_NAME}</h4>
								<p class="s-addr" id="s-addr">${sRoomView.SROOM_ADDR}</p>
								<button class="map-btn" id="map-btn">길찾기</button>
					</div>
				</div>
			</div>
			
			<div class="sec-4 scroll" id="sec4">
				<!-- Trigger/Open The Modal -->
				<div class="qna">
					<h3 class="qna_h3">❔ QnA</h3>
					<button class="modal-custom-button" href="#myModal1">QnA 작성</button>
				</div>
				
				<!-- The Modal -->
				<div id="myModal1" class="modal-custom">

   				<!-- Modal content -->
    				<div class="modal-content">
        				<div class="modal-header">
           					<h1 class="modal-title fs-5" id="exampleModalLabel">QnA 작성하기</h1>
        				</div>
        
        				<div class="modal-body">
           					<form>
          						<div class="mb-3">
            						<div class="popup-text">제목</div>
            						<input type="text" class="form-control" id="sRoomQnATitle">
          						</div>
          						<div class="mb-3">
            						<div class="popup-text">문의내용</div>
            						<textarea class="form-control" id="sRoomQnAContent"></textarea>
          						</div>
          						<div class="mb-3">
            						<label class="form-check-label">비밀글 설정</label>            						
            						<input type="checkbox" class="form-check-input" name="sRoomQnaSecret">
          						</div>
        					</form>	
        				</div>
        
         				<div class="modal-footer">
        					<button type="button" class="close-modal" id="close">취소</button>
           					<button type="button" class="button" id="qnaWriteBtn">작성하기</button>
        				</div>
    				</div>
				</div>
				
				
			<div id="sRoomQnaArea"><c:import url="/WEB-INF/views/sRoom/sRoomQnaList.jsp" /></div>
		
			</div>
			
			<div class="sec-5 scroll" id="sec5">
				<div class="qna">
					<h3 class="qna_h3">💬 리뷰</h3>
					<button class="modal-custom-button" href="#myModal2">리뷰 쓰기</button>
					<h6 class="review_intro">후기 개수
						<strong class="review_point"><em>31</em>개</strong>
						<span class="dot"></span>
						<span>평균 별점<strong class="review_point"><em>5.0</em></strong></span>
					</h6>
					<hr>
					
    			</div>
    			
    			<!-- The Modal -->
				<div id="myModal2" class="modal-custom">

   				<!-- Modal content -->
    				<div class="modal-content">
        				<div class="modal-header">
           					<h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 작성하기</h1>
        				</div>
        				<hr>
        				<div class="modal-body">
           					<form>
          						<div class="mb-3">
          						<div class="popup-text">별점 등록하기</div>
            						<div class="star-rating space-x-4">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
									</div>
          						</div>
          						<div class="mb-3">
            						<div class="popup-text">리뷰 남기기</div>
            						<textarea class="form-control" id="message-text"></textarea>
          						</div>
        					</form>	
        				</div>
        
         				<div class="modal-footer">
        					<button type="button" class="close-modal" id="close">취소</button>
           					<button type="button" class="button">작성하기</button>
        				</div>
    				</div>
				</div>
				
				<div class="infoBox">
					<ul class="Qna_list">
						<li class="qna_hr">
							<div class="qna_box">
								<span><img src='https://ifh.cc/g/oDFOOq.jpg' class="pimg"></span>
								<p class="write_name">오쪼쪼</p>
								<div class="star-rating2 space-x-4">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
								</div>
								<p class="qna_cont">잘 이용하고 갑니다!</p>
								<p class="write_date">2022-11-06</p>
								<button class="miniBtn">수정</button><button class="miniBtn">삭제</button>
							</div>
						</li>
						<li class="qna_hr">
							<div class="qna_box">
								<span><img src='https://ifh.cc/g/ocJk39.jpg' class="pimg"></span>
								<strong class="write_name">우쭈쭈</strong>
								<div class="star-rating2 space-x-4">
										<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
										<label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
										<label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
										<label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
										<label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
										<label for="1-star" class="star">★</label>
								</div>
								<p class="qna_cont">시설도 깔끔하고 화장실도 깨끗해서 전체적으로 마음에 듭니다.</p>
								<p class="write_date">2022-11-06</p>
								<button class="miniBtn">수정</button><button class="miniBtn">삭제</button>
							</div>
						</li>
					</ul>				
				</div>
 		   </div>
</div>
				

				

				


		<div class="right">
			<div class="sRoomBtn">
				<button class="detail-button"><img src="https://ifh.cc/g/67soWT.png">찜하기</button>
				<button class="detail-button-share"><img src="https://ifh.cc/g/phQSC6.png">공유하기</button>
				<div class="shareModal hidden">
				  <div class="bg"></div>
				  <div class="modalBox">
				  	<div class="shareSpace">
				    	<a class="shareIcon" id="kakaoShareBtn"><img src="https://ifh.cc/g/kfhxzw.png" border="0">&nbsp;&nbsp;카카오톡 공유하기</a>
				    </div>
				    
				    <div class="shareSpace">
				   		<a class="shareIcon" id="twitterShareBtn"><img src="https://ifh.cc/g/VxDANH.png" border="0">&nbsp;&nbsp;트위터 공유하기</a>
				    </div>
				    
				    <div class="shareSpace" style="margin: 25px 25px 5px 25px;">
				   		<a href="#" class="shareIcon" id="urlShareBtn" title="복사"><img src="https://ifh.cc/g/yWfbMz.png" border="0">&nbsp;&nbsp;URL 복사하기</a>
				    </div>
				    
				    <div class="shareSpace-copied-msg" id="urlCopiedMsg"><img src="https://ifh.cc/g/rOZoRQ.png">&nbsp;URL이 복사 되었습니다.</div>
				    
				    <button class="share-closeBtn">닫기</button>
				  </div>
				</div>
				
			</div>
			
			<div class="detail-resrve-info">
				<div class="detail-right-info">
					<h5>${sRoomView.SROOM_NAME}</h5>
					<p class="s-addr" id="s-addr">${sRoomView.SROOM_ADDR}</p>
				</div>
				<div class="detail-right-info">
					<h5>${sRoomView.SROOM_PRICE} 원/시간</h5>
					<p class="s-addr" id="s-addr">최소인원 : ${sRoomView.SROOM_PEOPLE}명</p>
				</div>
				<div class="detail-right-info">
					<h5>이용날짜 📅</h5>
				</div>
				<div class="detail-right-calendar">
					<input type="text" id="sRoomSelectDate" class="sRoom-cal" placeholder="예약날짜를 선택하세요.">
				</div>
				
				<div class="detail-right-info">
					<div class="detail-right-time" style="margin-top: 15px;">
					<h5>이용 시간 🕙</h5>
				</div>
				
				<div class="detail-right-time-select">
					<input id="sTimepicker" class="time-select" type="text" placeholder="시작시간을 선택하세요." value="" >
					<input id="eTimepicker" class="time-select" type="text" placeholder="시작시간을 선택하세요." value="">					
				</div>
				
				<div class="detail-right-time">
					<div class="detail-right-info">
					<h5>예약정보 확인 ✔️</h5>
				</div>
					
				</div>
				<div class="detail-clicked-info-wrap">	
					<div class="detail-clicked-info-wrap">			
 					<input type="text" id="clickedDate" value="" class="sRoom-clicked-info" readonly>
					<input type="text" id="clickedStartTime" value="" class="sRoom-clicked-info-time" readonly>
					<input type="text" id="timeDuration" class="sRoom-timeDuration" value="" style="width: 53px;" readonly> 
					</div>
				</div>
				<div class="detail-right-time">
					<div class="detail-right-info">
					<h5>이용 인원 👨‍👧‍👧</h5>
				</div>
				
				<div class="detail-right-people-select">
					<div id="menu2">
						<div class="list-member">
							<div class="number-input">
							<button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
 							<input class="quantity" min="1" name="quantity" value="1" type="number">
  							<button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
							</div>		
						</div>
					</div>    					
				</div>
				
				<div class="detail-right-time">
					<div class="detail-right-info">
					<h4>가격</h4>
					
					<input type="text" value="3,000원" class="price-input-box">
				</div>
				
				<div>
					<button class="detail-reserve-button">예약하기</button>
				</div>
				
			</div>
			
	</div>
</div>
</div>
</div>
</div>

<script src="../resources/js/sRoomCalendar.js?ver=1"></script>
</body>



</html>