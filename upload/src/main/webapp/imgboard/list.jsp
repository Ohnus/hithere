<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function editform(num){
	let el = document.getElementById("editf_" + num);
	el.style.display = '';
}
function cancel(num){
	let el = document.getElementById("editf_" + num);
	el.style.display = 'none';
}
function edit(num){
	let edit = confirm("�����Ͻðڽ��ϱ�?")
	if(edit == true){
		const xhttp = new XMLHttpRequest();
	
		let param = "?num=" + num;
		param += "&title=" + document.getElementById("eval1_"+num).value;
		param += "&content=" + document.getElementById("eval2_"+num).value;
		
		xhttp.open("get", "${pageContext.request.contextPath}/imgboard/edit" + param);
		xhttp.send();

		xhttp.onload = function(){
			let val = xhttp.responseText;
			let obj = JSON.parse(val);
			document.getElementById("title_"+num).innerHTML = obj.title;
			document.getElementById("cont_"+num).value = obj.content;
			cancel(num);
		}
	} else {
		return;
	}
}
function del(num){
	let del = confirm("�����Ͻðڽ��ϱ�?")
	if(del == true){
		const xhttp = new XMLHttpRequest();
	
		let param = "?num=" + num;
		xhttp.open("get", "${pageContext.request.contextPath}/imgboard/delete" + param);
		xhttp.send();
	
		let body = document.getElementsByTagName("body")[0];
		let deltbl = document.getElementById("tbl_"+num);
		body.removeChild(deltbl);
	} else {
		return;
	}
}

function delrep(num){
	let del = confirm("����� �����Ͻðڽ��ϱ�?");
	if(del == true){
		location.href="${pageContext.request.contextPath}/imgrep/delete?num=" + num;
	} else {
		return;
	}
}


function a(num){
	const xhttp = new XMLHttpRequest();
	
	let param = "?pnum=" + num;
	param += "&writer=${sessionScope.loginId}";
	param += "&content=" + document.getElementById("rep_"+num).value;
	
	xhttp.open("get", "${pageContext.request.contextPath}/imgrep/add" + param);
	xhttp.send();

	xhttp.onload = function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			html += obj.content + "(writer:" + obj.writer + ")" + "<br/>";
		}
		let div = document.getElementById("r_"+num);
		div.innerHTML = html;
	}
	document.getElementById("rep_"+num).value = '';
}
</script>
</head>
<body>
	<input type="button" value="����������" onclick="javascript:location.href='${pageContext.request.contextPath}/member/index.jsp'">
	<input type="button" value="���ۼ�" onclick="javascript:location.href='${pageContext.request.contextPath}/imgboard/add'">
	<c:forEach var="vo" items="${list }">
	<table border="1" id="tbl_${vo.num }">
	<tr><th>�۹�ȣ</th><td>${vo.num }</td></tr>
	<tr><th>�ۼ���</th><td>${vo.writer }</td></tr>
	<tr><th>��¥</th><td>${vo.wdate }</td></tr>
	<tr><th>����</th><td><span id="title_${vo.num}">${vo.title }</span></td></tr>
	<tr><th>����</th><td><textarea rows="10" cols="30" name="content" id="cont_${vo.num}">${vo.content }</textarea></td></tr>
	<tr><th>����</th><td><a href="http://localhost:8787/${vo.path}"><img src="${vo.path }" style="width: 200px; height: 200px"></a></td></tr>

	<c:if test="${sessionScope.loginId == vo.writer }">
	<tr>
	<td colspan="2" align="right">
	<input type="button" value="����" onclick="editform(${vo.num})">
	<input type="button" value="����" onclick="del(${vo.num})">
	
	<form id="editf_${vo.num }" style="display: none">
	new title: <input type="text" id="eval1_${vo.num }" value="${vo.title }"><br/>
	new content: <input type="text" id="eval2_${vo.num }" value="${vo.content }"><br/>
	<input type="button" value="�����Ϸ�" onclick="edit(${vo.num })">
	<input type="button" value="���" onclick="cancel(${vo.num })">
	</form>
	</td>
	</tr>
	</c:if>

	<tr>
	<th>���</th>
	<td>
	<input type="text" id="rep_${vo.num }">
	<input type="button" value="�ۼ�" onclick="a(${vo.num})"> <!-- ���۸��� ����ۼ��� �ؾ��ϹǷ� �����ϱ����� ���۹�ȣ �����Ͽ� id ���� -->
	<div id="r_${vo.num }">
	<c:forEach var="rep" items="${vo.reps }">
	${rep.content }(writer: ${rep.writer })<input type="button" value="����" onclick="delrep(${rep.num })"><br/>
	</c:forEach>
	</div>
	</td>
	</tr>
	</table>
	</c:forEach>
</body>
</html>
