<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		h2{
			color: navy;
			font-weight: bold;
		}	
		table{
			margin: 0 auto;
			/* border: 3px solid black; */
		}tr,th,td{
			/* border: 1px solid black; */
		}
		#signUp_table tr{
			height: 50px;
		}#signUp_table th{
			width: 50px;
			padding-bottom: 20px;
		}#signUp_table td{
			width: 450px;
			padding-bottom: 20px;
		}
		
		#signUp_table p{
			width: 50px;
			height: 50px;
			line-height: 50px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#signUp_table input{
			height: 50px;
			width: 440px;
			background-color: white;
			color: navy;
			font-weight: bold;
			font-size: 15px;
		}#signUp_table button{
			height: 50px;
			width: 500px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#signUp_table #btntd {
			text-align: center;
		}
	</style>
	<script>
		function login() {
			var id = document.signUp_form.userName;
			var pw = document.signUp_form.Password;
			
			console.log("id : ",id.value);
			console.log("pw : ",pw.value);
			
			if(id.value == ""){
				alert("아이디를 입력하세요.");
				id.focus();
			}else if(pw.value == ""){
				alert("패스워드를 입력하세요.");
				pw.focus();
			}else{
				document.signUp_form.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="DBConn.jsp" %>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<%
		
	%>
	<section>
		<h2>Sign In</h2>
		<form name="signUp_form" method="post" action="signUp_process.jsp">
			<table id="signUp_table">
				<tr>
					<th><p>ID</p></th>
					<td><input type="text" name="userName" value="<%= %>" readonly></td>
				</tr>
				<tr>
					<th><p>PW</p></th>
					<td><input type="password" name="Password"  value="<%= %>"></td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="login()">SIGN IN</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>