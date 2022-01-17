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
		
		System.out.print("id : "+userName);
		System.out.println("   pw : "+Password);
		
		
		try{
			String sql = "select userName from login0117 where userName=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			if(rs.next()){//아이디 있음
				String id = rs.getString(1);
				sql = "select Password from login0117 where userName=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userName);
				rs = pstmt.executeQuery();
				if(rs.next()){//비밀번호 있음.
					String pw = rs.getString(1);
					if(Password.equals(pw)){//비밀번호 맞음
						%><script>
							alert("로그인 되었습니다.");
							location.href="/HRD_0117/index.jsp";			
						</script><%
					}else{
						//비밀번호 틀림
						%><script>
							alert("비밀번호가 틀렸습니다.");
							location.href="/HRD_0117/login.jsp";			
						</script><%
					}
				}else{//비밀번호 없음
					%><script>
						alert("비밀번호가 없습니다.");
						location.href="/HRD_0117/login.jsp";			
					</script><%
				}			
			}else{//아이디 없음
				%><script>
					alert("등록되지 않는 아이디 입니다.");
					location.href="/HRD_0117/login.jsp";			
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>