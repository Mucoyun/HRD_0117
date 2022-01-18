<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<%@ include file="DBConn.jsp" %>
	<%
		String userName = request.getParameter("userName");
		String Password = request.getParameter("Password");
		String nickName = request.getParameter("nickName");
		
		System.out.print("id : "+userName);
		System.out.print("   pw : "+Password);
		System.out.println("   nn : "+nickName);
		
		
		try{
			String sql = "select username from member0118 where username=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			if(rs.next()){//아이디 중복 O
				%><script>
					alert("이미 등록된 아이디가 있습니다.");
					location.href="/HRD_0117/login/signIn.jsp";			
				</script><%				
			}else{//아이디 중복 X
				sql = "insert into member0118 values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userName);
				pstmt.setString(2, userName);
				pstmt.setString(3, nickName);
				pstmt.executeUpdate();
				%><script>
					alert("회원가입 되었습니다.");
					location.href="/HRD_0117/login/index.jsp";			
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>