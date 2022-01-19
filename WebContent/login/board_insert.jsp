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
			/* border: 3px solid black; */
		}tr,th,td{
			/* border: 1px solid black; */
		}
		#board_table tr{
			height: 50px;
		}#board_table th{
			width: 50px;
		}#board_table p{
			line-height: 50px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 12px;
		}#board_table input{
			background-color: white;
			color: navy;
			font-weight: bold;
			font-size: 15px;
		}
		#board_table #nametd, #board_table #nametd input{
			width: 100px;
			height: 50px;
		}#board_table #titletd, #board_table #titletd input{
			width: 400px;
			height: 50px;
		}#board_table #memotd{
			width: 610px;
			height: 100px;
		} 
		#board_table #memotd input{
			width: 610px;
			height: 100px;
		}
			
		
		
		
		#board_table button{
			height: 50px;
			width: 500px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#board_table #btntd {
			text-align: center;
		}
	</style>
	<script>
		function upload() {
			if(document.board_form.name.value==""){
				alert("작성자를 입력하세요.");
				document.board_form.name.focus();
			}else if(document.board_form.title.value==""){
				alert("타이틀을 입력하세요.");
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
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<h2>게시판 글쓰기</h2>
		<form name="board_form" method="post" action="board_process.jsp">
			<table id="board_table">
				<tr>
					<th><p>작성자</p></th>
					<td id="nametd"><input type="text" name="name"></td>
					<th><p>제목</p></th>
					<td id="titletd"><input type="text" name="title"></td>
				</tr>
				<tr>
					<th id="memoth" colspan="4"><p>내용</p></th>
				</tr>
				<tr>
					<td colspan="4" id="memotd"><input type="text" name="memo" maxlength="50"></td>
				</tr>
				<tr>
					<td colspan="4" id="btntd">
						<button type="button" onclick="upload()">업로드</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>