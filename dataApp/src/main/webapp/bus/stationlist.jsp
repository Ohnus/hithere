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
<h3>${busRouteNm }의 노선 경유 목록</h3>
<table border="1">
<tr><th>순번</th><th>정거장명</th><th>방향</th><th>x좌표</th><th>y좌표</th><th>arsId</th></tr>
<c:forEach var="vo" items="${list }">
<tr>
<td>${vo.seq }</td><td>${vo.stationNm }</td><td>${vo.direction }</td><td>${vo.gpsX }</td><td>${vo.gpsY }</td><td>${vo.arsId }</td>
</tr>
</c:forEach>
</table>
</body>
</html>