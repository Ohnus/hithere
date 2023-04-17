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
		$('h2').click(function(){
			$(this).hide();
		});
		//mouseover, mouseout ��ģ �̺�Ʈ: hover
		$('h3').hover(function(){
			$(this).css('background-color', 'red');
		}, 
		function(){
			$(this).css('background-color', 'blue');
		});
		
		//input ����� type�� text�� ��� ����
		$(':text').focus(function(){//��Ŀ�� �������
			$(this).css('background-color', 'orange');
		});
		$(':text').blur(function(){//��Ŀ�� �Ҿ�����
			$(this).css('background-color', 'white');
		});
		
		//input ����� type�� button�� ��� ����
		$(':button').click(function(){//Ŭ�� �̺�Ʈ �ڵ鷯 ���
			alert($(this).val()+" ��ư�� Ŭ����");
		});
		//$(���).on('�̺�Ʈ��', �ڵ鷯)
		$('#h4').on('click', function(){
			alert($(this).text());
		});
		
		$('h1').on({click:function(){alert($(this).text());},
			mouseenter:function(){$(this).css('background-color', 'yellow');},
			mouseleave:function(){$(this).css('background-color', 'white');}
		});
	});
</script>
</head>
<body>
<h3>jquery �̺�Ʈ ó��</h3>
<h4 id='h4'>asdsdfasf</h4>
<h1>�����ٶ�</h1>
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