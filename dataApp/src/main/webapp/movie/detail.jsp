<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${movieNm } 상세정보</h3>
<table border="1">
<tr><th>상영시간</th><td>${showTm }</td></tr>
<tr><th>개봉연도</th><td>${openDt }</td></tr>
<tr><th colspan="2">감독</th></tr>
<c:forEach var="d" items="${directors }">
<tr><td colspan="2">${d }</td></tr>
</c:forEach>
<tr><th colspan="2">배우</th></tr>
<c:forEach var="a" items="${actors }">
<tr><td colspan="2">${a }</td></tr>
</c:forEach>
</table>
</body>
</html>