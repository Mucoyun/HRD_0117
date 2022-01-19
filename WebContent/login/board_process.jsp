<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<%@ include file="DBConn.jsp" %>
	<%
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		
		int num;
		String password="";
		try{
			String sql = "select count(a.num),b.Password from board a,member0118 b where nickname=? group by b.password";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1);
				password=rs.getString(2);
				num++;
			}else{
				num = 1;
			}
			
			sql = "insert into board values(?,?,?,?,?,current_timestamp,0,0,0,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, title);
			pstmt.setString(5, memo);
			
			pstmt.executeUpdate();
			%><script>
				alert("등록되었습니다.");
				location.href="/HRD_0117/login/board.jsp";			
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>