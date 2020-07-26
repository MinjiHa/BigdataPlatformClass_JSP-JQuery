<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.test.beans.*" %>
<%@ page import="com.test.dao.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	String country = request.getParameter("country");
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection con = DriverManager.getConnection(url,"system","1234");
	
	String strSql 
	= "UPDATE REGISTER SET NAME = ?,PASSWORD = ?,EMAIL = ?,SEX = ?,COUNTRY = ? WHERE ID = ?";
	
	PreparedStatement stmt = con.prepareStatement(strSql);
	
	stmt.setString(1, name);
	stmt.setString(2, password);
	stmt.setString(3, email);
	stmt.setString(4, sex);
	stmt.setString(5, country);
	stmt.setInt(6, Integer.parseInt(id));
	stmt.executeUpdate();
	stmt.close();
	
	response.sendRedirect("List.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REGIST UPDATE</title>
</head>
<body>

</body>
</html>