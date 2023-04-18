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
<h3>검색된 버스 목록</h3>
<table border="1">
<c:forEach var="vo" items="${list }">
<tr>
<td rowspan="7">${vo.busRouteNm }<br/><a href="${pageContext.request.contextPath }/busstation/load.do?busid=${vo.busRouteId }">노선확인</a></td>
<th>노선 id</th><td>${vo.busRouteId }</td>
</tr>
<tr><th>운수회사</th><td>${vo.corpNm }</td></tr>
<tr><th>종점</th><td>${vo.edStationNm }</td></tr>
<tr><th>기점</th><td>${vo.stStationNm }</td></tr>
<tr><th>첫차시간</th><td>${vo.firstBusTm }</td></tr>
<tr><th>막차시간</th><td>${vo.lastBusTm }</td></tr>
<tr><th>배차간격</th><td>${vo.term }</td></tr>
</c:forEach>
</table>
</body>
</html>