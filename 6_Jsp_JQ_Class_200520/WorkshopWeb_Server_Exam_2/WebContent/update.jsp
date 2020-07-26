<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.beans.*"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Page</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	Employee e = EmployeeDAO.getRecordById(Integer.parseInt(id));
%> 
<form action="updateProcess.jsp" method="get">
ID : <input type="text" name="id" value="<%=e.getId()%>"><br>
NAME : <input type="text" name="name" value="<%=e.getName()%>"><br>
EMAIL : <input type="text" name="email" value="<%=e.getEmail()%>"><br>

<input type="submit" value="저장">
<input type="reset" value="다시 입력">
</form>
</body>
</html>