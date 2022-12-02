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

<p>희망분야</p>
<p>${applymt.field }</p><hr>

<p>소개글</p>
<p>${applymt.applymtContent }</p>

<p>등록일</p>
<p>${applymt.applymtDate }</p>

<button>버튼</button>


</body>
</html>