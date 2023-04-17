<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#b1').click(function(){
			$('h3').show();
		});
		$('#b2').click(function(){
			$('h3').hide();
		});
		$('#b3').click(function(){
			$('h3').toggle();
		});
	});
</script>
</head>
<body>
<input type="button" value="show" id="b1"><input type="button" value="hide" id="b2">
<input type="button" value="toggle" id="b3">
<h3>aaa</h3>
<h3>bbb</h3>
<h3>ccc</h3>
<h3>ddd</h3>
</body>
</html>