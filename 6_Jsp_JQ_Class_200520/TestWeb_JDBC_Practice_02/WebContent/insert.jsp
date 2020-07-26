<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert PAGE</title>
</head>
<body>
<form action="InsertProcess.jsp" method="get">
ID : <input type="text" name="id"><br>
NAME : <input type="text" name="name"><br>
PASSWORD : <input type="password" name="password"><br>
EMAIL : <input type="text" name="email"><br>
SEX : <input type="text" name="sex"><br>
COUNTRY : <input type="text" name="country"><br>
<input type="submit" value="제출">
<input type="reset" value="취소">
</form>
</body>
</html>