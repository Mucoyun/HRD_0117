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
		String orderDate = request.getParameter("orderDate");
		String orderName = request.getParameter("orderName");
		String productId = request.getParameter("productId");
		String unitprice = request.getParameter("unitprice");
		String orderQty = request.getParameter("orderQty");
		String orderAddress = request.getParameter("orderAddress");
		int unitslnstock = 0;
		int atterUnitslnstock;
		
		try{
			//product table unitslnstock select.
			String sql = "select unitslnstock from product0117 where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitslnstock = rs.getInt(1);
			}else{
				%><script>
					alert("해당 상품이 없습니다.");
					history.back(-1);
				</script><%
			}
			atterUnitslnstock = unitslnstock-Integer.parseInt(orderQty);
			
			//product table update
			sql = "update product0117 set unitslnstock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, atterUnitslnstock);
			pstmt.setString(2, productId);
			pstmt.executeUpdate();
			
			
			//order table insert
			sql = "insert into order0117 values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDate);
			pstmt.setString(2, orderName);
			pstmt.setString(3, productId);
			pstmt.setString(4, unitprice);
			pstmt.setString(5, orderQty);
			pstmt.setString(6, orderAddress);
			pstmt.executeUpdate();
			
			%><script>
				alert("주문 등록이 완료되었스니다.");
				location.href="/HRD_0117/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>