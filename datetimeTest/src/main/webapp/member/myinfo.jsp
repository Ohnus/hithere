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
<!-- �޷� �߰�ȣ : el ǥ���� -->
<!-- vo�� ��������� private���� �����ص� ������ �����ϴ� getter�� �ڵ����� �ҷ��� -->
<h3>${m.id}���� ����</h3>
<form action="${ pageContext.request.contextPath }/member/myinfo" method="post" name="f">
���̵�: <input type="text" value="${m.id}" name="id" readonly><br/>
��й�ȣ: <input type="text" value="${m.pwd}" name="pwd"><br/>
�̸�: <input type="text" value="${m.name}" name="name"><br/>
�̸���: <input type="text" value="${m.email}" name="email" readonly><br/>
��û����: <input type="text" value="${m.status}" name="status" readonly><br/>
<input type="submit" value="����">
<a href="${ pageContext.request.contextPath }/member/index.jsp">����������</a>
</form>
<c:if test="${m.status == '����'}">
���೯¥<input type="date" value="2023-01-01" id="date">
����ð�<input type="time" step="3600" min="09:00" max="18:00" value="09:00">
<input type="submit" value="����"><br/>
<!-- �������� ȸ������Ʈ�� ��� ȸ���� �� �ҷ����� ��û�� ����� ���̰� ����Ʈ �̱� -->
<!-- ��û�� ��� �������� üũ �� ������/�̽��� ���� -->
<!-- �����εǸ� ��¥���� �����ְ�, ȸ���� ��¥�ð� ���ؼ� �����ϸ� ������ ȸ������Ʈ�� ������ ���࿩�� ������Ʈ -->
<!-- ��¥ �����ϸ� ��¥ form display none���� ���� -->
<!-- �����ڰ� status ������������ �������ָ� ��û����, ���ǻ��� �����ֱ� -->
</c:if>
</body>
</html>