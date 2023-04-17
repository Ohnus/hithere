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
			$.ajax({
				url:'server1.jsp',
				type:'post',
				dataType:'text',
				success:function(result){
					$('#d1').text(result);
				},
				error:function(req, status){//req:��û��ü, status:���°�
					alert(status);
				}
			});
		});
		$('#b2').click(function(){
			$.ajax({
				url:'server2.jsp',
				type:'post',
				dataType:'json',
				success:function(result){//result: �迭
					let txt = '';
					for(let obj of result){
						for(let key in obj){
							txt += key+":"+obj[key]+"<br/>";
						}
					}
					$('#d2').html(txt);
				},
				error:function(req, status){//req:��û��ü, status:���°�
					alert(status);
				}
			});
		});
		$('#b3').click(function(){
			$.ajax({
				url:'server3.jsp',
				type:'post',
				data:{'name':$('#name').val(), 'tel':$('#tel').val()},
				dataType:'text',
				success:function(result){//result: �迭
					$('#d3').text(result);
				},
				error:function(req, status){//req:��û��ü, status:���°�
					alert(status);
				}
			});
		});
		$('#b4').click(function(){
			//��������: �� ���� �Է¾�� ���� Ű:������ �ڵ����� ��ȯ
			let formData = $('#f1').serialize();//�� ������ ��ü ����
			alert(formData);
			$.ajax({
				url:'server3.jsp',
				type:'post',
				data:formData,
				dataType:'text',
				success:function(result){//result: �迭
					$('#d3').text(result);
				},
				error:function(req, status){//req:��û��ü, status:���°�
					alert(status);
				}
			});
			
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
	<form id="f1">
		name:<input type="text" id="name" name="name"><br/>
		tel:<input type="text" id="tel" name="tel"><br/>
		<input type="button" id="b4" value="�Ķ��׽�Ʈ">
	</form>
	<input type="button" id="b3" value="�����ͷε�3">
	
</body>
</html>