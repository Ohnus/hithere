<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
img{
	width:150px;
	height:150px;
}
</style>
</head>
<body>
<table border="1">
<tr><th colspan="2">�ϱ�(${vo.wdate })</th></tr>
<tr><th>�ۼ���</th><td align="right">${vo.writer }</td></tr>
<tr><th>����</th><td align="center"><textarea rows="10" cols="100">${vo.content }</textarea></td></tr>
<tr>
<th>����</th>
<td colspan="2" align="center">
<img src="${vo.pic1 }"><img src="${vo.pic2 }"><img src="${vo.pic3 }"></td>
</tr>
<tr><td colspan="2" align="right">
<input type="button" value="����" onclick="">
<input type="button" value="����" onclick="">
</td></tr>
</table>
</body>
</html>