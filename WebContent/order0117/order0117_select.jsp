<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		#o_s_table tr{
			height: 50px;
		}#o_s_table{
			text-align: center;
		}#o_s_table a{
			text-decoration: none;
			color: blue;
			font-weight: bold;
		}#o_s_table a:HOVER {
			color: red;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no=0;
		try{
			String sql = "select count(*) from order0117";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no search order");
					history.back(-1);
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>주문 목록 조회 화면</h2>
		<p>총 <%=no %>개의 주문이 있습니다.</p>
		<hr>
		<table id="o_s_table">
			<tr>
				<th width="50">No</th>
				<th width="150">주문일자</th>
				<th width="100">주문자이름</th>
				<th width="100">상품코드</th>
				<th width="200">상품명</th>
				<th width="100">단가</th>
				<th width="100">주문수량</th>
				<th width="100">주문금액</th>
				<th width="200">주문주소</th>
				<th width="100">구분</th>
			</tr>
			<%
			no=0;
			try{
				String sql = "select to_char(a.orderDate,'yyyy-mm-dd'),a.orderName,a.productId,b.name,a.unitprice,a.orderQty,(a.unitprice*a.orderQty),a.orderAddress from order0117 a, product0117 b where a.productId=b.productId";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String orderDate = rs.getString(1);
					String orderName = rs.getString(2);
					String productId = rs.getString(3);
					String name = rs.getString(4);
					String unitprice = rs.getString(5);
					String orderQty = rs.getString(6);
					String orderUnitprice = rs.getString(7);
					String orderAddress = rs.getString(8);
					%>
					<tr>
						<td><%=no %></td>
						<td><%=orderDate %></td>
						<td><%=orderName %></td>
						<td><%=productId %></td>
						<td><%=name %></td>
						<td><%=unitprice %></td>
						<td><%=orderQty %></td>
						<td><%=orderUnitprice %></td>
						<td><%=orderAddress %></td>
						<td>
							<a href="/HRD_0117/order0117/order0117_update.jsp?send_orderName=<%=orderName%>">수정</a>
							<span> | </span>
							<a href="/HRD_0117/order0117/order0117_delete.jsp?send_orderName=<%=orderName%>&send_productId=<%=productId%>"
							onclick="if(!confirm('정말로 삭제하시겠습니까?')){
								return false;
							}">삭제</a>
						</td>
					</tr>
					<%
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>