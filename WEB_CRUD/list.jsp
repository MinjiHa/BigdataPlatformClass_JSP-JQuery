<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = 
		DriverManager.getConnection(url,"tami","1234");

	String str = "SELECT * FROM EMPLOYEE ORDER BY ID DESC";

	PreparedStatement pstmt = conn.prepareStatement(str);
	ResultSet rs = pstmt.executeQuery();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = "insert.jsp">추가</a>
<table border="1">
	<tr>
		<td>사번</td>
		<td>이름</td>
		<td>이메일</td>
		<td></td>
	</tr>
<%while(rs.next()){%>
	<tr>
		<td><%=rs.getInt("ID")%></td>
		<td><a href = "view.jsp?ID=<%=rs.getInt("ID")%>"><%=rs.getString("NAME")%></a></td>
		<td><%=rs.getString("EMAIL")%></td>
		<td><a href = "delete.jsp?ID=<%=rs.getInt("ID")%>">삭제</a></td>
	</tr>
<%} %>
<% pstmt.close();
conn.close(); %>
</table>
</body>
</html>