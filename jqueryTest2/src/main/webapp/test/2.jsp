<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('h2').click(function(){
			$(this).hide();
		});
		
		// hover: mouseover, mouseout 합친 이벤트
		$('h3').hover(function() {
			$(this).css('background-color','red');
		}, function() {
			$(this).css('background-color','blue');
		});
		
		// input요소중 type이 text인 요소 선택
		$(':text').focus(function(){
			$(this).css('background-color','orange');
		});
		$(':text').blur(function(){ // focus 잃었을 때 이벤트
			$(this).css('background-color','white');
		});
		// input요소중 type이 button인 요소 선택
		$(':button').click(function(){ // 클릭 이벤트 핸들러 등록
			alert($(this).val()+" 버튼이 클릭됨")
		});
		//$(요소).on('이벤트명', 핸들러)
		$('#h4').on('click', function(){
			alert($(this).text());
		});
		$('h1').on({click:function(){
			alert($(this).text());
		}, mouseenter:function(){
			$(this).css('background-color','yellow');
		}, mouseleave:function(){
			$(this).css('background-color','white');
		}});
	});
</script>
</head>
<body>
<h3>jquery 이벤트 처리</h3>
<h4 id='h4'>가나다라마바사</h4>
<H1 id='h1'>ABCDEFGHIJK</H1>
<input type="text" id="t1"><br/>
<input type="text" id="t2"><br/>
<input type="button" id="b1" value="btn1">
<input type="button" id="b2" value="btn2"><br/>
<h2>aaa</h2>
<h2>bbb</h2>
<h2>ccc</h2>
<h2>ddd</h2>
<h2>eee</h2>
</body>
</html>