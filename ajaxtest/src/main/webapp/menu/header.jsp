<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>KOSTA 사이트</h3>
<c:if test="${empty sessionScope.loginId }">
	<a href="${pageContext.request.contextPath }/member/login">로그인</a>
	<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
</c:if>
</body>
</html>