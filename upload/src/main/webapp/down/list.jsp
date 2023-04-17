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
<h3>파일 다운로드</h3>
<ul>
<c:forEach var="f" items="${flist }">
<li><a href="${pageContext.request.contextPath}/down/test?fname=${f}">${f }</a></li>
</c:forEach>
</ul>
</body>
</html>