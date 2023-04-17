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
		let cnt = 0;
		let arr = ["aaa", "bbb", "ccc", "ddd"];
		$.each(arr, function(idx, item){
			cnt = idx;
			$('#list').append("<h3 id='h"+cnt+"'>"+item+"</h3>");
		});
		
		$('#b1').click(function(){
			$('#h'+cnt).remove();
			cnt--;
		});
	});
</script>
</head>
<body>
<input type="button" id="b1" value="삭제">
<div id="list"></div>
</body>
</html>