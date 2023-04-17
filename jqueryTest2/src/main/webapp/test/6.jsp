<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	border:1px solid black;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let cnt = 1;
		$('#editForm').hide();
		$('#b1').click(function(){ // 공백띄울 일 없으면 "" 없어도 됨
			let txt ='<div id=div_'+cnt+' pwd=' + $('#pwd').val() + '>';
			txt += '<h4 id=writer_'+cnt+'>writer: ' + $('#writer').val() + '</h4>';
			txt += '<h4 id=content_'+cnt+'>content: ' + $('#content').val() + '</h4>';
			txt += '<input type=button value=수정 onclick=editForm('+cnt+')>';
			txt += '<input type=button value=삭제 onclick=del('+cnt+')>';
			txt += '</div>';
			$('#list').append(txt);
			$('#pwd').val("");
			$('#writer').val("");
			$('#content').val("");
			cnt++;
		});
		$('#cancelbtn').click(function(){
			$('#editcont').val('');
			$('body').append($('#editForm'));
			$('#editForm').hide();
		});
		$('#editbtn').click(function(){
			let num = $(this).attr("num");
			alert(num);
			$('#content_'+num).text('content:'+$('#editcont').val());
			$('#editcont').val('');
			$('body').append($('#editForm'));
			$('#editForm').hide();
		});
	});
	function editForm(num){
		let pwd = prompt("수정하시려면 비밀번호를 입력하세요.")
		let pwd2 = $('#div_'+num).attr('pwd'); // attr("속성명", "값"): 속성값 읽거나 쓰는 함수
		if(pwd==pwd2){
			$('#div_'+num).append($('#editForm'));
			let c = $('#content_'+num).text().split(":")[1];
			$('#editcont').val(c);
			$('#editbtn').attr("num", num+"");
			$('#editForm').show();
		} else {
			alert("비밀번호가 틀렸습니다.")
		}
	}
	function del(num){
		let pwd = prompt("삭제하시려면 비밀번호를 입력하세요.")
		let pwd2 = $('#div_'+num).attr('pwd'); // attr("속성명", "값"): 속성값 읽거나 쓰는 함수
		if(pwd==pwd2){
			$('#div_'+num).remove();
		} else {
			alert("비밀번호가 틀렸습니다.")
		}
	}
</script>
</head>
<body>
<h3>방명록</h3>
<table border="1">
<tr><th>작성자</th><td><input type="text" id="writer"></td></tr>
<tr><th>글비밀번호</th><td><input type="password" id="pwd"></td></tr>
<tr><th>내용</th><td><input type="text" id="content"></td></tr>
<tr><th>작성</th><td><input type="button" id="b1" value="작성"></td></tr>
</table><br/>
<table border="1" id='editForm'>
<tr><th>내용</th><td><input type="text" id="editcont"></td></tr>
<tr><th>작성</th><td><input type="button" id="editbtn" value="수정" num="">
<input type="button" id="cancelbtn" value="취소"></td></tr>
</table><br/>
<div id="list"></div>
</body>
</html>