<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
<style type="text/css">

/* 푸터 */
.footer {
    display: block; 
    position: relative; 
    color: #656565; 
    font-size: 13px; 

    background-color: #e3eff9;
    font-size: 13px;
    padding: 30px;
    margin-top: 70px;
}

ul>li {
    color:#aacde5;
/*     display: inline-block; */
}

.address span, 
.menu span {
   color: #ccc; 
   font-weight: bold; 
   border-bottom: 1px solid #c7c7c7; 
   padding: 10px 0px;
   display: block;
   text-transform: uppercase;
   font-size: 16px;
   letter-spacing: 3px;
}
 
.address li a, 
.menu li a {
    color: #ccc;
    letter-spacing: 3px;
    text-decoration: none;
    font-size: 14px;
}

.address li, 
.menu li {
    margin: 10px 0px;
    list-style: none;
}

</style>    


</head>
<body>


<footer class="footer">
	<div class="container" id="footer_inner">
	    <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12 logo-wrap align-self-center text-center">
            	<img class="logo" src="/resources/img/Logo.png" height="80px"/>
            </div>
            
            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="menu">
                     <span>Menu</span>    
                     <li>
                        <a href="#">이용약관</a>
                      </li>
                           
                      <li>
                         <a href="#">개인정보처리방침</a>
                      </li>
                           
                      <li>
                        <a href="#">운영정책</a>
                      </li>
                           
                      <li>
                         <a href="#">고객문의</a>
                      </li>
                 </ul>
            </div>
       
            <div class="col-md-4 col-sm-6 col-xs-12">
              <ul class="address">
                <span>Contact</span>       
                <li>
                   <a href="#">팀장: 윤지원</a>
                </li>
                <li>
                   <a href="#">팀원: 김유빈</a>
                </li> 
                <li>
                   <a href="#">팀원: 박소영</a>
                </li> 
                <li>
                   <a href="#">팀원: 서은영</a>
                </li> 
                <li>
                   <a href="#">팀원: 이민영</a>
                </li> 
               </ul>
            </div>
        </div> 
	    
	    
	    
	</div><!-- container end -->
</footer>


</body>
</html>