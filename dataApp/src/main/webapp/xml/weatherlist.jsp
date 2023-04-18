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
<c:forEach var="vo" items="${list }" varStatus="status"> <%-- varStatus: for문의 상태값 --%>
<tr>
<c:if test="${status.index%13 == 0 }">
<td rowspan="13">${vo.city }</td>
</c:if>
<td>${vo.dateTime }</td><td>${vo.info }</td><td>${vo.tmx }</td><td>${vo.tmn }</td><td>${vo.rnst }</td>
</tr>
</c:forEach>
</table>
</body>
</html>