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
		String productId = request.getParameter("productId");
		String name = request.getParameter("name");
		String unitprice = request.getParameter("unitprice");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String manufacurer = request.getParameter("manufacurer");
		String unitslnstock = request.getParameter("unitslnstock");
		String condition = request.getParameter("condition");
		
		try{
			String sql = "update product0117 set name=?,unitprice=?,description=?,category=?,manufacurer=?,unitslnstock=?,condition=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, unitprice);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setString(5, manufacurer);
			pstmt.setString(6, unitslnstock);
			pstmt.setString(7, condition);
			pstmt.setString(8, productId);
			
			pstmt.executeUpdate();
			
			%><script>
				alert("변경이 완료되었스니다.");
				location.href="/HRD_0117/product0117/product0117_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>