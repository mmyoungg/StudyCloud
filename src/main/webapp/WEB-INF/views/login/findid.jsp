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

//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	
$(document).ready(function() {
		
		const modal = document.getElementById("modal")
		
		function findId_click(e){
			e.preventDefault()
			//modal.style.display = "flex"
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


	const btnModal = document.getElementById("findid")

	btnModal.addEventListener("click", e => {
	    modal.style.display = "flex"
	    findId_click(e)
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

	})
	
	

//   <!-- 모달창 -->

// // Modal을 가져온다
// var modals = document.getElementsByClassName("modal");
// // Modal을 띄우는 클래스 이름을 가져온다.
// var btns = document.getElementsByClassName("btntt");
// // Modal을 닫는 close 클래스를 가져온다.
// var spanes = document.getElementsByClassName("close");
// var funcs = [];

// // Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
// function Modal(num) {
// 	return function(){
// 		// 해당 클래스의 내용을 클릭하면 Modal을 띄운다.
// 		btns[num].onclick = function(){
// 			modals[num].style.display = "block";
// 			console.log(num);
// 		};
		
// 		// 닫기 버튼 클릭하면 Modal이 닫힌다.
// 		spanes[num].onclick = function() {
// 			modals[num].style.display = "none";
// 		};
// 	};
// }

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
            position: static;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #f9f9fa;
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        
        #modal .modal-window {
            background: #AACDE5;
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 600px;
            height: 300px;
            position: absolute;
            top: -400px;
            padding: 10px;
            text-align: center;
            
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: #fff;
            
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
            color: #656565;
        }
        
        #modal .content {
            margin-top: 50px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: #fff;
        }

		.modal-text {
			margin-top: 55px;		
		}
		
		.content {
			font-size: 15pt;
		}

</style>
</head>

<body>


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

			<button type="button" class="btn btn-bold btn-primary" id="findid">아이디 찾기</button><br><br>
			</div>	
<div id="modal" class="modal-overlay">
        <div class="modal-window">
        	<div class="modal-text">
	            <div class="title">
	                <h2>아이디 조회 결과</h2>
	                <p>${memberId }</p>
	            </div>
        	</div>
           <div class="close-area" onclick="closeModal()">X</div>
           <div class="content" id="memberId"></div>
        </div>
    </div>
            </form>
          </div>
           </div>
            </div>
             </div>
</body>
</html>

<%@ include file="../layout/footer.jsp" %>