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
	let edit = confirm("수정하시겠습니까?")
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
	let del = confirm("삭제하시겠습니까?")
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
	let del = confirm("댓글을 삭제하시겠습니까?");
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
	<input type="button" value="메인페이지" onclick="javascript:location.href='${pageContext.request.contextPath}/member/index.jsp'">
	<input type="button" value="글작성" onclick="javascript:location.href='${pageContext.request.contextPath}/imgboard/add'">
	<c:forEach var="vo" items="${list }">
	<table border="1" id="tbl_${vo.num }">
	<tr><th>글번호</th><td>${vo.num }</td></tr>
	<tr><th>작성자</th><td>${vo.writer }</td></tr>
	<tr><th>날짜</th><td>${vo.wdate }</td></tr>
	<tr><th>제목</th><td><span id="title_${vo.num}">${vo.title }</span></td></tr>
	<tr><th>내용</th><td><textarea rows="10" cols="30" name="content" id="cont_${vo.num}">${vo.content }</textarea></td></tr>
	<tr><th>사진</th><td><a href="http://localhost:8787/${vo.path}"><img src="${vo.path }" style="width: 200px; height: 200px"></a></td></tr>

	<c:if test="${sessionScope.loginId == vo.writer }">
	<tr>
	<td colspan="2" align="right">
	<input type="button" value="수정" onclick="editform(${vo.num})">
	<input type="button" value="삭제" onclick="del(${vo.num})">
	
	<form id="editf_${vo.num }" style="display: none">
	new title: <input type="text" id="eval1_${vo.num }" value="${vo.title }"><br/>
	new content: <input type="text" id="eval2_${vo.num }" value="${vo.content }"><br/>
	<input type="button" value="수정완료" onclick="edit(${vo.num })">
	<input type="button" value="취소" onclick="cancel(${vo.num })">
	</form>
	</td>
	</tr>
	</c:if>

	<tr>
	<th>댓글</th>
	<td>
	<input type="text" id="rep_${vo.num }">
	<input type="button" value="작성" onclick="a(${vo.num})"> <!-- 원글마다 댓글작성을 해야하므로 구분하기위해 원글번호 참조하여 id 설정 -->
	<div id="r_${vo.num }">
	<c:forEach var="rep" items="${vo.reps }">
	${rep.content }(writer: ${rep.writer })<input type="button" value="삭제" onclick="delrep(${rep.num })"><br/>
	</c:forEach>
	</div>
	</td>
	</tr>
	</table>
	</c:forEach>
</body>
</html>
