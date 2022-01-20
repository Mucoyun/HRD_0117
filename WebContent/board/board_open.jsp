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
			
		
		#board_table #coment{
			height: 40px;
			width: 600px;
		}#board_table #coment input{
			height: 20px;
			width: 500px;
			margin-left: 20px;
			margin-bottom: 5px;
		}#board_table #coment button{
			height: 35px;
			width: 50px;
		}
		#board_table .conent{
			border-left: 1px solid black;
		}
		
		
		#board_table #lasttr th,#board_table #lasttr td{
			border-bottom: 1px solid black;
		}
		#board_table .conform{
			width: 100px;
			-webkit-appearance: none;
       			-moz-appearance: none;
           			 appearance: none;
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
		function incomment() {
			if(document.comment.coment.value==""){
				alert("댓글을 입력하세요.");
				document.comment.coment.focus();
			}else{
				document.comment.submit();
			}
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%@ include file="/logcheck.jsp" %>
	<%
		String send_num = request.getParameter("send_num");
	
		int num = 0;
		String name = "";
		String password = "";
		String title = "";
		String memo = "";
		String times = "";
		int hit = 0;
		int ref = 0;
		int indent = 0;
		int step = 0;
		
		try{
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1);
				name = rs.getString(2);
				password = rs.getString(3);
				title = rs.getString(4);
				memo = rs.getString(5);
				times = rs.getString(6);
				hit= rs.getInt(7);
				ref= rs.getInt(8);
				indent= rs.getInt(9);
				step= rs.getInt(10);
			}else{
				%><script>
					alert("이미 로그인 되어 있습니다.");
					history.back(-1);
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2><%=title %></h2>
		<form name="comment" method="post" action="comment_process.jsp">
			<table id="board_table">
				<tr>
					<th><p>번호</p></th>
					<td colspan="7"><input class="conform" type="text" name="num" value="<%=num %>" readonly></td>
					<th class="conent"><p>댓글</p></th>
				</tr>
				<tr>
					<th><p>작성자</p></th>
					<td colspan="7"><%=name %></td>
					<td rowspan="2" id="coment" class="conent">
						<input  type="text" name="coment">
						<button type="button" onclick="incomment()">입력</button>
					</td>
				</tr>
				<tr>
					<th class="datas"><p>HIT</p></th>
					<td class="datas"><%=hit %></td>
					<th class="datas"><p>REF</p></th>
					<td class="datas"><%=ref %></td>
					<th class="datas"><p>INDENT</p></th>
					<td class="datas"><%=indent %></td>
					<th class="datas"><p>STEP</p></th>
					<td class="datas"><%=step %></td>
				</tr>
				<tr id="lasttr">
					<th class="memotd"><p>내용</p></th>
					<td colspan="7" class="memotd"><%=memo %></td>
					<td class="conent">
					<%
						String sql="select * from board_Comment where num=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, num);
						rs = pstmt.executeQuery();
						while(rs.next()){
							//여긷부터
						}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="8" id="btntd">
						<button type="button" onclick="history.back(-1);">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>