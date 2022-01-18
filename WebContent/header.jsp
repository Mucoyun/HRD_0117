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
		}
		
		header{
			width: 100%; height: 15%;
			color: black; background-color: lightgray;
			text-align: center; display: table;
		}header h1{
			display: table-cell;
			vertical-align: middle;
			font-weight: bold;
			font-size: 2em;
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
			padding: 0 2.5%;
		}nav ul li:FIRST-CHILD{
			padding-right:10%; 
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
		table{
			border: 3px solid black;
			margin: 0 auto;
		}tr,td,th{
			border: 1px solid black;
		}
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
</head>
<body>
	<header>
		<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
	</header>
</body>
</html>