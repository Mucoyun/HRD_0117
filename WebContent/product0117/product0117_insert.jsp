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
		#p_iu_table tr{
			height: 30px;
		}#p_iu_table th{
			width: 200px;
		}#p_iu_table td{
			width: 650px;
		}
		#p_iu_table input[type="text"]{
			width: 450px;
			height: 25px;
		}#p_iu_table input[type="password"]{
			width: 450px;
			height: 25px;
		}#p_iu_table input[type="radio"]{
			padding: 0 10px;
		}#p_iu_table input[type="number"]{
			width: 100px;
			height: 25px;
		}#p_iu_table select{
			width: 100px;
			height: 25px;
		}#p_iu_table .mail{
			width: 250px !important;
			height: 25px !important;
		}
		#p_iu_table #btntd{
			text-align: center;
			height: 40px;
		}#p_iu_table #btntd button{
			width: 200px;
			height: 25px; 
		}
	</style>
	<script>
		function check() {
			var form = document.p_i_form;
			
			if(form.productId.value==""){
				alert("상품코드를 입력하세요.");
				form.productId.focus();
			}else if(form.name.value==""){
				alert("상품명을 입력하세요.");
				form.name.focus();
			}else if(form.name.value.length<4 && form.name.value.length>50){
				alert("[상품명]\n 최소 4자에서 최대 50자까지 입력하세요.");
				form.name.focus();
			}else if(form.unitprice.value==""){
				alert("가격을 입력하세요.");
				form.unitprice.focus();
			}else if(isNaN(form.unitprice.value)){
				alert("[가격]\n 숫자만 입력하세요.");
				form.unitprice.focus();
			}else if(form.unitprice.value<0){
				alert("[가격]\n 음수로 입력할수없습니다.");
				form.unitprice.focus();
			}else{
				form.submit();	
			}
		}
		function retry() {
			location.href = "/HRD_0117/index.jsp"
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>상품 정보 등록 화면</h2><hr>
		<form name="p_i_form" method="post" action="product0117_insert_process.jsp">
			<table id="p_iu_table">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="unitprice"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="category"></td>
				</tr>
				<tr>
					<th>분 류</th>
					<td><input type="text" name="manufacurer"></td>
				</tr>
				<tr>
					<th>재고수</th>
					<td><input type="text" name="unitslnstock"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<input type="radio" name="condition" value="신규제품" checked> 신규제품
						<input type="radio" name="condition" value="중고제품"> 중고제품
						<input type="radio" name="condition" value="재생제품"> 재생제품
					</td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="check()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>