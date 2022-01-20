<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("/HRD_0117/index.jsp");
	%>
</body>
</html>