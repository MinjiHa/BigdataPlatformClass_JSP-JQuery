<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	String country = request.getParameter("country");
	
	// 여기서부터 
	
	// 드라이버 로드 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// 접속 URL 정의  
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	
	
	// 커넥션 객체 생성 (URL, ID, PW)
	Connection conn = DriverManager.getConnection(url, "system", "1234");
	
	// SQL 구문 생성  
	String strSql = "INSERT INTO REGISTER VALUES(?,?,?,?,?,?)";
	
	// 스테이트먼트 객체 생성(SQL구문 )
	PreparedStatement stmt = conn.prepareStatement(strSql);
	
	// 파라미터 인덱스로 스테이트먼트 설정 
	stmt.setInt(1,Integer.parseInt(id));
	stmt.setString(2, name);
	stmt.setString(3,password);
	stmt.setString(4,email);
	stmt.setString(5,sex);
	stmt.setString(6,country);

	
	
	// 스테이트먼트 쿼리 실행 
	stmt.executeUpdate();
	
	// 스테이트먼트 쿼리 종료 
	stmt.close();
	
	// 접속 종료 
	conn.close();
	
	// 여기까지는 규칙이다. 외워야 한다.
	
	//out.print("Saved item");
	response.sendRedirect("List.jsp");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REGIST INSERT</title>
</head>
<body>
</body>
</html>