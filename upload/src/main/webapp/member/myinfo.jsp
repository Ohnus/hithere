<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<form action="${ pageContext.request.contextPath }/member/myinfo" method="post">
���̵�: <input type="text" value="${m.id}" name="id" readonly><br/>
��й�ȣ: <input type="text" value="${m.pwd}" name="pwd"><br/>
�̸�: <input type="text" value="${m.name}" name="name"><br/>
�̸���: <input type="text" value="${m.email}" name="email" readonly><br/>
<input type="submit" value="����">
<a href="${ pageContext.request.contextPath }/member/index.jsp">����������</a>
</form>
</body>
</html>