<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.editf').hide();
		$('.editbtn').click(function(){
			let num = $(this).attr("num");
			$('#editf_'+num).show();
		});
		$('.cancel').click(function(){
			let num = $(this).attr("num");
			$('#editf_'+num).hide();
		});
		$('.edit').click(function(){
			let num = $(this).attr("num");
// 			let param = {'num':num, 'title':$('#eval1_'+num).val(), 'content':$('#eval2_'+num).val()};
			$.ajax({
				url:'${pageContext.request.contextPath }/imgboard/edit.do',
				type:'post',
				data:{'num':num, 'title':$('#eval1_'+num).val(), 'content':$('#eval2_'+num).val()},
				dataType:'json',
				success:function(result){
					$('#title_'+num).text(result.title);
					$('#cont_'+num).text(result.content);
					$('#eval1_'+num).val(result.title);
					$('#eval2_'+num).val(result.content);
					$('#editf_'+num).hide();
				},
				error:function(req, status){
					alert(status);
				}
			});
		});
		$('.delbtn').click(function(){
			let num = $(this).attr("num");
			$.ajax({
				url:'${pageContext.request.contextPath }/imgboard/del.do',
				type:'post',
				data:{'num':num},
				success:function(result){
					$('#tbl_'+num).remove();
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
<h3>이미지 게시판</h3>
<a href="${pageContext.request.contextPath }/imgboard/add.do">글작성</a><br/>
<c:forEach var="vo" items="${list }">
<table border="1" id="tbl_${vo.num }">
<tr><th>num</th>
<td>${vo.num }
<c:if test="${sessionScope.loginId == vo.writer}">
<input type="button" value="수정" class="editbtn" num="${vo.num }">
<input type="button" value="삭제" class="delbtn" num="${vo.num }">
<form id="editf_${vo.num }" class="editf">
new title:<input type="text" id="eval1_${vo.num }" value="${vo.title }"><br/>
new content:<input type="text" id="eval2_${vo.num }" value="${vo.content }"><br/>
<input type="button" value="수정완료" class="edit" num="${vo.num }">
<input type="button" value="취소" class="cancel" num="${vo.num }">
</form>
</c:if>
</td></tr>
<tr><th>w_date</th><td>${vo.w_date }</td></tr>
<tr><th>writer</th><td>${vo.writer }</td></tr>
<tr><th>title</th><td><span id="title_${vo.num }">${vo.title }</span></td></tr>
<tr><th>사진</th><td><img src="${vo.path }" style="width:200px;height:200px"></td></tr>
<tr><th>content</th><td><textarea rows="10" cols="30" id="cont_${vo.num }">${vo.content }</textarea></td></tr>
<tr><th>댓글</th>
<td>
	<input type="text" id="rep_${vo.num }"><input type="button" value="작성" onclick="a(${vo.num })">
	<div id="r_${vo.num }">
		<c:forEach var="rep" items="${vo.reps }">
		${rep.content } (writer:${rep.writer })<br/>
		</c:forEach>
	</div>
</td>
</tr>
</table>
</c:forEach>
</body>
</html>