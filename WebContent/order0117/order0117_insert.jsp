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
			var form = document.o_i_form;
			
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
				form.action = "order0117_insert_process.jsp"
				form.submit();	
			}
		}
		function retry() {
			location.href = "/HRD_0117/index.jsp"
		}
		
		function codeselect() {
			document.o_i_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String orderDate = request.getParameter("orderDate");
		String orderName = request.getParameter("orderName");
		String productId = request.getParameter("productId");
		String orderQty = request.getParameter("orderQty");
		String orderAddress = request.getParameter("orderAddress");
		String name = "";
		String unitprice = "0";
		
		int unitslnstock = 0;
		
		try{
			String sql = "select p.name,p.unitprice,p.unitslnstock from product0117 p where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				name=rs.getString(1);
				unitprice=rs.getString(2);
				unitslnstock=rs.getInt(3);
			}else if(productId==null||productId.equals("")){
				productId = "";
			}else{
				productId = "";
				%><script>
					alert("등록되지 않은 코드입니다.");
					codeselect();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(orderDate==null){orderDate="2022-01-01";}
		if(orderName==null){orderName="";}
		if(productId==null){productId="";}
		if(orderQty==null){orderQty="0";}
		if(orderAddress==null){orderAddress="";}
		
		
		int Unitprice = Integer.parseInt(unitprice); //단가		
		int OrderQty = Integer.parseInt(orderQty); //주문수량
		
		if(OrderQty>0 && productId.equals("")){
			productId = "";
			OrderQty = 0;
			%><script>
				alert("상품코드를 입력하세요.");
				codeselect();
			</script><%
		}else if(OrderQty<0){
			OrderQty = 0;
		}else if(OrderQty>unitslnstock){
			OrderQty = unitslnstock;
			%><script>
				alert("등록된 재고수를 초과했습니다.");
				codeselect();
			</script><%
		}	
		int orderUnitprice = Unitprice*OrderQty ; //주문금액
	%>
	<section>
		<h2>주문 정보 등록 화면</h2><hr>
		<form name="o_i_form" method="post" action="order0117_insert.jsp">
			<table id="o_iu_table">
				<tr>
					<th>주문일자</th>
					<td><input type="date" name="orderDate" value="<%=orderDate%>"></td>
					<th>주문자이름</th>
					<td><input type="text" name="orderName" value="<%=orderName%>"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId" value="<%=productId%>" onchange="codeselect()"></td>
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
						<button type="button" onclick="check()">저장</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>