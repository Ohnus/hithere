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
		let txt = $('p').text();
		let txt2 = $('#test').text();
		$('#d1').html(txt + " <br/> " + txt2);
		
		//id�� b1�� ��ҿ� Ŭ�� �̺�Ʈ �ڵ鷯 ����
		$('#b1').click(function(){
			let txt = $('#t1').val();
			alert('��ư Ŭ����. �Է°�:'+txt);
		});
		txt = '';
		$('h3').each(function(idx, item){//idx:�ε���, item:���			
			txt += idx+"��° ��� txt: "+$(item).text()+"<br/>";
		});
		$('#d2').html(txt);
		
		txt = '';
		$('h3.c1').each(function(idx, item){//idx:�ε���, item:���			
			txt += idx+"��° ��� txt: "+$(item).text()+"<br/>";
		});
		$('#d3').html(txt);
	});
</script>
</head>
<body>
	<div id='d1' style="border:1px solid blue"></div>
	<div id='d2' style="border:1px solid blue"></div>
	<div id='d3' style="border:1px solid blue"></div> => Ŭ�������� c1�� ����� text���
	<p>������</p>
	<h3 class="c1">aaa</h3>
	<h3 id="test">bbb</h3>
	<h3 class="c1">ccc</h3>
	<h3>ddd</h3>
	<h3 class="c1">eee</h3>
	<h2 class="c1">fff</h2>
	<input type="text" id="t1"><input type="button" id="b1" value='����'>
</body>
</html>






