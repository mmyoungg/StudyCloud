<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<c:import url="../layout/header.jsp" />   

<style type="text/css">

.content { width: 1000px; margin: 70px auto; }
table { margin: 40px 5px auto; }
table th { text-align: center; background-color: #E3EFF9;  }
.miniBtn { background-color: #6CC4DC; border: 0; width: 40px; margin: 1px; 
		  border-radius: 5px; color: white; font-size: 10px; }
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.row { margin: 40px 5px auto; }
#comment { width: 900px; }
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").click(function() {
			location.href="/freeBoard/list"
		})
		/* 
		$("#btnUpdate").click(function() {
			location.href="/board/update?boardNo=${view.board_no}"
		})
		
		$("#btnDelete").click(function() {
			location.href="/board/delete?boardNo=${view.board_no}"
		}) */
})
</script>

<div class="content">
<h2>자유게시판</h2>


<form action="" method="post">
<table class="table">
   <tbody>
    <tr>
      <th>작성자</th>
      <td colspan="3">${fBoardView.MEMBER_NICK }</td>
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
      
      <td colspan="4">${fBoardView.FBOARD_CONTENT }</td>
    </tr>
	</table>
	
	<div class="fBoard_view_file">
	<a href="/freeBoard/download?fileUpload_no=${fileUpload.fBoardNo}">${fileUpload.fileUploadOri }</a>
	</div>
	
	<label for="content">comment 작성하기</label>
    	<div class="input-group">
        	<input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하세요.">
            <span class="input-group-btn">
            	<button class="button" type="button" name="commentInsertBtn">등록</button>
            </span>
        </div>

	
<table class="table">
    <tr>
      <th colspan="4">댓글(2)</th>
    </tr>
    <tr>
      <th style="width: 15%;">오쪼쪼</th>
      <td style="width: 60%;">댓글내용22</td>
      <td style="width: 10%;"><button class="miniBtn">수정</button><button class="miniBtn">삭제</button></td>
      <td style="width: 15%;">2022-11-17</td>
    </tr>
    <tr>
      <th style="width: 15%;">오쪼쪼</th>
      <td style="width: 60%;">댓글내용</td>
      <td style="width: 10%;"><button class="miniBtn">수정</button><button class="miniBtn">삭제</button></td>
      <td style="width: 15%;">2022-11-17</td>
    </tr>
  </tbody>
</table>
</form>



<div class="row"></div>
	<div class="col text-center">
  		<button class="button mx-auto" type="button" id="listBtn">목록</button>
  		<button class="button mx-auto" type="button">수정</button>
  		<button class="button mx-auto" type="button">삭제</button>
	</div>
</div>

</div>



</body>
</html>