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
<table border="1">
<tr>
<td colspan="5"><h3>이미지 게시판</h3></td></tr>
<tr><td><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></td>
<td><a href="${pageContext.request.contextPath }/member/login.do">로그인</a></td>
<td><a href="${pageContext.request.contextPath }/member/edit.do?id=${sessionScope.loginId}">내정보확인</a></td>
<td><a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></td>
<td><a href="${pageContext.request.contextPath }/member/out.do?id=${sessionScope.loginId}">탈퇴</a></td>
<c:if test="${not empty sessionScope.loginId }">
<tr>
	<td colspan="2"><a href="${pageContext.request.contextPath }/imgboard/add.do">글올리기</a></td>
	<td colspan="3"><a href="${pageContext.request.contextPath }/imgboard/list.do">글목록보기</a></td>
</tr>
</c:if>
</tr>
</table>
<div id="body">
${msg }
<c:if test="${not empty view }">
<jsp:include page="${view }"/>
</c:if>
</div>
</body>
</html>