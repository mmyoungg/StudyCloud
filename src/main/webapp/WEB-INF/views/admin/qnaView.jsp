<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin QnA View</title>

<style type="text/css">

#qnaView {
	margin-top: 20px;
}

#qnaContent {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 15px;
	margin-top: 10px;
}

#title {
	font-size: 16px;
	font-weight: bold;
}

#reply {
	font-size: 16px;
	font-weight: bold;
}

#sRoomQnaTitle {
}

#btnSubmit { /* 버튼 */
	background-color: #6cc4dc;
	border: none;
}

</style>

</head>
<body>

<main id="main" class="main">
  
<div class="container">

<form action="/admin/qna/view" method="post">
<input type="hidden" value="${param.sRoomQnaNo }" name="sRoomQnaNo">
<input type="hidden" value="${param.sRoomNo }" name="sRoomNo">
    <div class="pagetitle">
    	<h1>QnA 답변 작성</h1>
    </div>

    <section class="qnaView">
      	<div class="row">

       	<div class="col-lg-12">
			
			<!-- qnaView -->				
            <div id="qnaView">
            
            	<!-- 문의글 -->
                <div class="d-flex flex-row mt-4">
                    <div class="ml-2 w-100">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex flex-row align-items-center" id="qnaTitle">
                            	<span id="title">제목 : ${qnaView.sRoomQnaTitle }</span>
                            </div>
                            
                        </div>
                        
                        <p class="text-justify" id="qnaContent">
                        	${qnaView.sRoomQnaContent }</p>
                    </div>
                </div><!-- 문의글 end -->
                
                <!-- 답변 -->
                <div class="d-flex flex-row mt-4">
                    <div class="ml-2 w-100">
                    	<p id="title">제목</p>
                    	<input type="text" class="form-control" id="sRoomQnaTitle" name="sRoomQnaTitle"><br>
                    	
                    	<p id="title">내용</p>
                    	<textarea class="form-control" id="sRoomQnaContent" name="sRoomQnaContent"></textarea><br>
                    </div>
                </div><!-- 답변 end -->
                
                <div class="text-center">
                	<button class="btn btn-secondary btn-block" id="btnSubmit">작성</button>
                </div>
            </div>
       	</div>

		</div><!-- main row end -->
	</section>
</form>

</div><!-- main container end -->
</main><!-- main end -->

</body>
</html>