<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>       
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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

</head>
<body>
<div class="content">
<h2>자유게시판</h2>


<form action="" method="post">
<table class="table">
   <tbody>
    <tr>
      <th scope="row">작성자</th>
      <td colspan="3">Apple</td>
    </tr>
    <tr>
      <th scope="row">작성일시</th>
      <td>2022-11-16</td>
      <th>조회수</th>
      <td>1</td>
    </tr>
    <tr>
      <th colspan="4">내용</th>
    </tr>
    <tr>
      
      <td colspan="4">있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에<br>
      속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐?<br>
       이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다</td>
    </tr>
	</table>
	

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