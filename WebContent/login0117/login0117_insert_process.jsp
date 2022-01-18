<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String getid="";
		String getpw="";
		String getnn="";
		
		try{
			String sql = "select id,password,name from member0117 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				getid = rs.getString(1);
				getpw = rs.getString(2);
				getnn = rs.getString(3);
				if(password.equals(getpw)){
					%><script>
						var nickname = "<%=getnn %>";
						alert(nickname + "님 로그인을 환영합니다.");
						location.href="/HRD_0117/index.jsp";
					</script><%
				}else{
					%><script>
						alert("비밀번호가 틀렸습니다.");
						location.href="/HRD_0117/login0117/login0117_insert.jsp";
					</script><%	
				}
			}else{
				%><script>
					alert("등록된 아이디가 없습니다.");
					location.href="/HRD_0117/login0117/login0117_insert.jsp";
				</script><%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>