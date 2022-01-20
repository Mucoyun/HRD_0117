<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		#m_iu_table #mail2{
			background-color: lightgray;
		}table{
			border: 3px solid black;
			margin: 0 auto;
		}tr,td,th{
			border: 1px solid black;
		}
	</style>
	<script>
		function check() {
			var form = document.m_i_form;
			
			if(form.id.value==""){
				alert("아이디를 입력하세요.");
				form.id.focus();
			}else if(form.name.value==""){
				alert("이름을 입력하세요.");
				form.name.focus();
			}else if(form.password.value==""){
				alert("비밀번호를 입력하세요.");
				form.password.focus();
			}else if(form.repassword.value==""){
				alert("확인 비밀번호를 입력하세요.");
				form.repassword.focus();
			}else if(form.password.value!=form.repassword.value){
				alert("확인 비밀번호가 일치하지 않습니다.");
				form.repassword.focus();
			}else{
				form.submit();	
			}
		}
		function retry() {
			location.href = "/HRD_0117/index.jsp"
		}
		function selectmail() {
			var mail2 = document.m_i_form.mail2;
			var mail3 = document.m_i_form.mail3;
			
			if(mail3.value=="self"){
				//alert("self");
				mail2.style.background = "white";
				mail2.readOnly = false;
				mail2.value = "";
			}else{
				//alert("none");
				mail2.style.background = "lightgray";
				mail2.readOnly = true;
				mail2.value = "";
			}
			
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int id = 0;
		try{
			String sql = "select max(id) from member0117";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getInt(1);
				id++;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 가입 등록 화면</h2><hr>
		<form name="m_i_form" method="post" action="member0117_insert_process.jsp">
			<table id="m_iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>(마지막번호+1)</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repassword"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남성" checked> 남성
						<input type="radio" name="gender" value="여성"> 여성
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
						<input type="number" name="birth1" value="2022" maxlength="4"> 년
						<select name="birth2">
							<option value="01" selected>1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> 월
						<select name="birth3">
							<option value="01" selected>1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input class="mail" type="text" name="mail1">
						<span>@</span>
						<input id="mail2" class="mail"  type="text" name="mail2" readonly>
						<select name="mail3" onchange="selectmail()">
							<option value="" selected>선택하세요</option>
							<option value="self">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="check()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>