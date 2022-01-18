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
		#signList_table tr{
			height: 30px;
		}#signList_table p{
			width: 200px;
			height: 30px;
			line-height: 30px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#signList_table th:FIRST-CHILD p{
			width: 50px !important;
		}#signList_table #send p{
			width: 100px !important;
		}#signList_table td{
			text-align: center;
			background-color: white;
			color: navy;
			font-weight: bold;
			font-size: 15px;
		}
		#signList_table #btntd{
			text-align: center;
			padding-top: 20px;
			text-align: center;
			background-color: lightgray !important;
		}#signList_table #btntd button{
			width: 200px;
			height: 30px;
			background-color: navy;
			color: white;
			font-weight: bold;
			font-size: 20px;
		}#signList_table a,#signList_table span{
			text-decoration: none;
			color: navy;
			font-weight: bold;
			font-size: 15px;
		}#signList_table a:HOVER{
			color: red;
			font-weight: bold;
			font-size: 15px;
		}
	</style>
	<script>
		function signin() {
			location.href = "/HRD_0117/signIn.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="DBConn.jsp" %>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<h2>Sign List</h2>
		<table id="signList_table">
			<tr>
				<th width="50"><p>No</p></th>
				<th width="200"><p>ID</p></th>
				<th width="200"><p>PW</p></th>
				<th width="200"><p>NickName</p></th>
				<th width="100" id="send"><p>구분</p></th>
			</tr>
			<%
			int no=0;
			try{
				String sql = "select username,password,nickname from member0118";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String Username = rs.getString(1);
					String Password = rs.getString(2);
					String Nickname = rs.getString(3);
					%>
					<tr>
						<td><%=no%></td>
						<td><%=Username%></td>
						<td><%=Password%></td>
						<td><%=Nickname%></td>
						<td>
							<a href="/HRD_0117/login/signUpdate.jsp?send_Username=<%=Username%>">수정</a> 
							<span> | </span>
							<a href="/HRD_0117/login/signDelete.jsp?send_Username=<%=Username%>">삭제</a>
						</td>
					</tr>
					<%
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
			<tr>
				<td colspan="5" id="btntd">
					<button type="button" onclick="signin()">SIGN IN</button>
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>