<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layout/header.jsp"%>     
<script src="https://kit.fontawesome.com/ca40b4f408.js" crossorigin="anonymous"></script>

<style type="text/css">
.content { width: 1000px; margin: 70px auto; }
.row { margin: 20px 5px auto; } 
.sel { width: 300px; }
.sels { width: 200px; }
.btn-select { position: relative; width: 300px; padding: 13px 30px 13px 14px; font-size: 15px;
              line-height: 14px; background-color: #fff; border: 1px solid #C4C4C4;
              box-sizing: border-box; border-radius: 10px; cursor: pointer;
              text-align: left; z-index: 1; margin-right: 16px;}
.list-member { width: 300px; top: 50px; left: 0; box-sizing: border-box; }
.list { width: 150px; }
/* #menu { position: absolute; z-index: 2; width: 300px; transform: translateX(-50%); margin-top: 40px;}  */    
#menu1, #menu2 { position: absolute; /* transform: translateX(-50%); */ z-index: 100;
    			margin-top: 50px; width: 300px; border-radius: 6px; border: 1px solid #e0e0e0;
    			background: #fff; }
.list-member li { height: 40px; padding: 5px 8px; box-sizing: border-box; }         
.flex-center { display:flex; justify-content: center; margin: 50px auto;}
.num-picker { padding: 32px 20px;}

