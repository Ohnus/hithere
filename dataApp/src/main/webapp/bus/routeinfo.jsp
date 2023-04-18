<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${busRouteNm } 버스 정보</h3>
버스번호:${busRouteNm }<br/>
운수회사:${corpNm }<br/>
기점역:${stStationNm }<br/>
종점역:${edStationNm }<br/>
첫차시간:${firstBusTm }<br/>
막차시간:${lastBusTm }<br/>
배차간격:${term }<br/>
</body>
</html>