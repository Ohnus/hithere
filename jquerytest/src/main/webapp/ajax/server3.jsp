<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String name = request.getParameter("name");
String tel = request.getParameter("tel");
System.out.println(name+":"+tel);
out.print(name+":"+tel);
%>