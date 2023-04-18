<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="${ pageContext.request.contextPath }/member/myinfo" method="post" name="f">
아이디: <input type="text" value="${m.id}" name="id" readonly><br/>
비밀번호: <input type="text" value="${m.pwd}" name="pwd"><br/>
이름: <input type="text" value="${m.name}" name="name"><br/>
이메일: <input type="text" value="${m.email}" name="email" readonly><br/>
신청상태: <input type="text" value="${m.status}" name="status" readonly><br/>
<input type="submit" value="수정">
<a href="${ pageContext.request.contextPath }/member/index.jsp">메인페이지</a>
</form>
<c:if test="${m.status == '승인'}">
예약날짜<input type="date" value="2023-01-01" id="date">
예약시간<input type="time" step="3600" min="09:00" max="18:00" value="09:00">
<input type="submit" value="전송"><br/>
<!-- 관리자의 회원리스트는 모든 회원을 다 불러오되 신청한 사람만 보이게 리스트 뽑기 -->
<!-- 신청한 사람 인적사항 체크 후 가승인/미승인 전송 -->
<!-- 가승인되면 날짜선택 보여주고, 회원이 날짜시간 정해서 전송하면 관리자 회원리스트로 보내서 예약여부 업데이트 -->
<!-- 날짜 전송하면 날짜 form display none으로 변경 -->
<!-- 관리자가 status 최종승인으로 변경해주면 신청내역, 유의사항 보여주기 -->
</c:if>
</body>
</html>