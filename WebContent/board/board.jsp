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
			border-top: 3px solid navy;
			border-collapse: collapse;
		}
		#board_table tr{
			height: 30px;
		}
		#board_table th{
			border-top: 1px solid navy;
			border-bottom: 1px solid navy;
			background-color: #F0F0F0;
		}#fth{
			border-left: 1px solid navy;
		}#lth{
			border-right: 1px solid navy;
		}
		#board_table #btntd {
			text-align: center;
		}#board_table button{
			width: 100px;
			height: 30px;
		}#last_tr #btntd{
			border-top: 2px solid navy;
			padding-top: 10px;
		}#board_table a:HOVER{
			color: red;
		}
	</style>
	<script>
		function drawBoard() {
			location.href = "board_insert.jsp";
		}
		
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/logcheck.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	
	<%
		int no = 0;
		try{
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%>
				<script>
					history.back(-1);
				</script>
				<%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>게시판</h2>
		<table id="board_table">
			<tr id="zero_tr">
				<td colspan="5">
					<p>총 게시물 : <%=no %> 개</p>
				</td>
			</tr>
			<tr id="first_tr">
				<th id="fth" width="100">번호</th>
				<th width="500">제목</th>
				<th width="100">작성자</th>
				<th width="200">작성일</th>
				<th id="lth" width="100">조회수</th>
			</tr>
			<%
				try{
					String sql = "select num,title,name,to_char(time,'yyyy-mm-dd'),hit from board order by num desc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String num = rs.getString(1);
						String title = rs.getString(2);
						String name = rs.getString(3);
						String times = rs.getString(4);
						String hit = rs.getString(5);
						%>
							<tr>
								<td align="center"><%=num %></td>
								<td align="left"><a href="/HRD_0117/board/board_open.jsp?send_num=<%=num%>"><%=title %></a></td>
								<td align="center"><%=name %></td>
								<td align="center"><%=times %></td>
								<td align="center"><%=hit %></td>
							</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
			<tr id="last_tr">
				<td colspan="5" id="btntd">
					<button type="button" onclick="drawBoard()">글쓰기</button>
					<button type="button" onclick="hitup('false')">확인</button>
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>