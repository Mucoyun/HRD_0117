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
		if(session.getAttribute("s_nn")!=null){
			%><script>
				alert("이미 로그인 되어 있습니다.");
				location.href="/HRD_0117/index.jsp"
			</script><%
		}
	%>
</body>
</html>