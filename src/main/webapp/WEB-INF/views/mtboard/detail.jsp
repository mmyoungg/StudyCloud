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
<script src="../resources/js/mntBoardView.js?ver=1"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#MtbtnList").click(function() {
			location.href = "/mtboard/list"
		})
		 $("#MtbtnUpdate").click(function() {
				location.href = "/mtboard/update?mtboardNo=${mtViewBoard.MTBOARD_NO}"
		 })
		$("#MtbtnDelete").click(function() {
			location.href = "/mtboard/delete?mtboardNo=${mtViewBoard.MTBOARD_NO}"
		}) 
	})

</script>
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

<div class="mt_hit">조회수 ${mtViewBoard.MTBOARD_HIT }</div>
<div class="mt_title">
	<h2 style="font-weight: 600; margin-bottom: 36px;">${mtViewBoard.MTBOARD_TITLE }</h2>
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

<p class="mt_id">${mtViewBoard.MEMBER_NICK }</p>

<table class="info_table">
<tr>
	<td class="info_name" scope="row">직무</td>
	<td>${mtViewBoard.JOBDUTY }</td><%-- <td>${viewBoard.boardNo }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">경력</td>
	<td>${mtViewBoard.CAREER }</td><%-- <td>${viewBoard.writerId }</td> --%>
</tr>
<tr>
	<td class="info_name" scope="row">현직</td>
	<td>${mtViewBoard.CO_NAME }</td>
</tr>
</table>

<span class="write_date"><fmt:formatDate value="${mtViewBoard.MTBOARD_DATE }" pattern="yyyy-MM-dd"/></span>

<div class="mt_time">1시간 / ${mtViewBoard.MT_PRICE } 원</div>
<hr>
</div> <!-- mt_wrap1 끝 -->
<div style="float: right;"><a class="filedown" href="/mtboard/download?fileUploadNo=${fileUpload.fileUploadNo}">${fileUpload.fileUploadOri }</a></div>


<!-- 본문 -->
<div class="mt_wrap2">

<div class="mt_content">
${mtViewBoard.MTBOARD_CONTENT }
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
	<button id="MtbtnList" class="btn btn-primary">목록</button>
		<button id="MtbtnUpdate" class="btn btn-primary">수정</button>
		<button id="MtbtnDelete" class="btn btn-primary">삭제</button>
</div>

</div><!-- mt_wrap3 끝 -->


</div> <!-- mt_allwrap 끝 -->
</main> <!-- main 끝 -->

<c:import url="../layout/footer.jsp" /> 

</body>
</html>















