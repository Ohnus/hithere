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
<h3>KOSTA ����Ʈ</h3>
<c:if test="${empty sessionScope.loginId }">
	<a href="${pageContext.request.contextPath }/member/login">�α���</a>
	<a href="${pageContext.request.contextPath }/member/join">ȸ������</a>
</c:if>
</body>
</html>