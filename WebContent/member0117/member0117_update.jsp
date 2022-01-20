<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 -실습19- 0117</title>
	<style>
		#m_iu_table #mail2{
			background-color: white;
		}
	</style>
	<script>
		function check() {
			var form = document.m_u_form;
			
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
			history.back(-1);
		}
		function selectmail() {
			var mail2 = document.m_u_form.mail2;
			var mail3 = document.m_u_form.mail3;
			
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
		String send_id = request.getParameter("send_id");
		String id = "";
		String name = "";
		String password = "";
		String gender = "";
		
		
		String birth = "";
		String[] birth_idx;
		int birth1 = 0;
		String birth2 = "";
		String birth3 = "";
		
		
		String mail = "";
		String[] mail_idx;
		String mail1 = "";
		String mail2 = "";
		String mail3 = "";
		
		String phone = "";
		
		String address = "";
		System.out.println(send_id);
		try{
			String sql = "select id,name,password,gender,birth,mail,phone,address from member0117 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				name = rs.getString(2);
				password = rs.getString(3);
				gender = rs.getString(4);
				birth = rs.getString(5);
				mail = rs.getString(6);
				phone = rs.getString(7);
				address = rs.getString(8);
				
				birth_idx = birth.split("/");
				birth1 = Integer.parseInt(birth_idx[0]);
				birth2 = birth_idx[1];
				birth3 = birth_idx[2];
				
				mail_idx = mail.split("@");
				mail1 = mail_idx[0];
				mail2 = mail_idx[1];
				if(!mail2.equals("")){
					mail3="self";
				}
				
				System.out.println(birth1+"-"+birth2+"-"+birth3);
				System.out.println(mail1+"@"+mail2+"-"+mail3);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 정보 변경 화면</h2><hr>
		<form name="m_u_form" method="post" action="member0117_update_process.jsp">
			<table id="m_iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" value="<%=name %>" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" value="<%=password %>" ></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repassword" value="<%=password %>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남성" <%if(gender.equals("남성")){%> checked <%} %>> 남성
						<input type="radio" name="gender" value="여성" <%if(gender.equals("여성")){%> checked <%} %>> 여성
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td>
						<input type="number" name="birth1" value="<%=birth1 %>" maxlength="4"> 년
						<select name="birth2">
							<option value="01" <%if(birth2.equals("01")){%> selected <%} %>>1</option>
							<option value="02" <%if(birth2.equals("02")){%> selected <%} %>>2</option>
							<option value="03" <%if(birth2.equals("03")){%> selected <%} %>>3</option>
							<option value="04" <%if(birth2.equals("04")){%> selected <%} %>>4</option>
							<option value="05" <%if(birth2.equals("05")){%> selected <%} %>>5</option>
							<option value="06" <%if(birth2.equals("06")){%> selected <%} %>>6</option>
							<option value="07" <%if(birth2.equals("07")){%> selected <%} %>>7</option>
							<option value="08" <%if(birth2.equals("08")){%> selected <%} %>>8</option>
							<option value="09" <%if(birth2.equals("09")){%> selected <%} %>>9</option>
							<option value="10" <%if(birth2.equals("10")){%> selected <%} %>>10</option>
							<option value="11" <%if(birth2.equals("11")){%> selected <%} %>>11</option>
							<option value="12" <%if(birth2.equals("12")){%> selected <%} %>>12</option>
						</select> 월
						<select name="birth3">
							<option value="01" <%if(birth3.equals("01")){%> selected <%} %>>1</option>
							<option value="02" <%if(birth3.equals("02")){%> selected <%} %>>2</option>
							<option value="03" <%if(birth3.equals("03")){%> selected <%} %>>3</option>
							<option value="04" <%if(birth3.equals("04")){%> selected <%} %>>4</option>
							<option value="05" <%if(birth3.equals("05")){%> selected <%} %>>5</option>
							<option value="06" <%if(birth3.equals("06")){%> selected <%} %>>6</option>
							<option value="07" <%if(birth3.equals("07")){%> selected <%} %>>7</option>
							<option value="08" <%if(birth3.equals("08")){%> selected <%} %>>8</option>
							<option value="09" <%if(birth3.equals("09")){%> selected <%} %>>9</option>
							<option value="10" <%if(birth3.equals("10")){%> selected <%} %>>10</option>
							<option value="11" <%if(birth3.equals("11")){%> selected <%} %>>11</option>
							<option value="12" <%if(birth3.equals("12")){%> selected <%} %>>12</option>
							<option value="13" <%if(birth3.equals("13")){%> selected <%} %>>13</option>
							<option value="14" <%if(birth3.equals("14")){%> selected <%} %>>14</option>
							<option value="15" <%if(birth3.equals("15")){%> selected <%} %>>15</option>
							<option value="16" <%if(birth3.equals("16")){%> selected <%} %>>16</option>
							<option value="17" <%if(birth3.equals("17")){%> selected <%} %>>17</option>
							<option value="18" <%if(birth3.equals("18")){%> selected <%} %>>18</option>
							<option value="19" <%if(birth3.equals("19")){%> selected <%} %>>19</option>
							<option value="20" <%if(birth3.equals("20")){%> selected <%} %>>20</option>
							<option value="21" <%if(birth3.equals("21")){%> selected <%} %>>21</option>
							<option value="22" <%if(birth3.equals("22")){%> selected <%} %>>22</option>
							<option value="23" <%if(birth3.equals("23")){%> selected <%} %>>23</option>
							<option value="24" <%if(birth3.equals("24")){%> selected <%} %>>24</option>
							<option value="25" <%if(birth3.equals("25")){%> selected <%} %>>25</option>
							<option value="26" <%if(birth3.equals("26")){%> selected <%} %>>26</option>
							<option value="27" <%if(birth3.equals("27")){%> selected <%} %>>27</option>
							<option value="28" <%if(birth3.equals("28")){%> selected <%} %>>28</option>
							<option value="29" <%if(birth3.equals("29")){%> selected <%} %>>29</option>
							<option value="30" <%if(birth3.equals("30")){%> selected <%} %>>30</option>
							<option value="31" <%if(birth3.equals("31")){%> selected <%} %>>31</option>
						</select> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input class="mail" type="text" name="mail1" value="<%=mail1 %>" >
						<span>@</span>
						<input id="mail2" class="mail"  type="text" name="mail2" value="<%=mail2 %>" readonly>
						<select name="mail3" onchange="selectmail()">
							<option value="" <%if(mail3.equals("")){%> selected <%} %>>선택하세요</option>
							<option value="self" <%if(mail3.equals("self")){%> selected <%} %>>직접입력</option>
							<option value="naver.com" <%if(mail3.equals("naver.com")){%> selected <%} %>>naver.com</option>
							<option value="gmail.com" <%if(mail3.equals("gmail.com")){%> selected <%} %>>gmail.com</option>
							<option value="nate.com" <%if(mail3.equals("nate.com")){%> selected <%} %>>nate.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="<%=phone %>" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address %>" ></td>
				</tr>
				<tr>
					<td colspan="2" id="btntd">
						<button type="button" onclick="check()">수정</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>