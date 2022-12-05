<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCloud</title>

<script type="text/javascript">

/* 아이디 찾기 */ 
//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	function findId_click(){
		var memberEmail=$('#memberEmail').val()
		
		$.ajax({
			url:"/login/findid",
			type:"POST",
			data:{"memberEmail":memberEmail} ,
			success:function(data){
				if(data == 0){
					$('#memberId').text("회원 정보를 확인해주세요!");
					$('#memberEmail').val('');
				} else {
					$('#memberId').text(data);
					$('#memberEmail').val('');
					
				}
			},
			 error:function(){
	                alert("에러입니다");
	            }
		});
	};

const modal = document.getElementById("modal")
const btnModal = document.getElementById("findid")

btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})

    
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})

modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})


</script>

<style type="text/css" >

.padding {
    padding: 10rem !important
}

body {
    background-color: #f9f9fa
    
}

/* card css */

.card {
    border: 0;
    border-radius: 0px;
    margin-bottom: 30px;
    margin-left: -30%;
    width: 180%; 
    -webkit-box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    box-shadow: 0 2px 3px rgba(0,0,0,0.03);
    -webkit-transition: .5s;
    transition: .5s;
}

.card-title {
    font-family: Roboto,sans-serif;
    font-weight: 300;
    line-height: 3.2;
    margin-bottom: 0;
    padding: 15px 20px;
    border-bottom: 1px solid rgba(77,82,89,0.07);
    margin: 0 auto;
    
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
    line-height: 2;
	text-align: center;    
}

/* card 내부 */

.form-control {
    border-color: #ebebeb;
    border-radius: 2px;
    color: #8b95a5;
    padding: 1px 1px;
    font-size: 14px;
    line-height: inherit;
    -webkit-transition: 0.2s linear;
    transition: 0.2s linear;
    width: 50%;
    margin: 0 auto;
    display: inline;
    
}

.form-control:focus {
    border-color: #6CC4DC;
    color: #4d5259;
    -webkit-box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
    box-shadow: 0 0 0 0.1rem rgba(51,202,187,0.15);
}

.text-1, .text-2 {
	font-size: 14px;
}

/* button css */

#findid {
	width: 50%;
	padding: 12px;
	margin-bottom: 10px;
}

.btn-primary {
    background-color: #6CC4DC;
    border-color: #6CC4DC;
    color: #fff;
}
.btn-bold {
    font-family: Roboto,sans-serif;
    text-transform: uppercase;
    font-weight: 500;
    font-size: 14px;
}

.btn-primary:hover {
    background-color: #3F92B7;
    border-color: #3F92B7;
    color: #fff;
}

#btn:hover {
    cursor: pointer;
}

/* Modal css */

 #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 0, 0, 0, 0.70 ); // 69, 139, 197
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 300px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }


</style>
</head>

<body>

  <!--파일 불러오기-->
<%@ include file="../login/findidModal.jsp" %>

<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
<div class="col-md-6 col-lg-4">
            <form class="card" method="post">
              <h4 class="card-title fw-400">아이디 찾기</h4><br>

              <div class="card-body">
               
               <div class="text-1">계정에 등록된 이메일을 입력 하시면</div>
               <div class="text-2">사용중인 계정의 아이디를 알려드립니다.</div>
               <br>
               
                이메일&nbsp; <input class="form-control" type="text" id="memberEmail" name="memberEmail"><br><br><br>

			<button class="btn btn-bold btn-primary" id='findid' onclick="findId_click()">아이디 찾기</button><br><br>
			</div>	
            </form>
          </div>
           </div>
            </div>
             </div>
</body>
</html>

<%@ include file="../layout/footer.jsp" %>