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
	
	pstmt.setInt(1,Integer.parseInt(id));
	
	ResultSet rs = pstmt.executeQuery();
	
	String name = ""; 
	String email = "";
	while(rs.next()){
		name = rs.getString("NAME");
		email = rs.getString("EMAIL");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
</head>
<body>
<form action="updateProcess.jsp" method = "get">
사번 : <input type="text" name="ID" value="<%=id%>"><br>
이름 : <input type = "text" name="NAME" value="<%=name%>"><br>
이메일 : <input type = "text" name="EMAIL" value="<%=email%>"><br>
<input type = "submit" value = "저장">
<input type = "reset" value = "다시입력">
</form>

</body>
</html>