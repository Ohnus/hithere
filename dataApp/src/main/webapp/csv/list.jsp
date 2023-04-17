<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>대전 열차 시간표</h3>
<table border="1">
<tr>
<c:forEach var="t" items="${titles }">
<th>${t }</th>
</c:forEach>
</tr>
<c:forEach var="vo" items="${list }">
<tr>
<td>${vo.arg1 }</td><td>${vo.arg2 }</td><td>${vo.arg3 }</td>
<td>${vo.arg4 }</td><td>${vo.arg5 }</td><td>${vo.arg6 }</td>
<td>${vo.arg7 }</td><td>${vo.arg8 }</td><td>${vo.arg9 }</td>
<td>${vo.arg10 }</td><td>${vo.arg11 }</td><td>${vo.arg12 }</td>
</tr>
</c:forEach>
</table>
</body>
</html>