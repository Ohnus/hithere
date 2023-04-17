<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 달러 중괄호 : el 표현식 -->
<!-- vo에 멤버변수를 private으로 설정해도 변수에 대응하는 getter를 자동으로 불러옴 -->
<h3>${m.id}님의 정보</h3>
<form action="${ pageContext.request.contextPath }/member/myinfo" method="post">
아이디: <input type="text" value="${m.id}" name="id" readonly><br/>
비밀번호: <input type="text" value="${m.pwd}" name="pwd"><br/>
이름: <input type="text" value="${m.name}" name="name"><br/>
이메일: <input type="text" value="${m.email}" name="email" readonly><br/>
<input type="submit" value="수정">
<a href="${ pageContext.request.contextPath }/member/index.jsp">메인페이지</a>
</form>
</body>
</html>