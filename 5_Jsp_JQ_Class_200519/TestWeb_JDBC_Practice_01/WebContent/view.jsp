<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String dept_id = request.getParameter("dept_id");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "theo", "1234");
	String strSql = "SELECT * FROM DEPT WHERE DEPT_ID = ?";
	PreparedStatement stmt = conn.prepareStatement(strSql);
	stmt.setString(1, dept_id);
	ResultSet rs = stmt.executeQuery();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% while(rs.next()){ %>
	<table border="1">
	<tr>
		<td>부서번호</td><td><%=rs.getString("DEPT_ID")%></td>
	</tr>
	<tr>
		<td>부서명</td><td><%=rs.getString("DEPT_NAME")%></td>
	</tr>
	<tr>
		<td>위치코드</td><td><%=rs.getString("LOC_ID")%></td>
	</tr>
	</table>
	<% } %>
	<a href="List.jsp">목록&nbsp;</a><a href="">수정</a>&nbsp;<a href="delete.jsp?dept_id=">삭제</a>
	
</body>
</html>