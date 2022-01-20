<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		*{
			margin:0; padding: 0; 
		}html, body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;;
		}
		
		header{
			width: 100%; height: 15%;
			color: black; background-color: lightgray;
			text-align: center; display: table;
		}header h1{
			display: table-cell;
			vertical-align: middle;
			font-weight: bold;
			font-size: 1ph;
		}header div{
			display: table-cell;
			vertical-align: middle;
		}header div span{
			color: white;
			font-weight: bold;
			font-size: 20px;
			width: 15%;
			height: 40%;
		}header div input{
			width: 20%;
			height: 40%;
		}header div a{
			color: blue;
			width: 20%;
		}header div button{
			width: 10%;
			height: 40%;
		}
		
		nav{
			width: 100%; height: 5%;
			color: white; background-color: black;
			text-align: center; display: table;
		}nav ul{
			display: table-cell;
			vertical-align: middle;
			list-style: none;
		}nav ul li{
			display: inline-block;
			padding: 0 1%;
		}nav ul li:FIRST-CHILD{
			padding-right:5%; 
		}nav ul li a{
			text-decoration: none;
			color: white;
			font-weight: bold;
		}nav ul li a:HOVER {
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 100%; height: 75%;
			color: black; background-color: white;
		}section img{
			display: block;
			margin: 0 auto;
			width: 90%;
			height: 95%;
			padding-top: 1.5%;
		}section h2{
			text-align: center;
			padding: 20px 0;
		}section p{
			padding-left: 10%;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
		}footer h3{
			display: table-cell;
			vertical-align: middle;
		}
		
	</style>
	<style>
		#m_iu_table tr{
			height: 30px;
		}#m_iu_table th{
			width: 200px;
		}#m_iu_table td{
			width: 650px;
		}
		#m_iu_table input[type="text"]{
			width: 450px;
			height: 25px;
		}#m_iu_table input[type="password"]{
			width: 450px;
			height: 25px;
		}#m_iu_table input[type="radio"]{
			padding: 0 10px;
		}#m_iu_table input[type="number"]{
			width: 100px;
			height: 25px;
		}#m_iu_table select{
			width: 100px;
			height: 25px;
		}#m_iu_table .mail{
			width: 250px !important;
			height: 25px !important;
		}
		#m_iu_table #btntd{
			text-align: center;
			height: 40px;
		}#m_iu_table #btntd button{
			width: 200px;
			height: 25px; 
		}
	</style>
	<script>
		function login() {
			var form = document.login_form;
			
			if(form.username.value==""){
				alert("아이디를 입력하세요.");
				form.username.focus();
			}else if(form.Passwd.value==""){
				alert("비밀번호를 입력하세요.");
				form.Passwd.focus();
			}else{
				form.action = "/HRD_0117/login_process.jsp";
				form.submit();	
			}
		}
		function retry() {
			location.href = "/HRD_0117/index.jsp"
		}
	</script>
</head>
<body>
	<%@ page session="true" %>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%
		Date time = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	%>	
	<header>
	<%
		String s_id = "";
		String s_pw = "";
		String s_nn = "";
		s_id = (String)session.getAttribute("s_id");
		s_pw = (String)session.getAttribute("s_pw");
		s_nn = (String)session.getAttribute("s_nn");
		System.out.print("s_id :"+s_id+"  ");
		System.out.print("s_pw :"+s_pw+"  ");
		System.out.println("s_nn :"+s_nn);
	%>
		<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
		<div id="headerlog">
		<%
			if(s_nn==null){
				%>
					<form name="login_form" method="post" action="#">
						<span>회원ID</span>
						<input type="text" name="username">
						<span>비밀번호</span>
						<input type="password" name="Passwd">
						<button type="button" onclick="login()">로그인</button>
						<a href="#">회원가입</a>
					</form>
				<%
			}else{
				session.setMaxInactiveInterval(60*30);
				%>
					<span><%=s_nn %>님 환영합니다.</span>
					<button type='button' 
					onclick="location.href='/HRD_0117/logout.jsp'">로그아웃</button>
					<a href='/HRD_0117/member0117/member0117_insert.jsp'>회원가입</a>
				<%
			}
		%>
		</div>
	</header>
</body>
</html>