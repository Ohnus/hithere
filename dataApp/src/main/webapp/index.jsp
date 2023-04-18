<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공공데이터 활용</h3>
<a href="${pageContext.request.contextPath }/csv/load.do">csv 데이터 확인</a><br/>
<a href="${pageContext.request.contextPath }/json/load.do">json 데이터 확인</a><br/>
<a href="${pageContext.request.contextPath }/xml/load.do">xml 데이터 확인</a><br/>
<a href="${pageContext.request.contextPath }/weather/load.do">weather 데이터 확인</a><br/>
</body>
</html>