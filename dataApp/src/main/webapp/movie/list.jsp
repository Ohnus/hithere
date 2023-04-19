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
<h3>${type }</h3>
<table border="1">
<tr><th colspan="7">기간:${showRange }</th></tr>
<tr><th>번호</th><th>순위</th><th>영화코드</th><th>영화제목</th><th>개봉일</th><th>누적관객수</th><th>누적매출액</th></tr>
<c:forEach var="vo" items="${movielist }">
<tr>
<td>${vo.rnum }</td><td>${vo.rank }</td><td>${vo.movieCd }</td>
<td><a href="${pageContext.request.contextPath }/moviedetail/load.do?movieCd=${vo.movieCd}">${vo.movieNm }</a></td>
<td>${vo.openDt }</td><td>${vo.audiAcc }</td><td>${vo.salesAcc }</td>
</tr>
</c:forEach>
</table>
</body>
</html>