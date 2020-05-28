<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Insert</title>
</head>
<body>
<form action="insertProcess.jsp" method = "get">
사번 : <input type = "text" name="ID"><br>
이름 : <input type = "text" name="NAME"><br>
이메일 : <input type = "text" name="EMAIL"><br>
<input type = "submit" value = "저장">
<input type = "reset" value = "다시입력">
</form>
</body>
</html>