<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.beans.*"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="java.util.*"%>

<% String id = request.getParameter("id");
   int tempId = Integer.parseInt(id);%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
</head>
<body>
<%
	EmployeeDAO.delete(tempId);
	response.sendRedirect("list.jsp");
%>
</body>
</html>