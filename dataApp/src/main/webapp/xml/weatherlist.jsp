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
<h3>${title }</h3>
<h4>${category } (author:${author })</h4>
<table border="1">
<tr><th>도서</th><th>날짜/시간</th><th>설명</th><th>최고온도</th><th>최저온도</th><th>비올확률</th></tr>
<c:forEach var="vo" items="${list }">
<tr>

</tr>
</c:forEach>
</table>
</body>
</html>