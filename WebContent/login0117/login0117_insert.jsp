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
		#l_i_table tr{
			height: 30px;
		}#l_i_table th{
			width: 100px;
		}#l_i_table td{
			width: 400px;
		}
		#l_i_table input[type="text"]{
			width: 350px;
			height: 25px;
		}#l_i_table input[type="password"]{
			width: 350px;
			height: 25px;
		}
		#l_i_table #btntd{
			text-align: center;
			height: 40px;
		}#l_i_table #btntd button{
			width: 200px;
			height: 25px; 
		}
	</style>
	<script>
		function check() {
			var form = document.l_i_form;
			
			if(form.id.value==""){
				alert("아이디를 입력하세요.");
				form.id.focus();
			}else if(form.password.value==""){
				alert("비밀번호를 입력하세요.");
				form.password.focus();
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
		<h2>로 그 인</h2><hr>
		<form name="l_i_form" method="post" action="login0117_insert_process.jsp">
			<table id="l_i_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="check()">로그인</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>