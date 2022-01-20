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
		String num = request.getParameter("num");
		String name = (String)session.getAttribute("s_nn");
		String comment = request.getParameter("coment");
		//System.out.println(num+","+name+","+comment);
		
		try{
			String sql = "insert into board_Comment values(?,?,?,current_timestamp)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, comment);
			pstmt.executeUpdate();
			%><script>
				alert("댓글이 입력되었습니다.");
				location.href="board_open.jsp?send_num=<%=num%>";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>