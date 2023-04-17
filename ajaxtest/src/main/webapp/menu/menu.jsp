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

<h3>메뉴</h3>
<c:if test="${not empty sessionScope.loginId }">
	<a href="${pageContext.request.contextPath }/member/myinfo?id=${sessionScope.loginId }">내 정보 확인</a><br/>
	<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a><br/>
	<a href="${pageContext.request.contextPath }/member/delete?id=${sessionScope.loginId }">탈퇴</a><br/>
	<a href="${pageContext.request.contextPath }/diary/list">일기목록</a><br/>
	<a href="${pageContext.request.contextPath }/diary/add">일기작성</a><br/>
</c:if>
</body>
</html>