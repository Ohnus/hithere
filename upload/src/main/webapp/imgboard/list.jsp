<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function a(num){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let val = xhttp.responseText;
		let arr = JSON.parse(val);
		let html = '';
		for(let obj of arr){
			html += obj.content+"(writer:"+obj.writer+")<br/>";
		}
		let div = document.getElementById("r_"+num);
		div.innerHTML = html;
	}
	
	let param = "?pnum=" + num;
	param += "&writer=${sessionScope.loginId}";
	param += "&content="+document.getElementById("rep_"+num).value;
	
	xhttp.open("GET", "${pageContext.request.contextPath}/imgrep/add" + param);
	
	xhttp.send();
}
function editForm(num){
	let el = document.getElementById("editf_"+num);
	el.style.display="";
}
function cancel(num){
	let el = document.getElementById("editf_"+num);
	el.style.display="none";
}
function edit(num){
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		let val = xhttp.responseText;
		let obj = JSON.parse(val);
		document.getElementById("title_"+num).innerHTML = obj.title;
		document.getElementById("cont_"+num).value = obj.content;
		cancel(num);
	}	
	let param = "?num=" + num;
	param += "&title="+document.getElementById("eval1_"+num).value;
	param += "&content="+document.getElementById("eval2_"+num).value;
	
	xhttp.open("GET", "${pageContext.request.contextPath}/imgboard/edit" + param);
	
	xhttp.send();
}
function del(num){
	const xhttp = new XMLHttpRequest();
	let param = "?num=" + num;
	xhttp.open("GET", "${pageContext.request.contextPath}/imgboard/del" + param);
	xhttp.send();
	
	let body = document.getElementsByTagName("body")[0];
	let deltbl = document.getElementById("tbl_"+num);
	body.removeChild(deltbl);
}
</script>
</head>
<body>
<h3>이미지 게시판</h3>
<a href="${pageContext.request.contextPath }/imgboard/add">글작성</a><br/>
<c:forEach var="vo" items="${list }">
<table border="1" id="tbl_${vo.num }">
<tr><th>num</th>
<td>${vo.num }
<c:if test="${sessionScope.loginId == vo.writer}">
<input type="button" value="수정" onclick="editForm(${vo.num })">
<input type="button" value="삭제" onclick="del(${vo.num })">
<form id="editf_${vo.num }" style="display:none">
new title:<input type="text" id="eval1_${vo.num }" value="${vo.title }"><br/>
new content:<input type="text" id="eval2_${vo.num }" value="${vo.content }"><br/>
<input type="button" value="수정완료" onclick="edit(${vo.num })">
<input type="button" value="취소" onclick="cancel(${vo.num })">
</form>
</c:if>
</td></tr>
<tr><th>w_date</th><td>${vo.w_date }</td></tr>
<tr><th>writer</th><td>${vo.writer }</td></tr>
<tr><th>title</th><td><span id="title_${vo.num }">${vo.title }</span></td></tr>
<tr><th>사진</th><td><img src="${vo.path }" style="width:200px;height:200px"></td></tr>
<tr><th>content</th><td><textarea rows="10" cols="30" id="cont_${vo.num }">${vo.content }</textarea></td></tr>
<tr><th>댓글</th>
<td>
	<input type="text" id="rep_${vo.num }"><input type="button" value="작성" onclick="a(${vo.num })">
	<div id="r_${vo.num }">
		<c:forEach var="rep" items="${vo.reps }">
		${rep.content } (writer:${rep.writer })<br/>
		</c:forEach>
	</div>
</td>
</tr>
</table>
</c:forEach>
</body>
</html>