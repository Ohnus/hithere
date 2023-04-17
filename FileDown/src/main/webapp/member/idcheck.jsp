<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
//이 윈도우가 로드되자마자 실행되는 핸들러
window.onload=function(){
	//request.method: 전송방식 값을 갖는 속성(GET, POST)
	if('${pageContext.request.method }'=='GET'){
		ff.id.value = opener.document.f.id.value;
	}else{//method가 post일때
		let html = "";
		if('${flag}'=='true'){
			html = "사용가능한 아이디";
			let val = '${id}';
			ff.id.value = val;
			html += "<input type='button' value='아이디사용' onclick='a(\""+val+"\")'>";
		}else{
			html = "중복된 아이디";
		}
		let div = document.getElementById("res");
		div.innerHTML = html;
	}
}

function a(id){
	opener.document.f.id.value = id;
	close();//현재 윈도우창 닫기
}
</script>
</head>
<body>

<h3>id중복체크</h3>
<form action="${pageContext.request.contextPath }/member/idcheck" method="post" name="ff">
id:<input type="text" name="id">
<input type="submit" value="체크">
</form>
<div id='res'>

</div>
</body>
</html>