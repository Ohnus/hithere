<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#b1').click(function(){
			$('#d1').load('server1.jsp');
		});
		$('#b2').click(function(){
			//load('url', 핸들러:비동기요청의 응답오면 자동 호출될함수)
			$('#d2').load('server2.jsp', function(res, stat, xhr){//res:서버로부터 받은 값, stat:상태, xhr:비동기객체
				if(stat=='success'){
					let arr = JSON.parse(res);
					let txt = '';
					for(let obj of arr){
						for(let key in obj){
							txt += key +": "+obj[key]+"<br/>";
						}
					}
					$(this).html(txt);
				}else{
					alert('error');
				}
			});
		});
		$('#b3').click(function(){
			let param = {'name':$('#name').val(), 'tel':$('#tel').val()};
			//load('url', 서버로전송할 데이터, 핸들러:비동기요청의 응답오면 자동 호출될함수)
			$('#d3').load('server3.jsp', param);
		});
	});
</script>
</head>
<body>
	<div id="d1"></div>
	<div id="d2"></div>
	<div id="d3"></div>
	<input type="button" id="b1" value="데이터로드">
	<input type="button" id="b2" value="데이터로드2"><br/>
	name:<input type="text" id="name"><br/>
	tel:<input type="text" id="tel"><br/>
	<input type="button" id="b3" value="데이터로드3">
</body>
</html>