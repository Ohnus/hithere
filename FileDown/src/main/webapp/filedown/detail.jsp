<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�ڷ� ����</h3>
<a href="${pageContext.request.contextPath }/filedown/list.do">�ڷ�������</a><br/>
<table border="1">
<tr><th>����</th><td>${vo.title }</td></tr>
<tr><th>�ۼ���</th><td>${vo.writer }</td></tr>
<tr><th>�ۼ���</th><td>${vo.w_date }</td></tr>
<tr><th>���ϸ�</th><td>${vo.fname }
<form action="${pageContext.request.contextPath }/filedown/detail.do" method="post">
<input type="hidden" name="num" value="${vo.num }">
<input type="submit" value="�ٿ�ε�">
</form></td></tr>
<tr><th>�ٿ��</th><td id="cnt">${vo.cnt }</td></tr>
<tr><th>����</th><td>${vo.content }</td></tr>
</table>
</body>
</html>