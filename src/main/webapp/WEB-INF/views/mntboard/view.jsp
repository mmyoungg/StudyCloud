<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘티찾기｜게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../layout/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="/resources/css/mntBoardView.css?ver=2"> 
<script src="../resources/js/mtBoardDetail.js?ver=1"></script>

</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/mntboard/list"
	})
	
	/* $("#btnUpdate").click(function() {
		location.href = "/board/update?boardNo=${viewBoard.boardNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/delete?boardNo=${viewBoard.boardNo }"
	}) */
})
</script>


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



<div class="mnt_allwrap">

<div class="mnt_wrap1">

<div class="mnt_hit">조회수 ${mntViewBoard.MNTBOARD_HIT }</div>
<div class="mnt_title">
	<h2 style="font-weight: 600; margin-bottom: 36px;">${mntViewBoard.MNTBOARD_TITLE }</h2>
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

<br><br>
<br>
<span class="mnt_id">${mntViewBoard.MEMBER_NICK }</span>
<span class="write_date"><fmt:formatDate value="${mntViewBoard.MNTBOARD_DATE }" pattern="yyyy-MM-dd HH:mm"/></span>
<hr>
</div> <!-- mnt_wrap1 끝 -->



<!-- 본문 -->
<div class="mnt_wrap2">

<div class="mnt_content">
${mntViewBoard.MNTBOARD_CONTENT }
</div>

</div><!-- mnt_wrap2 끝 -->


<div class="mnt_wrap3">
<h5>댓글<span class="reply_cnt"> 3</span></h5>
<hr>


<!-- 댓글작성 -->
<form class="mb-3" name="mnt_review" id="mnt_review" method="post">
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
				<a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
					</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt">
		~~~웅앵웅앵 이렇게 하시면 됩니다
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
				<a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
					</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt">
		쪽지 보냈어요 확인요
			</div>
			</div>
		</div>
	</li>
	</ul>
	
<c:import url="/WEB-INF/views/mntboard/replyPaging.jsp" />



<div class="btn-wrap">
	<button id="btnList" class="btn btn-primary">목록</button>
		<button id="btnUpdate" class="btn btn-primary">수정</button>
		<button id="btnDelete" class="btn btn-primary">삭제</button>
</div>

</div><!-- mnt_wrap3 끝 -->


</div> <!-- mnt_allwrap 끝 -->
</main> <!-- main 끝 -->

<c:import url="../layout/footer.jsp" /> 

</body>
</html>



