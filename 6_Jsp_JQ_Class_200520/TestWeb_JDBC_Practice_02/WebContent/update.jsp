<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection con = 
			DriverManager.getConnection(url, "system", "1234");
	String strSql = "SELECT * FROM REGISTER WHERE ID = ?";
	
	PreparedStatement stmt = con.prepareStatement(strSql);
	stmt.setString(1, id);
	ResultSet rs = stmt.executeQuery();
	
	String name = ""; 
	String password = "";
	String email = "";
	String sex = "";
	String country = "";
	
	while(rs.next()){
		name = rs.getString("name");
		password = rs.getString("password");
		email = rs.getString("email");
		sex = rs.getString("sex");
		country = rs.getString("country");
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Page</title>
</head>
<body>
<form action="updateProcess.jsp" method="get">
아이디 : <input type="text" name="id" value="<%=id%>"><br>
이름 : <input type="text" name="name" value="<%=name%>"><br>
비밀번호 : <input type="text" name="password" value="<%=password%>"><br>
이메일 : <input type="text" name="email" value="<%=email%>"><br>
성별 : <input type="text" name="sex" value="<%=sex%>"><br>
국적 : <input type="text" name="country" value="<%=country%>"><br>
<input type="submit" value="저장">
<input type="reset" value="다시입력">
</form>
</body>
</html>