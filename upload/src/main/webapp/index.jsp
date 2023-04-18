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
<h3>게시판</h3>
<c:if test="${empty sessionScope.loginId }">
<a href="${pageContext.request.contextPath }/member/login">로그인</a><br/>
</c:if>
<c:if test="${not empty sessionScope.loginId }">
<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a><br/>
<a href="${pageContext.request.contextPath }/member/myinfo?id=${sessionScope.loginId }">내정보확인</a><br/>
<a href="${pageContext.request.contextPath }/member/out?id=${sessionScope.loginId }">탈퇴</a><br/>
<a href="${pageContext.request.contextPath }/imgboard/list">이미지 게시판</a><br/> 
</c:if>
</body>
</html>