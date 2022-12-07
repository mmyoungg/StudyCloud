<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>

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
						
						<!-- 기간별 검색 -->
<!-- 				        <div class="form-group"> -->
<!-- 			                <div class="input-group date" id="start"> -->
<!-- 			                    <input type="text" class="form-control" id="word"> -->
<!-- 			                    <span class="input-group-append"> -->
<!-- 			                        <span class="input-group-text bg-white d-block"> -->
<!-- 			                            <i class="fa fa-calendar"></i> -->
<!-- 			                        </span> -->
<!-- 			                    </span> -->
<!-- 			                </div> -->
<!-- 			                <div class="input-group date" id="end"> -->
<!-- 			                    <input type="text" class="form-control"> -->
<!-- 			                    <span class="input-group-append"> -->
<!-- 			                        <span class="input-group-text bg-white d-block"> -->
<!-- 			                            <i class="fa fa-calendar"></i> -->
<!-- 			                        </span> -->
<!-- 			                    </span> -->
<!-- 			                </div> -->
<!-- 			            </div> -->
				            
	 					<div>
	 						<span>
	 							<select>
	 								<option>스터디룸 명</option>
	 								<option>예약자</option>
	 							</select>
	 						</span>
	 						<span><input type="text" name="keyword"></span>
							<span><button id="search">검색</button></span>
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
                    <tbody>
                    <c:forEach items="${list }" var="hashmap">
                        <tr>
                            <td>${hashmap.RESERVE_NO }</td>
                            <td>${hashmap.SROOM_NAME }</td>
                            <td>${hashmap.MEMBER_NAME }</td>
                            <td>${hashmap.MEMBER_PHONE }</td>
                            <td>${hashmap.RESERVE_DATE }</td>
                            <td>${hashmap.RESERVE_PEOPLE } 명</td>
	                        <td>
	                        	<a href="/admin/reserve/view?reserveNo=${hashmap.RESERVE_NO }">상세보기</a>
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

</body>
</html>