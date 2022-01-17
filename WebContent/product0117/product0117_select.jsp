<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		#p_s_table tr{
			height: 50px;
		}#p_s_table{
			text-align: center;
		}#p_s_table a{
			text-decoration: none;
			color: blue;
			font-weight: bold;
		}#p_s_table a:HOVER {
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
			String sql = "select count(*) from product0117";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no search productId");
					history.back(-1);
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>상품 목록 조회 화면</h2>
		<p>총 <%=no %>개의 상품이 있습니다.</p>
		<hr>
		<table id="p_s_table">
			<tr>
				<th width="50">No</th>
				<th width="100">상품코드</th>
				<th width="100">상품명</th>
				<th width="100">가격</th>
				<th width="300">상세정보</th>
				<th width="100">제조사</th>
				<th width="100">분 류</th>
				<th width="100">재고수</th>
				<th width="100">상태</th>
				<th width="100">구분</th>
			</tr>
			<%
			no=0;
			try{
				String sql = "select * from product0117";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String productId = rs.getString(1);
					String name = rs.getString(2);
					String unitprice = rs.getString(3);
					String description = rs.getString(4);
					String category = rs.getString(5);
					String manufacurer = rs.getString(6);
					String unitslnstock = rs.getString(7);
					String condition = rs.getString(8);
					%>
					<tr>
						<td><%=no %></td>
						<td><%=productId %></td>
						<td><%=name %></td>
						<td><%=unitprice %></td>
						<td><%=description %></td>
						<td><%=category %></td>
						<td><%=manufacurer %></td>
						<td><%=unitslnstock %></td>
						<td><%=condition %></td>
						<td>
							<a href="/HRD_0117/product0117/product0117_update.jsp?send_productId=<%=productId%>">수정</a>
							<span> | </span>
							<a href="/HRD_0117/product0117/product0117_delete.jsp?send_productId=<%=productId%>"
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