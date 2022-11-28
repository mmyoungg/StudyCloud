<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>     
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="https://kit.fontawesome.com/ca40b4f408.js" crossorigin="anonymous"></script>

<style type="text/css">
@font-face {
    @font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

}

* {
	font-family: 'MICEGothic Bold';
}

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
#menu, #menu2 { position: absolute; /* transform: translateX(-50%); */ z-index: 100;
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
img { height: 166px; }
.sRoom_list_topImage img { width: 1000px; height: 450px; margin-bottom: 50px; }
.fa-solid { width: 13px; height: 13px; color:#aacde5; }
.people { font-size: 13px; }
.price { font-weight: bold; color: #3f92b7; }
</style>

<script type="text/javascript">
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
<div id="menu" style="display:none; transform: translateX(-105%);" >
	<ul class="list-group list-group-horizontal list-member">
   		<li class="list-group-item list">서울</li>
    	<li class="list-group-item list">경기</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">인천</li>
        <li class="list-group-item list">부산</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">인천</li>
        <li class="list-group-item list">부산</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">광주</li>
        <li class="list-group-item list">대구</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">대전</li>
        <li class="list-group-item list">울산</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">제주</li>
        <li class="list-group-item list">강원</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">경남</li>
        <li class="list-group-item list">경북</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">전남</li>
        <li class="list-group-item list">전북</li>
    </ul>
    <ul class="list-group list-group-horizontal list-member">
        <li class="list-group-item list">충남/세종</li>
        <li class="list-group-item list">충북</li>
    </ul>
</div>
    
<div class ="btn-select form-select" id="toggle2">인원선택</div>
<div id="menu2" style="display:none;">
	<div class="list-member">
		<div class="number-input">
			<button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" ></button>
 			<input class="quantity" min="1" name="quantity" value="1" type="number">
  			<button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
		</div>
		<div class="btnWrap">
			<button class="numBtn1">초기화</button>
			<button class="numBtn2">적용하기</button>
		</div>
	</div>

</div>    
<select class="form-select" aria-label="Default select example" style="width:300px;">
  <option selected>최신순</option>
  <option value="1">인기순</option>
  <option value="2">관심순</option>
  <option value="3">평점순</option>
  <option value="3">낮은가격순</option>
  <option value="3">높은가격순</option>
</select>
</div>

<p style="color: #3f92b7;">📖 다양한 스터디룸을 확인해보세요!</p>
<hr>


 
<script type="text/javascript">
	$(document).ready(function () {
    	$('#toggle').add('#toggle2').on('click', function () {
    		
    		var $this = $(this);
    		
    		if($this.hasClass('btn-select col-4') ) {
    			
        		var state = $('#menu').css('display'); 
           		// state가 none 상태일경우
            	if (state == 'none') {
            		$('#menu').show();
            	} else {
                	$('#menu').hide();
           		}
    		} else {
        		var state2 = $('#menu2').css('display'); 
           		// state가 none 상태일경우
            	if (state2 == 'none') {
            		$('#menu2').show();
            	} else {
                	$('#menu2').hide();
           		}
    		}
        });
    });
</script>

<div class="row row-cols-1 row-cols-md-4 g-4">
  <div class="col">
    <div class="card">
      <img src="https://ifh.cc/g/SG0cCl.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스터디룸 이름</h5>
        <table>
        	<tr>
        		<td class="price">1,500</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;10&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;5</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 2명</td>
        		<td colspan="2" class="small"><i class="fa-solid fa-user"></i>최대 10명</td>
        	</tr>
        	
        </table>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="https://ifh.cc/g/vkFvSv.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스터디룸 이름</h5>
         <table>
        	<tr>
        		<td class="price">1,500</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;10&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;5</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 2명</td>
        		<td colspan="2" class="small"><i class="fa-solid fa-user"></i>최대 10명</td>
        	</tr>
        	
        </table>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="https://ifh.cc/g/NCAN9A.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스터디룸 이름</h5>
        <table>
        	<tr>
        		<td class="price">1,500</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;10&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;5</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 2명</td>
        		<td colspan="2" class="small"><i class="fa-solid fa-user"></i>최대 10명</td>
        	</tr>
        	
        </table>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="https://ifh.cc/g/vGtDAg.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스터디룸 이름</h5>
         <table>
        	<tr>
        		<td class="price">1,500</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;10&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;5</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 2명</td>
        		<td colspan="2" class="small"><i class="fa-solid fa-user"></i>최대 10명</td>
        	</tr>
        	
        </table>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src="https://ifh.cc/g/QoHnRq.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">스터디룸 이름</h5>
         <table>
        	<tr>
        		<td class="price">1,500</td>
        		<td style="font-size: 11px;">원/시간</td>
        		<td colspan="2" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        		<i class="fa-solid fa-heart" style="color:#f8bbd0;"></i>&nbsp;10&nbsp;&nbsp;<i class="fa-solid fa-comment"></i>&nbsp;5</td>
        	</tr>
        	<tr>
        		<td colspan="2" class="small"><i class="fa-solid fa-user" style="color:#aacde5;"></i>최소 2명</td>
        		<td colspan="2" class="small"><i class="fa-solid fa-user"></i>최대 10명</td>
        	</tr>
        	
        </table>
      </div>
    </div>
  </div>
  
  
  
</div>
</div>



</body>
</html>