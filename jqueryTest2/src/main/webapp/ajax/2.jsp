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
		$('#b1').click(function(){
			$.ajax({
				url:'server1.jsp',
				dataType:'text',
				success:function(result){
					$('#d1').text(result);
				},
				error:function(req, status, error){ // req: 요청객체, status: 상태값, error: 에러
				}
			})
		});
		$('#b2').click(function(){
			$.ajax({
				url:'server2.jsp',
				type:'post',
				dataTpye:'json', // 파싱 자동으로 해줌
				success:function(result){ // result: 배열
					let txt = '';
					for(let obj of result){
						for(let key in obj){
							txt += key + ":" + obj[key] + "<br/>";
						}
					}
					$('#d2').html(txt);
				},
				error:function(req, status, error){
					alert(status);
				}
			});
		});
		$('#b3').click(function(){
			$.ajax({
				url:'server3.jsp',
				type:'post',
				data:{'name':$('#name').val(),'tel':$('#tel').val()},
				dataType:'text',
				success:function(result){ // result: 배열
					$('#d3').text(result);
				},
				error:function(req, status, error){
					alert(status);
				}
			});
		});
		$('#b3').click(function(){
			// 폼데이터: 폼안의 입력양식 값을 키:값을 자동으로 변환해주는 객체
			let formData = new FormData($('#f1')[0]); // 폼데이터 객체 생성
			$.ajax({
				url:'server3.jsp',
				type:'post',
				processData:false, // true:데이터를 url뒤에 붙여서 전송, false:데이터를 패킷 헤더에 담아서 전송
				contentType:true, // true:application 전송, false:multipart 전송
				data:formData,
				dataType:'text',
				success:function(result){ // result: 배열
					$('#d3').text(result);
				},
				error:function(req, status, error){
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
	<input type="button" id="b1" value="데이터로드">
	<input type="button" id="b2" value="데이터로드2"><br/>
	<form id="f1">
		name:<input type="text" id="name" name="name"><br/>
		tel:<input type="text" id="tel" name="tel"><br/>
		<input type="button" id="b4" value="파람테스트">
	</form>
	<input type="button" id="b3" value="데이터로드3">
</body>
</html>