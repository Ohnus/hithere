<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><th>�۹�ȣ</th><th>��¥</th></tr>
<c:forEach var="vo" items="${list }">
<tr>
<td>${vo.num }</td>
<td><a href="${pageContext.request.contextPath }/diary/detail?num=${vo.num}">${vo.wdate }</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>