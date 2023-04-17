<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	width:200px;
	height:200p;
	background-color:gray;
	color:white;
}
img{
	width:180px;
	height:150px;
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let arr = ["#d0", "#d1", "#d2", "#d3", "#d4"];
		let cnt = 0;
		let size = 3;
		$(document).ready(function(){
			for(let d of arr){
				$(d).hide();
			}
			for(i=0; i<size; i++){
				$("#t"+i).append($("#d"+i));
				$("#d"+i).show();
			}
			$("#b1").click(function(){
				if(cnt==0){
					alert("맨 앞이다.");
					return;
				}
				cnt--;
				let body = $("#body");
				for(let d of arr){
					let parent = $(d).parent(); // parent(): 현재 노드의 부모 노드 반환($(d)의 부모요소 반환해주는 함수)
					if(parent!=body){
						body.append($(d));
						$(d).hide();
					}
				}
				for(i=0; i<size; i++){
					$("#t"+i).append($("#d"+(i+cnt)));
					$("#d"+(i+cnt).show();
				}
			});
			$("#b2").click(function(){
				if(cnt+size>=arr.length){
					alert("맨 앞이다.");
					return;
				}
				cnt++;
				let body = $("#body");
				for(let d of arr){
					let parent = $(d).parent(); // parent(): 현재 노드의 부모 노드 반환($(d)의 부모요소 반환해주는 함수)
					if(parent!=body){
						body.append($(d));
						$(d).hide();
					}
				}
				for(i=0; i<size; i++){
					$("#t"+i).append($("#d"+(i+cnt)));
					$("#d"+i).show();
				}
			});
		});
	});
</script>
</head>
<body id="body">
<table>
<tr><td id="t0"></td><td id="t1"></td><td id="t2"></td></tr>
</table>
<input type="button" value="prev" id="b1">
<input type="button" value="next" id="b2">
<div id="d0">
<h4>img1</h4>
<img src="../img/p1.png">
</div>
<div id="d1">
<h4>img2</h4>
<img src="../img/p2.gif">
</div>
<div id="d2">
<h4>img3</h4>
<img src="../img/p3.png">
</div>
<div id="d3">
<h4>img4</h4>
<img src="../img/p4.png">
</div>
<div id="d4">
<h4>img5</h4>
<img src="../img/p5.png">
</div>
</body>
</html>