input[type="number"] { -webkit-appearance: textfield; -moz-appearance: textfield; appearance: textfield; }
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button { -webkit-appearance: none; }
.number-input { border: 1px solid #e3eff9; display: inline-flex; }
.number-input, .number-input * { box-sizing: border-box; }
.number-input button { outline:none; -webkit-appearance: none; background-color: transparent;
 					   border: none; align-items: center; justify-content: center; width: 3rem;
  					   height: 3rem; cursor: pointer; margin: 0; position: relative; }
.number-input button:before, .number-input button:after {
  display: inline-block; position: absolute; content: ''; width: 1rem; height: 2px;
  background-color: #212121; transform: translate(-50%, -50%); }
.number-input button.plus:after { transform: translate(-50%, -50%) rotate(90deg); }
.number-input input[type=number] { max-width: 12.5rem; padding: .5rem;
 								   border: solid #e3eff9; border-width: 0 2px; font-size: 1.5rem;
  								   height: 3rem; text-align: center; }
.numBtn1 { border: none; background-color: #aacde5; height: 45px; padding: 0; width: 128px; float: left; font-weight: 700;}  								   
.numBtn2 { border: none; background-color: #6cc4dc; height: 45px; padding: 0; width: 170px; float: left; font-weight: 700; }  								   
.btnWrap { margin: 20px auto; }
.card img { height: 166px; }
.sRoom_list_topImage img { width: 1000px; height: 450px; margin-bottom: 50px; }
.fa-solid { width: 13px; height: 13px; color:#aacde5; }
.people { font-size: 13px; }
.price { font-weight: bold; color: #3f92b7; }
.sRoomTitle {  width: 189px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; } 
.page-link { color: #282828; }
.page-link:hover { background-color: #e3eff9; }
.active>.page-link { background-color: #3f92b7; border-color: #3f92b7; }
.sRoomList { margin-bottom: 40px; }
.card a { text-decoration: none; color: black;}
.card a:hover { background-color: #fff; }
</style>

<script type="text/javascript">
 $(document).on("click", function(e) {
	 var locMenu = $('#toggle');
	 var pMenu = $('#toggle2');
	 if (!$(e.target).closest(locMenu).length) {
		 $('#menu1').hide();
	 }
	/*  if (!$(e.target).closest(pMenu).length) {
		 $('#menu2').hide();
	 } */
}) 

$(document).ready(function() {
	var pageNo = ${paging.curPage};
	console.log(pageNo); // 현재페이지 확인
	pagingAjax(pageNo);	

	
	/* 각 메뉴 클릭 이벤트*/		
    $('#toggle').add('#toggle2').on('click', function () {
    		
    	var $this = $(this);
    		
    	if($this.hasClass('btn-select col-4') ) {
    			
        	var state = $('#menu1').css('display'); 
           	// state가 none 상태일경우
            if (state == 'none') {
            	$('#menu1').show();
                $('#menu2').hide();
            } else {            	
            	$('#menu1').hide();
           	}
    	} else {
        	var state2 = $('#menu2').css('display'); 
           		// state가 none 상태일경우
            if (state2 == 'none') {
            	$('#menu2').show();
                $('#menu1').hide();
            } else {
                $('#menu2').hide();
           	}
    	}
	});
    
	
	/* 지역선택 클릭이벤트 */
	$(".sRoomlocation li").on("click", function(e) {
		var pageNo = ${paging.curPage};
		console.log($(this).attr('value'));
		var sRoomLoc = $(this).attr('value');
		$('#menu1').hide();
	
		
		$.ajax({
			type:"POST",
			url: "/sRoom/locSearch",
			dataType: "html", 
			data : {"sRoomLoc": sRoomLoc, curPage: pageNo},
			success : function(res){
				console.log('[스터디룸 지역검색] AJAX 요청 성공');
				$("#sRoomListContent").html(res);
				
				$("#searchIntro").html("");
				var intro = "";
				intro += '<p id="searchIntro" style="color: #3f92b7; font-size: 20px; font-weight: bold;" >🔎 "' + sRoomLoc + '" 지역으로 조회한 결과입니다. </p>'
				
				$("#searchIntro").html(intro);
				
			} 
		})
		
	})

	/* 인원선택 */
	$(".plus").on("click", function() {
		/* var count = $(this).parent('input[type=number]').val(); */
		var count = parseInt($(".quantity").val());
		console.log( typeof count);
		count = count + 1;
		$(".quantity").val(count);
		console.log($(".quantity").val());
	})
	
 	$(".down").on("click", function() {
		var count = parseInt($(".quantity").val());
		console.log( typeof count);
		count = count - 1;
		$(".quantity").val(count);
		console.log($(".quantity").val());
		
		if(count < 1) {
			alert("1명 이하는 선택하실 수 없습니다.")
			$(".quantity").val(1);
		}
	}) 
	
	$(".numBtn1").on("click", function() {
		$(".quantity").val(1);
	})
	
	/* 인원선택 검색 */
 	$("#sRoomPeopleSearch").on("click", function() {
		var numberOfPeople = parseInt($(".quantity").val());
		console.log("선택한 인원 수 : " + numberOfPeople)
		console.log( typeof numberOfPeople);
		
		$.ajax({
			type:"POST",
			url: "/sRoom/peopleSearch",
			dataType: "html", 
			data : {sRoompNum: numberOfPeople, curPage: pageNo},
			success : function(res){
				console.log('[스터디룸 인원수 검색] AJAX 요청 성공');
				$("#sRoomListContent").html(res);
				$("#searchIntro").html("");
				var intro = "";
				intro += '<p id="searchIntro" style="color: #3f92b7; font-size: 20px; font-weight: bold;" >🔎 "' + numberOfPeople + '명" 으로 조회한 결과입니다. </p>'
				
				$("#searchIntro").html(intro);
				
				
			} 
		})
	})
	
	/* selectBox 클릭시 정렬 */
	$("#orderBy").on("change", function() {
		var selected = parseInt($(this).val());
		console.log( typeof selected );
		console.log(selected);
		
		$.ajax({
			type:"POST",
			url: "/sRoom/seletedSort",
			dataType: "html", 
			data : {selectNum: selected, curPage: pageNo},
			success : function(res){
				console.log('[스터디룸 최신순 정렬] AJAX 요청 성공');
			/* 	$("#sRoomListContent").html(res);
				$("#searchIntro").html("");
				var intro = "";
				intro += '<p id="searchIntro" style="color: #3f92b7; font-size: 20px; font-weight: bold;" >🔎 "' + numberOfPeople + '명" 으로 조회한 결과입니다. </p>'
				
				$("#searchIntro").html(intro); */
				
				
			} 
		}) 
		
	})
	
})

function pagingAjax(pageNo) {
	var page_no = pageNo;
	console.log(page_no);
	
	$.ajax({
		type:"GET",
		url: "/sRoom/sRoomListAjax",
		dataType: "html", 
		data : {curPage: page_no},
		success : function(res){
		console.log('[스터디룸 리스트] AJAX 요청 성공');
			$("#sRoomListContent").html(res);
		//	console.log(res);
		} 
	})
}
 

 
</script>

</head>
<body>
<div class="content">

<div class="sRoom_list_top">
	<h5 style="color: #6cc4dc;">📖<strong>스터디룸 대여공간</strong></h5>
</div>
<div class="sRoom_list_topImage">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://ifh.cc/g/wnfRd0.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://ifh.cc/g/wNLhyw.jpg" class="d-block w-100" alt="...">
    </div>
   
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</div>
<div class="input-group">
  <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username with two button addons">
  <button class="btn btn-outline-secondary" type="button">검색</button>
  <button class="btn btn-outline-secondary" type="button">초기화</button>
</div>
 
<div class="flex-center">
<div class ="btn-select col-4 form-select" id="toggle" >지역선택</div>
<div id="menu1" style="display:none; transform: translateX(-105%);" >
	<ul class="list-group list-group-horizontal list-member sRoomlocation">
   		<li class="list-group-item list" value="서울">서울</li>
    	<li class="list-group-item list" value="경기">경기</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="인천">인천</li>
        <li class="list-group-item list" value="부산">부산</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="광주">광주</li>
        <li class="list-group-item list" value="대구">대구</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="대전">대전</li>
        <li class="list-group-item list" value="울산">울산</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="제주">제주</li>
        <li class="list-group-item list" value="강원">강원</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="경남">경남</li>
        <li class="list-group-item list" value="경북">경북</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="전남">전남</li>
        <li class="list-group-item list" value="전북">전북</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member sRoomlocation">
        <li class="list-group-item list" value="충남">충남</li>
        <li class="list-group-item list" value="충북">충북</li>
    </ul>
</div>
    
<div class ="btn-select form-select" id="toggle2">인원선택</div>
<div id="menu2" style="display:none;">
	<div class="list-member">
		<div class="number-input">
			<button class="down" id="down" ></button>
 			<input class="quantity" name="pNum" min="1" name="quantity" value="1" type="number">
  			<button class="plus" id="plus"></button>
		</div>
		<div class="btnWrap">
			<button class="numBtn1">초기화</button>
			<button class="numBtn2" id="sRoomPeopleSearch">적용하기</button>
		</div>
	</div>

</div>    
<select class="form-select" id="orderBy"aria-label="Default select example" style="width:300px;">
  <option value="1" selected>최신순</option>
  <option value="2">인기순</option>
  <option value="3">평점순</option>
  <option value="4">낮은가격순</option>
  <option value="5">높은가격순</option>
</select>
</div>

<p id="searchIntro" style="color: #3f92b7;">📖 다양한 스터디룸을 확인해보세요!</p>
<hr>


<div id="sRoomListContent"></div>

</div>



</body>
</html>