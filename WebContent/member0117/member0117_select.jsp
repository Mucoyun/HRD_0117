<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		#m_s_table tr{
			height: 20px;
		}#m_s_table{
			text-align: center;
		}#m_s_table a{
			text-decoration: none;
			color: blue;
			font-weight: bold;
		}#m_s_table a:HOVER {
			color: red;
			font-weight: bold;
		}table{
			border: 3px solid black;
			margin: 0 auto;
		}tr,td,th{
			border: 1px solid black;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no=0;
		try{
			String sql = "select count(*) from member0117";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}else{
				%><script>
					alert("no search id");
					history.back(-1);
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 목록 조회 화면</h2>
		<p>총 <%=no %>명의 회원이 있습니다.</p>
		<hr>
		<table id="m_s_table">
			<tr>
				<th width="100">아이디</th>
				<th width="100">성명</th>
				<th width="100">비밀번호</th>
				<th width="50">성별</th>
				<th width="150">생년월일</th>
				<th width="200">이메일</th>
				<th width="200">연락처</th>
				<th width="200">주소</th>
				<th width="150">입력일</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				String sql = "select id,name,password,gender,birth,mail,phone,address,to_char(timestamp,'yyyy-mm-dd') from member0117 order by id asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String id = rs.getString(1);
					String name = rs.getString(2);
					String password = rs.getString(3);
					String gender = rs.getString(4);
					String birth = rs.getString(5);
					String mail = rs.getString(6);
					String phone = rs.getString(7);
					String address = rs.getString(8);
					String timestamp = rs.getString(9);
					%>
					<tr>
						<td><%=id %></td>
						<td><%=name %></td>
						<td><%=password %></td>
						<td><%=gender %></td>
						<td><%=birth %></td>
						<td><%=mail %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=timestamp %></td>
						<td>
							<a href="/HRD_0117/member0117/member0117_update.jsp?send_id=<%=id%>">수정</a>
							<span> | </span>
							<a href="/HRD_0117/member0117/member0117_delete.jsp?send_id=<%=id%>"
							onclick="if(!confirm('정말로 삭제하시겠습니까?')){
								return false;
							}">삭제</a>
						</td>
					</tr>
					<%
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>