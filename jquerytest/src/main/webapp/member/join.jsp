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
		$('#idcheck').click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath }/member/idcheck.do",
				type:'post',
				data:{'id':$('#id').val()},
				dataType:'json',
				success:function(result){ // result:{'flag':true/flase} 객체를 받아 온다.
					let txt = '<h4 style="color:';
					if(result.flag){
						txt += 'blue">사용가능한 아이디</h4>';
					} else {
						txt += 'red">사용 불가능한 아이디</h4>';
					}
					$('#res').html(txt);
				},
				error:function(req, status){
					alert(status);
				}
			});
		});
	});
</script>
</head>
<body>
<h3>회원가입</h3>
	<form action="${pageContext.request.contextPath }/member/join.do" method="post" id="f">
		<table border="1">
			<tr><th>ID</th>
			<td>
				<input type="text" name="id" id="id">
				<input type="button" value="id중복체크" id="idcheck">
				<span id="res"></span>
			</td></tr>
			<tr><th>PWD</th><td><input type="password" name="pwd"></td></tr>
			<tr><th>NAME</th><td><input type="text" name="name"></td></tr>
			<tr><th>EMAIL</th><td><input type="text" name="email"></td></tr>
			<tr><th>가입</th><td><input type="submit" value="가입"></td></tr>
		</table>
	</form>
</body>
</html>