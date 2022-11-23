<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- 부트스트랩 5.2.2 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

.content { width: 1200px; margin: 0 auto; }
table { text-align: center; margin: 10px auto;}
thead { background-color: #AACDE5; }
#check { margin: 40px 5px auto;}
#check-in { margin: 0 15px 0 15px; }
#searchBar { margin: 0 11px 0 500px; width: 250px;}
.button { background-color: #6CC4DC; border: 0; width: 77px; padding: 5px; margin: 2px; 
		  border-radius: 5px; color: white; }
.change {
  accent-color: red;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#writeBtn").click(function() {
		location.href="/freeBoard/write"
	})	
})

</script>


</head>
<body>
<div class="content">
<h2>자유게시판</h2>

<form class="row gy-2 gx-3 align-items-center" id="check">

<div class="form-check col-auto" id="check-in">
  <input class="form-check-input change" type="checkbox" value="" id="titlecheck">
  <label class="form-check-label" for="titlecheck">제목</label>
</div>
<div class="form-check col-auto" id="check-in">
  <input class="form-check-input" type="checkbox" value="" id="titleContentcheck">
  <label class="form-check-label" for="titleContentcheck">제목+내용</label>
</div>
<div class="form-check col-auto" id="check-in">
  <input class="form-check-input" type="checkbox" value="" id="writercheck">
  <label class="form-check-label" for="writercheck">작성자</label>
</div>

<div class="align-items-center" id="searchBar">
  <div class="col-auto">
    <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" placeholder="검색어를 입력하세요">
  </div>
</div>

<button class="col-auto button" type="button">검색</button>



</form>

<table class="table">
	<thead>
	<tr>
		<th scope="col">No.</th>
		<th scope="col">카테고리</th>
		<th scope="col">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">조회수</th>
		<th scope="col">등록일</th>
	</tr>
	</thead>
	
	<tbody>
    <tr>
      <th scope="row">1</th>
      <td>가입인사</td>
      <td>안녕하세요!</td>
      <td>자바초보</td>
      <td>0</td>
      <td>2022-11-16</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>질문</td>
      <td>자바스크립트 공부 어떻게 하시나요?</td>
      <td>Apple</td>
      <td>1</td>
      <td>2022-11-16</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>잡담</td>
      <td>요새 날씨가 너무 춥네요ㅠㅠ</td>
      <td>오쪼쪼</td>
      <td>11</td>
      <td>2022-11-15</td>
    </tr>
  </tbody>
</table>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="me-md-2 button" type="button" id="writeBtn">글쓰기</button>
</div>
</div>



</body>
</html>