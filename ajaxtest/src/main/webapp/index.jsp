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
<table border="1" align="center">
<tr><td colspan="2" style="height:150px" align="center"><h3><%@ include file="/menu/header.jsp" %></h3></td></tr>
<tr style="height:600px">
<td style="width:450px" align="center"><%@ include file="/menu/menu.jsp" %></td>
<td style="width:1200px" align="center">
${msg }
<c:if test="${not empty view }">
<jsp:include page="${view}"/>
</c:if>
</td>
</tr>
</table>
<span align="center"><%@ include file="/menu/tail.jsp" %></span>
</body>
</html>