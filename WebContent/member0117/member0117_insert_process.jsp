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
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth3 = request.getParameter("birth3");
		String birth = birth1+"/"+birth2+"/"+birth3;
		
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String mail3 = request.getParameter("mail3");
		String mail;
		if(mail3.equals("self")||mail3.equals("")){
			mail = mail1+"@"+mail2;
		}else{
			mail = mail1+"@"+mail3;
		}
		
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		try{
			String sql = "insert into member0117 values(?,?,?,?,?,?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birth);
			pstmt.setString(6, mail);
			pstmt.setString(7, phone);
			pstmt.setString(8, address);
			
			pstmt.executeUpdate();
			
			%><script>
				alert("등록이 완료되었스니다.");
				location.href="/HRD_0117/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>