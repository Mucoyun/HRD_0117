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
		#signIn_table tr{
			height: 50px;
		}#signIn_table th{
			width: 50px;
			padding-bottom: 20px;
		}#signIn_table td{
			width: 450px;
			padding-bottom: 20px;
		}
		
		#signIn_table p{
			width: 50px;
			height: 50px;
			line-height: 50px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 10px;
		}#signIn_table input{
			height: 50px;
			width: 440px;
			background-color: white;
			color: navy;
			font-weight: bold;
			font-size: 15px;
		}#signIn_table button{
			height: 50px;
			width: 500px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#signIn_table #btntd {
			text-align: center;
		}
	</style>
	<script>
		function login() {
			var id = document.signIn_form.userName;
			var pw = document.signIn_form.Password;
			var nn = document.signIn_form.nickName;
			
			//console.log("id : ",id.value);
			//console.log("pw : ",pw.value);
			
			if(id.value == ""){
				alert("아이디를 입력하세요.");
				id.focus();
			}else if(pw.value == ""){
				alert("패스워드를 입력하세요.");
				pw.focus();
			}else if(nn.value == ""){
				alert("별명을 입력하세요.");
				nn.focus();
			}else{
				document.signIn_form.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	
	<section>
		<h2>Sign In</h2>
		<form name="signIn_form" method="post" action="signIn_process.jsp">
			<table id="signIn_table">
				<tr>
					<th><p>아이디</p></th>
					<td><input type="text" name="userName" placeholder=" Username"></td>
				</tr>
				<tr>
					<th><p>비밀번호</p></th>
					<td><input type="password" name="Password" placeholder=" Password"></td>
				</tr>
				<tr>
					<th><p>닉네임</p></th>
					<td><input type="text" name="nickName" placeholder=" Nickname"></td>
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