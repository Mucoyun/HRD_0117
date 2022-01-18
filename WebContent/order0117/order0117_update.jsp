<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		table{
			border: 3px solid black;
			margin: 0 auto;
		}tr,td,th{
			border: 1px solid black;
		}
		#o_iu_table tr{
			height: 30px;
		}#o_iu_table th{
			width: 100px;
		}#o_iu_table td{
			width: 400px;
		}
		#o_iu_table input[type="text"]{
			width: 350px;
			height: 25px;
		}#o_iu_table input[type="date"]{
			width: 350px;
			height: 25px;
		}#o_iu_table input[type="number"]{
			width: 350px;
			height: 25px;
		}
		#o_iu_table #btntd{
			text-align: center;
			height: 40px;
		}#o_iu_table #btntd button{
			width: 200px;
			height: 25px; 
		}
	</style>
	<script>
		function check() {
			var form = document.o_u_form;
			
			if(form.orderDate.value==""){
				alert("주문일자를 입력하세요.");
				form.orderDate.focus();
			}else if(form.name.value==""){
				alert("주문자이름을 입력하세요.");
				form.name.focus();
			}else if(form.productId.value==""){
				alert("상품코드를 입력하세요.");
				form.productId.focus();
			}else if(form.orderQty.value==""){
				alert("주문수량을 입력하세요.");
				form.orderQty.focus();
			}else if(form.orderAddress.value==""){
				alert("주문주소를 입력하세요.");
				form.orderAddress.focus();
			}else{
				form.action = "order0117_update_process.jsp"
				form.submit();	
			}
		}
		function retry() {
			history.back(-1);
		}
		
		function codeselect() {
			document.o_u_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_orderName =request.getParameter("send_orderName");
	
		String orderDate = request.getParameter("orderDate");
		String orderName = request.getParameter("orderName");
		String productId = request.getParameter("productId");
		String orderQty = request.getParameter("orderQty");
		String orderAddress = request.getParameter("orderAddress");
		String name = request.getParameter("name");
		String unitprice = "0";
		
		int unitslnstock = 0;
		int getorderQty = 0;
		
		try{
			String sql = "select to_char(a.orderDate,'yyyy-mm-dd'),a.orderName,a.productId,b.name,a.unitprice,a.orderQty,a.orderAddress,b.unitslnstock from order0117 a, product0117 b where a.productId=b.productId and a.orderName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_orderName);
			rs = pstmt.executeQuery();
			if(rs.next()){
				orderDate = rs.getString(1);
				orderName = rs.getString(2);
				productId = rs.getString(3);
				name = rs.getString(4);
				unitprice = rs.getString(5);
				getorderQty = rs.getInt(6);
				orderAddress = rs.getString(7);
				unitslnstock = rs.getInt(8);
			}else{
				%><script>
					alert("no search order");
					history.back(-1);
				</script><%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(orderQty==null){orderQty=Integer.toString(getorderQty);}
		
		int Unitprice = Integer.parseInt(unitprice);
		int OrderQty = Integer.parseInt(orderQty);
		
		if(OrderQty==getorderQty){
			OrderQty = getorderQty;
		}
		if(OrderQty<0){
			OrderQty = 0;
		}else if(OrderQty>unitslnstock+getorderQty){
			OrderQty = unitslnstock+getorderQty;
			%><script>
				alert("등록된 재고수를 초과했습니다.");
				codeselect();
			</script><%
		}
		
		int orderUnitprice = Unitprice * OrderQty;
	%>
	<section>
		<h2>주문 정보 변경 화면</h2><hr>
		<form name="o_u_form" method="post" action="order0117_update.jsp?send_orderName=<%=orderName%>">
			<table id="o_iu_table">
				<tr>
					<th>주문일자</th>
					<td><input type="date" name="orderDate" value="<%=orderDate%>" readonly></td>
					<th>주문자이름</th>
					<td><input type="text" name="orderName" value="<%=orderName%>" readonly></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId" value="<%=productId%>" readonly></td>
					<th>상품명</th>
					<td><input type="text" name="name" value="<%=name%>" readonly></td>
				</tr>
				<tr>
					<th>단가</th>
					<td><input type="text" name="unitprice" value="<%=Unitprice%>" readonly></td>
					<th>주문수량</th>
					<td><input type="number" name="orderQty" value="<%=OrderQty%>" onchange="codeselect()"></td>
				</tr>
				<tr>
					<th>주문금액</th>
					<td><input type="text" name="orderUnitprice" value="<%=orderUnitprice%>" readonly></td>
					<th>주문주소</th>
					<td><input type="text" name=orderAddress value="<%=orderAddress%>"></td>
				</tr>
				<tr>
					<td colspan="4" id="btntd">
						<button type="button" onclick="retry()">목록</button>
						<button type="button" onclick="check()">변경</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>