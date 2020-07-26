<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.test.dao.*"%>
<%@page import="com.test.beans.*"%>
<%@page import="java.util.Arrays.*" %>
<%--	// 아래와 같이 표현할 수 있으나 지금은 안된다.. 아래는 윈도우 경로이기 때문.. 
 	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection(); */ --%>
	
	<%--  	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn =
			DriverManager.getConnection(url, "system", "1234"); 
				
	String strSql = "SELECT * FROM REGISTER ORDER BY ID DESC";
	PreparedStatement stmt = conn.prepareStatement(strSql);
	ResultSet rs = stmt.executeQuery(); --%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Page</title>
</head>
<body>
	<table border="1">
	<tr>
		<td>ID</td><td>NAME</td><td>PASSWORD</td>
		<td>EMAIL</td><td>SEX</td><td>COUNTRY</td>
		<td>Modify</td><td>Delete</td>
	</tr>
	<%
	List<Register> list = RegisterDAO.getAllRecords();	
		for(Register r : list) {
	%>
	<tr>
		<td><%=r.getId() %></td>
		<td><a href="view.jsp?id=<%=r.getId() %>"><%=r.getName() %></a></td>
		<td><%=r.getPassword() %></td>
		<td><%=r.getEmail() %></td>
		<td><%=r.getSex() %></td>
		<td><%=r.getCountry() %></td>
		<td><a href="update.jsp?id=<%=r.getId() %>"> 수정 </a>
		<td><a href="delete.jsp?id=<%=r.getId() %>"> 삭제 </a>
	</tr>
	<%
	}
	%>
	</table>
</body>
</html>