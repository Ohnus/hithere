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
		
		//id가 b1인 요소에 클릭 이벤트 핸들러 붙임
		$('#b1').click(function(){
			let txt = $('#t1').val();
			alert('버튼 클릭됨. 입력값:'+txt);
		});
		txt = '';
		$('h3').each(function(idx, item){//idx:인덱스, item:요소			
			txt += idx+"번째 요소 txt: "+$(item).text()+"<br/>";
		});
		$('#d2').html(txt);
		
		txt = '';
		$('h3.c1').each(function(idx, item){//idx:인덱스, item:요소			
			txt += idx+"번째 요소 txt: "+$(item).text()+"<br/>";
		});
		$('#d3').html(txt);
	});
</script>
</head>
<body>
	<div id='d1' style="border:1px solid blue"></div>
	<div id='d2' style="border:1px solid blue"></div>
	<div id='d3' style="border:1px solid blue"></div> => 클래스명이 c1인 요소의 text출력
	<p>가나다</p>
	<h3 class="c1">aaa</h3>
	<h3 id="test">bbb</h3>
	<h3 class="c1">ccc</h3>
	<h3>ddd</h3>
	<h3 class="c1">eee</h3>
	<h2 class="c1">fff</h2>
	<input type="text" id="t1"><input type="button" id="b1" value='저장'>
</body>
</html>






