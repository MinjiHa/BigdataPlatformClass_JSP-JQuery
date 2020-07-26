<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%
    String dept_id = request.getParameter("dept_id");

    Class.forName("oracle.jdbc.driver.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    Connection conn = 
            DriverManager.getConnection(url, "theo", "1234");
    
    String strSql = "DELETE FROM DEPT WHERE DEPT_ID = ?";
    
    PreparedStatement stmt = conn.prepareStatement(strSql);
    
    stmt.setInt(1, Integer.parseInt(dept_id));
    stmt.executeUpdate();
    stmt.close();
    
    conn.close();
    response.sendRedirect("List.jsp");
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>