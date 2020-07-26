<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.exam.beans.*"%>
<%@ page import="com.exam.dao.*"%>
<%@ page import="java.util.*"%>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>ID</td><td>NAME</td><td>EMAIL</td>
	<%
		List<Employee> list = EmployeeDAO.getAllRecords();
			for(Employee e : list)
			{
	%>	

		</tr>
		<tr>
			<td><%=e.getId()%></td>
			<td><a href="view.jsp?id=<%=e.getId() %>"><%=e.getName()%></a></td>
			<td><%=e.getEmail()%></td>
			<td><a href="delete.jsp?id=<%=e.getId() %>"> 삭제 </a></td>
			
	<%}%>
	</table>
	<a href="insert.jsp">추가</a>

</body>
</html>