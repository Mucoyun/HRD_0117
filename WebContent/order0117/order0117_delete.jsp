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
		String send_orderName =request.getParameter("send_orderName");
		String send_productId =request.getParameter("send_productId");
		int unitslnstock = 0;
		int getorderQty = 0;
		
		try{
			//product table unitslnstock select.
			String sql = "select unitslnstock,orderQty from product0117,order0117 where product0117.productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitslnstock = rs.getInt(1);//5
				getorderQty = rs.getInt(2);//6
			}else{
				%><script>
					alert("해당 상품이 없습니다.");
					history.back(-1);
				</script><%
			}
			
			sql = "update product0117 set unitslnstock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, unitslnstock+getorderQty);
			pstmt.setString(2, send_productId);
			pstmt.executeUpdate();
			
			
			sql = "delete from order0117 where orderName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_orderName);
			pstmt.executeUpdate();
			%><script>
				alert("주문 삭제가 완료되었스니다.");
				location.href="/HRD_0117/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>