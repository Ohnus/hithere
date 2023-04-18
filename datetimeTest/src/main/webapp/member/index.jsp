<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>테스트 페이지</h3>
<c:if test="${empty sessionScope.loginId }">
<a href="${pageContext.request.contextPath}/member/login">로그인</a><br/>
</c:if>
<c:if test="${not empty sessionScope.loginId }">
<a href="${ pageContext.request.contextPath }/member/logout">로그아웃</a><br/>
<a href="${ pageContext.request.contextPath }/member/myinfo?id=${sessionScope.loginId}">내정보확인</a><br/>
<a href="${ pageContext.request.contextPath }/member/applied?id=${sessionScope.loginId}">신청회원</a><br/>
<a href="${ pageContext.request.contextPath }/member/delete?id=${sessionScope.loginId}">탈퇴</a><br/>
<a href="${pageContext.request.contextPath}/board/list">글목록</a>
</c:if>
</body>
</html>