<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
// 배열
let txt = '[{"num":1, "name":"aaa", "tel":"111"}, {"num":2, "name":"bbb", "tel":"222"}, {"num":3, "name":"ccc", "tel":"333"}]';
// 객체
let txt2 = '{"num":1, "name":"aaa", "tel":"111"}';

let arr = JSON.parse(txt);
for(let obj of arr){
	document.write("num:"+obj.num+"<br/>");
	document.write("name:"+obj.name+"<br/>");
	document.write("tel:"+obj.tel+"<br/>");
}

</script>
</head>
<body>

</body>
</html>