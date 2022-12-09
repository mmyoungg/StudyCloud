<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<c:import url="../layout/header.jsp" />   
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">

.content { width: 1000px; margin: 70px auto; }
table { margin: 40px 5px auto; }
table th { text-align: center; background-color: #E3EFF9;  }
.miniBtn { background-color: #6CC4DC; border: 0; width: 60px; margin: 1px; 
		   color: white; font-size: 14px; text-decoration: none; }
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 3px; 
		  border-radius: 5px; color: white; }
.row { margin: 40px 5px auto; }
.fBoard_content { height: 170px; }
#comment { width: 900px; }
.fBoard_view_file p { margin-bottom: 6px; font-size: 15px; color: #3f92b7; }
.fBoard_cmt { margin: 20px 0 10px; 0 }
.empty_fBoard_file { font-size: 11px; }
.fBoardContentImg img { width: 300px; height: 250px; margin: 10px; }
.page-link { color: #282828; }
.page-link:hover { background-color: #e3eff9; }
.active>.page-link { background-color: #3f92b7; border-color: #3f92b7; }
.cmt_box { position: relative; padding: 0 0 24px 0; margin-top: 8px; }
.cmt_writer { color: #3f92b7; font-weight: bold; margin: 10px auto; }
.cmt_cont { position: absolute; left: 150px; top: 2px; height: 70px; width: 85%; border: 1px solid #6cc4dc;}
.cmt_date { color: #6cc4dc; font-size: 12px; margin: 0 0 5px 0; font-weight: bold; }
.miniBtn { background-color: #6CC4DC; border: 0; width: 60px; margin: 1px; 
		   color: white; font-size: 14px; text-decoration: none; }
.cmt_header { margin: 25px 0 15px 0; }
.CmtBtn { text-decoration: none;  width: 15px; margin-right: 8px; color: #6cc4dc;}
.CmtBtn:hover { cursor: pointer; color: #3f92b7; }	
.CmtBtnBox { margin-top: 8px; }	   

</style>

<script type="text/javascript">
	$(document).ready(function() {
		var pageNo = ${paging.curPage};
		var BoardNo = ${fBoardView.FBOARD_NO}
		console.log(pageNo); // 현재페이지 확인
		console.log(BoardNo); // 현재 게시글번호 확인
		pagingAjax(1, BoardNo);	
		
		$("#listBtn").click(function() {
			location.href="/freeBoard/list"
		})
		
 		$("#fBoardUpdateBtn").click(function() {
			location.href="/freeBoard/update?fBoardNo=${fBoardView.FBOARD_NO }"
		})
		
		 $("#fBoardDeleteBtn").click(function() {
			location.href="/freeBoard/delete?fBoardNo=${fBoardView.FBOARD_NO}"
		})
		
		// 댓글 작성
		$("#commentInsertBtn").click(function() {
			var boardNo = ${fBoardView.FBOARD_NO};
			//var memNick = ${fBoardView.MEMBER_NICK }
			var cmtContent = $("#fBoardCmt").val();
			
			console.log("-----댓글 등록 정보-----")
			console.log("게시글번호 : " + boardNo);
			//console.log("닉네임 : " + memNick);
			console.log("댓글내용 : " + cmtContent);
			console.log("-------------------")
			
			$.ajax({
				
				type:"POST",
				url:"/freeBoard/cmtInsert",
				dataType: "html",
				data : {fBoardNo: BoardNo, commtContent: cmtContent},
				success : function(){
					console.log('[댓글 등록] AJAX 전송 성공!');
					pagingAjax(pageNo, BoardNo);
					$("#fBoardCmt").val('');
				} 
			}) // end ajax
		}) // end Insert
				
})

// 댓글List
function pagingAjax(pageNo, BoardNo) {
	var page_no = pageNo;
	var BoardNo = ${fBoardView.FBOARD_NO}
	console.log(page_no);
	
	$.ajax({
		type:"GET",
		url: "/freeBoard/cmtListAjax",
		dataType: "html", 
		data : {curPage: page_no, fBoardNo: BoardNo},
		success : function(r){
		console.log('[댓글 페이징] AJAX 요청 완료');
			$("#fBoardCmtList").html(r);
		} 
	})
}
	
/* function cmtUpdate(cmtno) {
	
	console.log("upddate 함수호출 성공, 댓글번호 : " + cmtno);
	var uArea = '';
	uArea += '<strong class="cmt_writer">' + ${cmtList.MEMBER_NICK } + '</strong>';
	uArea += '<div class="cmt_cont_box">';	
	uArea += '<div class="cmt_cont"><textarea class="form-control" id="fBoardCmt" rows="2" name="fBoardCmt">' + ${cmtList.COMMT_CONTENT } + '</textarea></div>';
	uArea += '</div>';
	uArea += '<a class="miniBtn" onclick="commentUpdateProc(' + ${cmtList.COMMT_NO} + ');">수정</a><a class="miniBtn">삭제</a>';

	$('.cmt_box').html(uArea);
}
	 */

</script>

<div class="content">
<h2>자유게시판</h2>


<form action="" method="post">
<table class="table">
   <tbody>
    <tr>
      <th>작성자</th>
      <td>${fBoardView.MEMBER_NICK }</td>
      <th>카테고리</th>
      <td>${fBoardView.CATEGORY_NAME }</td>
    </tr>
    <tr>
      <th scope="row">작성일시</th>
      <td><fmt:formatDate value="${fBoardView.FBOARD_DATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
      <th>조회수</th>
      <td>${fBoardView.FBOARD_HIT }</td>
    </tr>
    <tr>
      <th scope="row">제목</th>
      <td colspan="3">${fBoardView.FBOARD_TITLE }</td>
    </tr>
    <tr>
      <th colspan="4">내용</th>
    </tr>
    <tr>
      <td colspan="4" class="fBoard_content">${fBoardView.FBOARD_CONTENT }
	  <c:forEach items="${fileUpload }" var="fBoardFileList">
	 	<div class="fBoardContentImg">
        <img src="/freeBoard/display?fileUploadStor=${fBoardFileList.fileUploadStor }">
	 	</div>
	  
	  </c:forEach>
      
      </td>
    </tr>
	</table>
	
	<div class="fBoard_view_file">
	<p>첨부파일</p>
	<c:choose>
	<c:when test="${fn:length(fileUpload) > 0}">
		<c:forEach items="${fileUpload }" var="fBoardFileList">
		<a href="/freeBoard/download?fileUploadNo=${fBoardFileList.fileUploadNo}">${fBoardFileList.fileUploadOri }</a>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p style="font-size: 12px;">첨부된 파일이 없습니다.</p>
	</c:otherwise>
	</c:choose>
	</div>
	<div class="preview" class="fBoardContent"></div>
	
	<label for="content" class="fBoard_cmt">comment 작성하기</label>
    	<div class="input-group">
        	<textarea class="form-control" id="fBoardCmt" rows="2" name="fBoardCmt"></textarea>
            <span class="input-group-btn">
            	<button class="button" type="button" id="commentInsertBtn">등록</button>
            </span>
        </div>
</form>
<div id="fBoardCmtList"></div>



<div class="row"></div>
	<div class="col text-center">
  		<button class="button mx-auto" type="button" id="listBtn">목록</button>
  		<button class="button mx-auto" type="button" id="fBoardUpdateBtn">수정</button>
  		<button class="button mx-auto" type="button" id="fBoardDeleteBtn">삭제</button>
	</div>
</div>

</div>



</body>
</html>