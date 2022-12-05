<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>게시글번호</p>
<p><input type="hidden" value="${applymt.applymtNo}"></p><hr>

<p>회원번호</p>
<p><input type="hidden" name="memberNo" value="${applymt.member.memberNo}"></p><hr>

<p>희망분야</p>
<p><input type="hidden" value="${applymt.field}"></p><hr>

<p>소개글</p>
<p><input type="hidden" value="${applymt.applymtContent}"></p><hr>

<p>등록일</p>
<p><input type="hidden" value="${applymt.applymtDate}"></p><hr>

<!-- <p>게시글번호</p> -->
<%-- <p>${applymt.applymtNo }</p><hr> --%>

<%-- <p>${applymt.memberNo }</p><hr> --%>
<%-- <p><input type="hidden" value="${applymt.member.memberNo}"></p><hr> --%>
<!-- <p>희망분야</p> -->
<%-- <p>${applymt.field }</p><hr> --%>

<!-- <p>소개글</p> -->
<%-- <p>${applymt.applymtContent }</p> --%>

<!-- <p>등록일</p> -->
<%-- <p>${applymt.applymtDate }</p> --%>

<button>버튼</button>


</body>
</html>