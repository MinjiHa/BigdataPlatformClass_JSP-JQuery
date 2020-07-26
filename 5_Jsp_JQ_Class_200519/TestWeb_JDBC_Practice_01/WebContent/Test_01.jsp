<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 드라이버를 얹어서.. 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	
	// 커넥션 정보를 추가해주고.. (주소, ID, PW)
	Connection conn = DriverManager.getConnection(url, "theo", "1234");
	Statement stmt = conn.createStatement();
// 	String strSql = "create table test10(id varchar2(5))";
// 	stmt.executeUpdate(strSql);
// 	stmt.close();
	String strSql2 = "SELECT * FROM DEPT";
	ResultSet rs = stmt.executeQuery(strSql2);
%>
	<table border="1">
	<% while(rs.next()) { %>
	<tr>
		<td><%
		out.print(rs.getInt("DEPT_ID")+", "+rs.getString("DEPT_NAME")+"<br>");%></td>
	</tr>
	<% } %>
	</table>
	<%
	conn.close();
	//out.print("Create tabletest10");
%>
</body>
</html>