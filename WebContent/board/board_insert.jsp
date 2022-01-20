<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		section{
			background-color: white !important;
		}
		h2{
			color: navy;
			font-weight: bold;
		}	
		table{
			margin: 0 auto;
			border-collapse: collapse;
		}tr,th,td{
		}
		#board_table tr{
			height: 20px;
			
		}#board_table th{
			border-top: 1px solid black;
			width: 100px;
		}#board_table td{
			border-top: 1px solid black;
		}#board_table p{
			line-height: 20px;
			font-weight: bold;
			font-size: 12px;
		}#board_table input{
			font-weight: bold;
			font-size: 15px;
			width: 600px;
			height: 20px;
		}
		#board_table .memotd{
			height: 200px;
		}#board_table .memotd input{
			height: 200px;
		}#board_table .memotd th{
			height: 200px;
		}#board_table .memotd p{
			height: 200px;
			line-height: 200px;
		}
			
		
		
		
		#board_table button{
			height: 30px;
			width: 150px;
			font-weight: bold;
			background-color: black;
			color: white;
			font-size: 20px;
		}#board_table #btntd {
			text-align: center;
			width: 600px;
			height: 40px;
		}
	</style>
	<script>
		function upload() {
			if(document.board_form.title.value==""){
				alert("제목을 입력하세요.");
				document.board_form.title.focus();
			}else if(document.board_form.memo.value==""){
				alert("내용을 입력하세요.");
				document.board_form.memo.focus();
			}else{
				document.board_form.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%@ include file="/logcheck.jsp" %>
	<section>
		<h2>게시판 글쓰기</h2>
		<form name="board_form" method="post" action="board_process.jsp">
			<table id="board_table">
				<tr>
					<th><p>제목</p></th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th><p>작성자</p></th>
					<td><input type="text" name="name" value="<%=s_id%>" readonly></td>
				</tr>
				<tr>
					<th><p>패스워드</p></th>
					<td><input type="password" name="password" value="<%=s_pw%>" readonly></td>
				</tr>
				<tr>
					<th class="memotd"><p>내용</p></th>
					<td colspan="2" class="memotd"><input type="text" name="memo" maxlength="50"></td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="upload()">등록</button>
						<button type="button" onclick="history.back(-1);">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>