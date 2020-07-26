<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.beans.*"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Page</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	Employee e = EmployeeDAO.getRecordById(Integer.parseInt(id));
	
	%>
	<table border="1">
	<tr>
		<td>ID</td><td><%=e.getId()%></td>
	</tr>
	<tr>
		<td>NAME</td><td><%=e.getName()%></td>
	</tr>
	<tr>
		<td>E-MAIL</td><td><%=e.getEmail()%></td>
	</tr>
	</table>

	<a href="list.jsp">목록&nbsp;</a><a href="update.jsp?id=<%=e.getId()%>">수정</a>&nbsp;<a href="delete.jsp">삭제</a>
	
</body>
</html>