<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "system", "1234");
	String strSql = "SELECT * FROM REGISTER WHERE ID = ?";
	PreparedStatement stmt = conn.prepareStatement(strSql);
	stmt.setString(1, id);
	ResultSet rs = stmt.executeQuery();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Page</title>
</head>
<body>
	<% while(rs.next()){ %>
	<table border="1">
	<tr>
		<td>ID</td><td><%=rs.getString("ID")%></td>
	</tr>
	<tr>
		<td>NAME</td><td><%=rs.getString("NAME")%></td>
	</tr>
	<tr>
		<td>PASSWORD</td><td><%=rs.getString("PASSWORD")%></td>
	</tr>
		<tr>
		<td>E-MAIL</td><td><%=rs.getString("EMAIL")%></td>
	</tr>
		<tr>
		<td>SEX</td><td><%=rs.getString("SEX")%></td>
	</tr>
		<tr>
		<td>COUNTRY</td><td><%=rs.getString("COUNTRY")%></td>
	</tr>
	</table>
	<% } %>
	<a href="List.jsp">목록&nbsp;</a><a href="update.jsp">수정</a>&nbsp;<a href="delete.jsp?dept_id=">삭제</a>
	
</body>
</html>