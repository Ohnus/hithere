<!-- %@����: jsp�������� ���� ���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idcheck(){
	// open(param1, param2, param3) �� ������ ����
	// param1 = �� â�� ��� �޼���
	// param2 = �� ������ �̸�
	// param3 = ����(width���� height���� top������ġ left������ġ)
	// ���ϰ�: ������ ������ ��ü
	let win = open('idcheck.jsp', 'win', 'width=300, height=400, top=100, left=600')
	// win.close(); �˾�â ����
}
</script>
</head>
<body>
	<h3>ȸ������</h3>
	<form action="${ pageContext.request.contextPath }/member/join" method="post" name="f">
		<table border="1">
			<tr><th>ID</th>
			<td>
			<input type="text" name="id">
			<input type="button" value="ID �ߺ�üũ" onclick="idcheck()">
			</td></tr>
			<tr><th>PWD</th><td><input type="password" name="pwd"></td></tr>
			<tr><th>NAME</th><td><input type="text" name="name"></td></tr>
			<tr><th>EMAIL</th><td><input type="text" name="email"></td></tr>
			<tr><th>����</th><td><input type="submit" value="����"></td></tr>
		</table>
	</form>
</body>
</html>