<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin reservation search</title>

<!-- 데이트 피커 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">

/* 데이트 피커 */
$(function() {
    $('#start').datepicker();
});

$(function() {
    $('#end').datepicker();
});

</script>


<style type="text/css">

/* 필터 검색 부분 */
.filter {
	margin-top: 20px;
}

.card {
    border: 2px solid #6cc4dc;
    border-radius: 15px;
}

/* 데이트 피커 */
.date > input {
	max-width: 200px;
}

#search {
	width: 55px;
	height: 50px;
	background-color: #6cc4de;
	border: none;
	color: #fff;
	border-radius: 10px;
}

.btnView {
    background-color: #6cc4dc;
    font-size: 12px;
    color: #fff;
    border-radius: 5px;
}

/* 테이블 */
.table {
	text-align: center;
	vertical-align: middle;
	margin-top: 20px;
}

.table thead {
    background-color: #3f92b7;
}

.table thead th {
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    color: white;
}

.table tbody td {
    padding: 10px;
    margin: 0;
    font-size: 14px;
}

</style>

<script type="text/javascript">

   // 검색 버튼 클릭시 호출되는 함수
   function searchName(){
      if( reserveNo === undefined || reserveNo === '' || reserveNo < 1){
    	  reserveNo = 1
      }
      
      // 셀렉트 옵션에서 선택된 값 (사번/이름)
      var type = document.getElementById('type').value
      // 인풋창에 입력된 값
      var keyword = document.getElementById('keyword').value
      
      // ajax data값  
      var data = { reserveNo : reserveNo, type: type, keyword: keyword }
      // ajax를 이용하여 사원 리스트 출력하는 함수 호출
      getMemberByAjax(data)
   }

   // 탭 클릭시 호출되는 함수
   function tabClick(e, num){
      // 버튼 엘리먼트의 텍스트 = 부서이름
      sRoomName = e.target.innerText   
      
      // 혹시 모를 오류 방지를 위해 기본 값 처리
      if(sRoomName === undefined || sRoomName === ''){
         sRoomName = '스터디룸'
      }
      
      // 부서 이름 나타내기      
      var nameElement =  document.getElementById('dept_name_wrap')
      nameElement.innerText = sRoomName
      
      // 전역변수에 값 할당
      reserveNo = num
      
      // ajax data값 
      var data = {reserveNo : num}
      // ajax를 이용하여 사원 리스트 출력하는 함수 호출
      getMemberByAjax(data)
   }

   // ajax를 이용하여 사원 리스트 출력하는 함수
   function getMemberByAjax(value){
      // 멤버정보가 출력되는 테이블의 <tbody> 엘리먼트 
      var tr = $('#reserveList').eq(0)
      
      $.ajax({
         url : "/admin/reserve"
         , data : value
         , type : "get"
         , dataType : "json"
         , success : function(data){
            // ajax결과를 엘리먼트에 동적으로 추가
            var str = "";
            var result = data
            $.each(result, function(i){
               str += "<tr>";
               str += "<td calss='tb_no'>"+ result[i].MEMBERNO + "</td>";
               str += "<td class='tb_name'>"+ result[i].MEMBERNAME + "</td>";
               str += "<td class='tb_rank'>"+ result[i].RANK + "</td>";
               str += "</tr>"
            })
            tr.html(str)
         },
         error : function(e){
            console.log("ajax 통신 실패");
            console.log(e)
         }
      }); //ajax end
   }


</script>

</head>
<body>

<form action="/admin/reserve" method="get" class="search-form">

<main id="main" class="main">
<div class="container">
  
    <div class="pagetitle">
    	<h1>예약 리스트</h1>
    </div>
    
    <section class="adminReserve">
      	<div class="row">

     	<!-- 테이블 -->
     	
       	<div class="col-lg-12">
				
		   <!-- 필터 검색 -->
		    <div class="filter">
			    <div class="card">
			    	<div class="card-body">
				            
	 					<div>
	 						<span>
	 							<select name="searchName">
	 							
 							        <option value="sRoomName">스터디룸명</option>
 							        <option value="memberName">예약자</option>
	 							
	 							</select>
	 						</span>
	 						
	 						<span><input type="text" name="keyword"></span>
							<span><input type="submit" value="조회"></span>

	 					</div>
			        </div>
	    		</div>
		    </div>
		    
		    <!-- 테이블 -->
		    <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>스터디룸 명</th>
                            <th>예약자</th>
                            <th>휴대폰 번호</th>
                            <th>예약일시</th>
                            <th>예약인원</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody class="reserveList" id="reserveList">
                    <c:forEach items="${list }" var="reserve">
                        <tr>
                            <td>${reserve.RESERVE_NO }</td>
                            <td>${reserve.SROOM_NAME }</td>
                            <td>${reserve.MEMBER_NAME }</td>
                            <td>${reserve.MEMBER_PHONE }</td>
                            <td>${reserve.RESERVE_DATE }</td>
                            <td>${reserve.RESERVE_PEOPLE } 명</td>
	                        <td>
	                        	<a href="/admin/reserve/view?reserveNo=${reserve.RESERVE_NO }">상세보기</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
			<span class="pull-right">total : ${paging.totalCount }</span>
       	</div>
       	
		</div><!-- main row end -->
	</section>

</div><!-- main container end -->

</main><!-- main end -->

</form>

</body>
</html>