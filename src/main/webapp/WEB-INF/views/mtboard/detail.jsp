<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토찾기｜게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="/resources/css/mtBoardDetail.css?ver=2"> 
<script src="../resources/js/mtBoardDetail.js?ver=1"></script>

</head>
<body>


 <!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="background-color: #e3eff9; padding: 20px 26px 15px 41px;" >
      <div class="modal-header" style="border: none; font-size: 20px; padding-bottom: 35px">☁️ 공유하기 ☁️
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color: white"></button>
      </div>
      
      <div class="modal-body">
      <button type="button" class="btn btn-secondary" id="link_btn" onclick="copyUrl()">
 		<i class="bi bi-link-45deg"></i>
	 </button> 링크 공유
 		
   <button type="button" id="kakao_btn" onClick="sendLinkCustom();" value="Custom">
      <img id="kakao_img" alt="카톡공유" src="https://ifh.cc/g/tqp2a6.png" style="border: none;">
      카카오톡 공유
      </button>
      </div>
    </div>
  </div>
</div> 



<!-- content 전체 wrap -->
<main id="main">

<!-- 상단 이미지바 -->
<div class="mento_intro">
	<div class="mento_intro_content">
			<h1>☁️ ☁️ ☁️</h1>
	</div>
</div>



<div class="mt_allwrap">


<div class="mt_wrap1">

<div class="mt_hit">조회수 3</div>
<div class="mt_title">
	<h2 style="font-weight: 600; margin-bottom: 36px;">백엔드 개발자 과외 합니다</h2>
	<%-- ${detailBoard.mtboardTitle} --%>
</div>


<!-- 로그인시에만 눌리게 / 비로그인시 로그인해주세요 창 띄움-->
<!-- 찜하기 아작스로 구현 / 찜하기가 완료/취소되었습니다 멘트-->
<!-- 공유 -->

<div class="func_btn">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="share">
<i class="bi bi-share"></i>
</button>

<!-- 찜하기 -->
<button type="button" class="btn btn-primary" id="heart">
 	<i class="bi bi-heart"></i>
</button>

<!-- 쪽지 -->
<button type="button" class="btn btn-primary" id="msg">
	<i class="bi bi-envelope"></i>
</button>
</div>

<!-- 아이디 부분 (수업자료보기) -->

<p class="mt_id">아리사랑</p>
<%-- ${detailBoard.memberId} --%>

<table class="info_table">
<tr>
	<td class="info_name" scope="row">직무</td>
	<td>백엔드</td><%-- <td>${viewBoard.boardNo }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">경력</td>
	<td>미들(4~8년)</td><%-- <td>${viewBoard.writerId }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">현직</td>
	<td>네카라쿠배</td><%-- <td>${viewBoard.writerNick }</td> --%>
</tr>
</table>

<span class="write_date">2022-11-20 오후 3:30</span>

<div class="mt_time">1시간 / 10,000원</div>
<hr>
</div> <!-- mt_wrap1 끝 -->



<!-- 본문 -->
<div class="mt_wrap2">

<div class="mt_content">

않으며 가고 집중이다, 곳의 대하고 있다. 몸을 재킷과 선의 가지 인간은 두 동전의 찾다 지니는걸. 
학원이 것 춤을 다른 위력이, 저에서 그 끼어들어서 인생은 하고 필요하다. 거 것 갈긴 있는 인정받고 버린, 자꾸 거듭하다. 
국내를 국제다 맹목을 지면 흘겨보다. 한다 경찰서의 보이는 모임의 오후가, 전파조차 시장은, 다시 던지어 위하다 하다. 
문화에 익히는지 후예다 셈 노래가 웃다. 앨범을 하여 문학적 도시에 때를 군사력을 하자. 

쓰레기에 뜻한 구호의 정도의 정부와 2024년 동안에 할걸. 수돗가의 하지 입원이, 커피의, 벌겋는 멀티미디어화가, 
언제 이곳저곳 해외 하는 안다. 저가 다음이 짐을, 추수를, 죽다 경쾌하라. 작은 2020년대 부여하고 생각한 그러나 화폐의 시작하여 
고맙는 복잡다기하는 질환을 쉽다. 하던 있다 감자의 논의 기우에서, 지켜보아요 찾아갈 위하다. 워커치고 있야, 
걸작이 아니고 부서에서 세우지 하는지. 남 생활으로 칠월은 나에 부분이 빨라 있다. 

길의 혹은 되다, 신령하고, 이제 온다. 상태가 부르어 펼쳐진 도와 가지다 쓰라. 
현상이 하사가 듯하여 열심히 사람을 선거철을, 부도덕하는 대치한 아니할지. 있다 말하고 계급은 하는 안쓰럽다 그런 스치는 단순하다. 
상품의 기대하는 41마리 말이, 그럼 거치다 같을지 촌스럽으네. 
졸음에 끼면 피지배를 곡과 개입이 자본의 어둡습니다 악동은, 하는, 넘어가다. 
아직 내모는 도그마의, 대리나 날리다 특히 사태다 실소하다. 
죽은 밑이 자유롭은 것 잔칫집에서 극복하는 번, 노릇은 골품제를 떳떳하라. 
득표력도 착용하여서 아깝아 한 먹습니다 그렇고 말의 지나치다.
</div>

<a class="btn btn-primary" href="/mtboard/applyMnt" type="button" style="float: right; font-size: 15px;">
신청하기</a>
</div><!-- mt_wrap2 끝 -->

<div class="mt_wrap3">
<h5>후기</h5>
<hr>


<!-- 댓글작성 -->
<form class="mb-3" name="mt_review" id="mt_review" method="post">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" id="reviewContents"
				  placeholder="후기를 입력해주세요"></textarea>
	</div>
	
 <!-- Post 구현해야됨 -->
	 <button class="btn btn-primary" id="btnReview">등록</button>
	
</form>						



<!-- 댓글 페이징 -->
<div class="reply_not_div">
					
</div>
	<ul class="reply_content_ul">
	<li>
		<div class="comment_wrap">
		<div class="reply_top">
			<span class="id_span">아리멍멍</span>
			<span class="date_span">2022-11-16</span>
			<span class="rating_span">★<span class="rating_value_span">5.0</span></span>
				<a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
					</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt">
		너무 유익하고 도움이 많이 됐습니다 추천해요!!
			</div>
			</div>
		</div>
	</li>
	</ul>
	<ul class="reply_content_ul">
	<li>
		<div class="comment_wrap">
		<div class="reply_top">
			<span class="id_span">아리멍멍</span>
			<span class="date_span">2022-11-16</span>
			<span class="rating_span">★<span class="rating_value_span">5.0</span></span>
				<a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
					</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt">
		너무 유익하고 도움이 많이 됐습니다 추천해요!!
			</div>
			</div>
		</div>
	</li>
	</ul>
	
<c:import url="/WEB-INF/views/mtboard/replyPaging.jsp" />



<div class="text-center" style="margin-top: 241px">
	<button id="btnList" class="btn btn-primary">목록</button>
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-primary">삭제</button>
</div>

</div><!-- mt_wrap3 끝 -->


</div> <!-- mt_allwrap 끝 -->
</main> <!-- main 끝 -->

<c:import url="../layout/footer.jsp" /> 

</body>
</html>















