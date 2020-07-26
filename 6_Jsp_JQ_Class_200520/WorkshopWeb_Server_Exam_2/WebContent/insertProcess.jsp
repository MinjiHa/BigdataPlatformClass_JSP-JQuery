<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.beans.*"%>
<%@ page import="com.exam.dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Employee e = new Employee();
	e.setId(Integer.parseInt(id));
	e.setName(name);
	e.setEmail(email);
	
	EmployeeDAO.save(e);
	response.sendRedirect("list.jsp");
%>
</body>
</html>