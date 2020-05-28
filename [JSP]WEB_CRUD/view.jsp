<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
	String id = request.getParameter("ID");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = 
		DriverManager.getConnection(url,"tami","1234");

	String str = "SELECT * FROM EMPLOYEE WHERE ID=?";

	PreparedStatement pstmt = conn.prepareStatement(str);
	pstmt.setInt(1, Integer.parseInt(id));
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee View</title>
</head>
<body>
<table border="1">
<%while(rs.next()) {%>
	<tr>
		<td>사번</td><td><%=rs.getInt("ID")%></td>
	</tr>
	<tr>
		<td>이름</td><td><%=rs.getString("NAME")%></td>
	</tr>
	<tr>
		<td>이메일</td><td><%=rs.getString("EMAIL")%></td>
	</tr>
</table>
<a href = "list.jsp">목록</a>
<a href = "update.jsp?ID=<%=rs.getInt("ID")%>">수정</a>
<a href = "delete.jsp?ID=<%=rs.getInt("ID")%>">삭제</a>
<%} %>
<% pstmt.close();
conn.close(); %>
</body>
</html>