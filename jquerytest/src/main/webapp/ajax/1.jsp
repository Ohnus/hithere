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
			//load('url', �ڵ鷯:�񵿱��û�� ������� �ڵ� ȣ����Լ�)
			$('#d2').load('server2.jsp', function(res, stat, xhr){//res:�����κ��� ���� ��, stat:����, xhr:�񵿱ⰴü
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
			//load('url', ������������ ������, �ڵ鷯:�񵿱��û�� ������� �ڵ� ȣ����Լ�)
			$('#d3').load('server3.jsp', param);
		});
	});
</script>
</head>
<body>
	<div id="d1"></div>
	<div id="d2"></div>
	<div id="d3"></div>
	<input type="button" id="b1" value="�����ͷε�">
	<input type="button" id="b2" value="�����ͷε�2"><br/>
	name:<input type="text" id="name"><br/>
	tel:<input type="text" id="tel"><br/>
	<input type="button" id="b3" value="�����ͷε�3">
</body>
</html>