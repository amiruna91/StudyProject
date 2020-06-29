<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>modify</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
 <style type="text/css">
 	th {
 		background-color: #E2E2E2;
 	}
 </style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
 	<div class="body" style="font-size:15px">
 <%
 	UserDao userDao = new UserDao();
 	User user = userDao.getUserById(loginedUserId);
 	
 	AddressDao addressDao = new AddressDao();
 	Address address = addressDao.getAddressHomeByUserId(loginedUserId);
 %>
 	<div style="padding:20px"></div>
 		<h3>MY PROFILE</h3>
 	<div style="padding:20px"></div>
 			<div class="row">
 				<div class="col-1"><img src="../images/userimage/img_member_default.gif" alt="userprofile" style="width:100px;"/></div>
 				<div class="col-11" style="padding: 40px;"><strong>저희 쇼핑몰을 이용해 주셔서 감사합니다. <%=user.getName() %> 님은 [<%=user.getGrade() %>]회원이십니다.</strong></div>
 			</div>
 		<hr />
 		<div class="well">
 			<form id="user-form" method="post" action="update.jsp">
 			<input type="hidden" name="name" value="<%=user.getName() %>" />
 					<div class="row">
 						<div class="col-10"><h5><strong>기본정보</strong></h5></div>
 						<div class="col-2"><img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/> 필수입력사항</div>
 					</div>
 				<table class="table table-bordered">
 					<tbody>
 						<tr>
 							<th class="">아이디 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td><input type="text" name="userid" id="userid" value="<%=user.getId() %>" style="width:150px; height:30px; font-size:12px;" readonly /> (영문소문자/숫자,4~16자)</td>
 						</tr>
 						<tr>
 							<th>비밀번호 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td>
 								<input type="password" name="pwd" onkeyup="valueCheckPassword()" id="pwd" style="width:150px; height:30px; font-size:12px;"/> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
 								<p id="pwdmessage"></p>
 							</td>
 						</tr>
 						<tr>
 							<th>비밀번호 확인 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td>
	 							<input type="password" name="pwdcheck" id="pwdcheck" onkeyup="valueCheckPasswordDuplicate()" style="width:150px; height:30px; font-size:12px;"/>
	 							<p id="pwdcheckmessage"></p>
 							</td>
 						</tr>
 						<tr>
 							<th>이름 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td><input type="text" name="username" id="username" value=<%=user.getName() %> style="width:150px; height:30px; font-size:12px;" readonly /></td>
 						</tr>
 						<tr>
 							<th>주소 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td>
 								<input type="text" id="sample4_postcode" name="postcode" value="<%=address.getPostalCode() %>" style="width: 100px;" readonly>
 								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
 								<input type="text" id="sample4_roadAddress" name="mainaddress" value="<%=address.getMain() %>" style="width: 300px;" readonly> 기본주소<br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="subaddress" value="<%=address.getSub() %>" style="width: 300px;"> 나머지주소
 							</td>
 						</tr>
 						<tr>
 							<th>일반전화</th>
 					<%
		 				String tel = user.getTelephone();
 						String[] telNum = {"", "", ""};
 						if (tel != null) {
			 				telNum = tel.split("-");
 						}
 					%>
 							<td><select name="tel1">
 									<option value="no" <%=tel == null ? "selected" : "" %>>선택</option>
	 								<option value="02" <%="02".equals(telNum[0]) ? "selected" : "" %>>02</option>
	 								<option value="031" <%="031".equals(telNum[0]) ? "selected" : "" %>>031</option>
	 								<option value="032" <%="032".equals(telNum[0]) ? "selected" : "" %>>032</option>
	 								<option value="033" <%="033".equals(telNum[0]) ? "selected" : "" %>>033</option>
	 								<option value="041" <%="041".equals(telNum[0]) ? "selected" : "" %>>041</option>
	 								<option value="042" <%="042".equals(telNum[0]) ? "selected" : "" %>>042</option>
	 								<option value="043" <%="043".equals(telNum[0]) ? "selected" : "" %>>043</option>
	 								<option value="051" <%="051".equals(telNum[0]) ? "selected" : "" %>>051</option>
				 					<option value="052" <%="052".equals(telNum[0]) ? "selected" : "" %>>052</option>
				 					<option value="053" <%="053".equals(telNum[0]) ? "selected" : "" %>>053</option>
				 					<option value="054" <%="054".equals(telNum[0]) ? "selected" : "" %>>054</option>
				 					<option value="055" <%="055".equals(telNum[0]) ? "selected" : "" %>>055</option>
				 					<option value="061" <%="061".equals(telNum[0]) ? "selected" : "" %>>061</option>
				 					<option value="062" <%="062".equals(telNum[0]) ? "selected" : "" %>>062</option>
				 					<option value="063" <%="063".equals(telNum[0]) ? "selected" : "" %>>063</option>
				 					<option value="064" <%="064".equals(telNum[0]) ? "selected" : "" %>>064</option>
				 					<option value="0502" <%="0502".equals(telNum[0]) ? "selected" : "" %>>0502</option>
				 					<option value="0503" <%="0503".equals(telNum[0]) ? "selected" : "" %>>0503</option>
				 					<option value="0504" <%="0504".equals(telNum[0]) ? "selected" : "" %>>0504</option>
				 					<option value="0505" <%="0505".equals(telNum[0]) ? "selected" : "" %>>0505</option>
				 					<option value="0506" <%="0506".equals(telNum[0]) ? "selected" : "" %>>0506</option>
				 					<option value="0507" <%="0507".equals(telNum[0]) ? "selected" : "" %>>0507</option>
				 					<option value="070" <%="070".equals(telNum[0]) ? "selected" : "" %>>070</option>
				 					<option value="010" <%="010".equals(telNum[0]) ? "selected" : "" %>>010</option>
				 					<option value="011" <%="011".equals(telNum[0]) ? "selected" : "" %>>011</option>
				 					<option value="016" <%="016".equals(telNum[0]) ? "selected" : "" %>>016</option>
				 					<option value="017" <%="017".equals(telNum[0]) ? "selected" : "" %>>017</option>
				 					<option value="018" <%="018".equals(telNum[0]) ? "selected" : "" %>>018</option>
				 					<option value="019" <%="019".equals(telNum[0]) ? "selected" : "" %>>019</option>
				 					<option value="0508" <%="0508".equals(telNum[0]) ? "selected" : "" %>>0508</option>
 								</select> -
			 					<input type="text" name="tel2" value="<%=telNum[1] %>" maxlength="4" style="width: 70px; height: 25px;"/> -
			 					<input type="text" name="tel3" value="<%=telNum[2] %>" maxlength="4" style="width: 70px; height: 25px;"/>
			 				</td>
 					</tr>
 					<tr>
 						<th>휴대전화 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 			<%
 				String cell = user.getPhone();
 				String[] cellNum = cell.split("-");
 				String cell1 = cellNum[0];
 				String cell2 = cellNum[1];
 				String cell3 = cellNum[2];
 			%>
 						<td><select name="cell1" id="">
 							<option value="010" <%="010".equals(cell1) ? "selected" : "" %>>010</option>
 							<option value="011" <%="011".equals(cell1) ? "selected" : "" %>>011</option>
 							<option value="016" <%="016".equals(cell1) ? "selected" : "" %>>016</option>
 							<option value="017" <%="017".equals(cell1) ? "selected" : "" %>>017</option>
 							<option value="018" <%="018".equals(cell1) ? "selected" : "" %>>018</option>
 							<option value="019" <%="019".equals(cell1) ? "selected" : "" %>>019</option>
 						</select> -
 						<input type="text" name="cell2" value="<%=cell2 %>" maxlength="4" style="width: 50px; height: 25px;"/> -
 						<input type="text" name="cell3" value="<%=cell3 %>" maxlength="4" style="width: 50px; height: 25px;"/>
 						</td>
 					</tr>
 					<tr>
 						<th>SMS 수신여부 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 						<td>
 							<input type="radio" name="sms" value="Y" <%="Y".equals(user.getSnsCheck()) ? "checked" : "" %>/> 수신함
 							<input type="radio" name="sms" value="N" <%="N".equals(user.getSnsCheck()) ? "checked" : "" %>/> 수신안함
 							<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
 						</td>
 					</tr>
 					<tr>
 						<th>이메일 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 						<td>
	 						<input type="text" name="email" id="email" onkeyup="valueCheckEmail()" value="<%=user.getEmail() %>" style="width:150px; height:30px; font-size:12px;" />
	 						<p id="emailmessage"></p>
 						</td>
 					</tr>
 					</tbody>
 				</table>
				<!-- -------------------------------------------------------------- -->	
 				<h3>추가정보</h3>
 				<div class="form-group">
 					<table class="table table-bordered">
 						<tr>
 							<th>성별 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td>
 								<input type="radio" name="gender" value="M" <%="M".equals(user.getGender()) ? "checked" : "" %> disabled/> 남자
 								<input type="radio" name="gender" value="F" <%="F".equals(user.getGender()) ? "checked" : "" %> disabled/> 여자
 							</td>
 						</tr>
 						<tr>
 							<th>생년월일 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 				<%
 					String birth = user.getBirth();
 					String[] birthday = birth.split("-");
 					String birth1 = birthday[0];
 					String birth2 = birthday[1];
 					String birth3 = birthday[2];
 				%>
 							<td>
 								<input type="text" name="birthyear" id="birthyear" value="<%=birth1 %>" style="width:150px; height:30px; font-size:12px;" /> 년
 								<input type="text" name="birthmonth" id="birthmonth" value="<%=birth2 %>" style="width:150px; height:30px; font-size:12px;" /> 월
 								<input type="text" name="birthday" id="birthday" value="<%=birth3 %>" style="width:150px; height:30px; font-size:12px;" /> 일
 							</td>
 						</tr>
 						<tr>
 							<th>지역 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
 							<td>
 								<select name="location">
 									<option value="">선택</option>
 									<option value="경기" <%="경기".equals(user.getLocation()) ? "selected" : "" %>>경기</option>
 									<option value="서울" <%="서울".equals(user.getLocation()) ? "selected" : "" %>>서울</option>
 									<option value="인천" <%="인천".equals(user.getLocation()) ? "selected" : "" %>>인천</option>
 									<option value="강원" <%="강원".equals(user.getLocation()) ? "selected" : "" %>>강원</option>
 									<option value="충남" <%="충남".equals(user.getLocation()) ? "selected" : "" %>>충남</option>
 									<option value="충북" <%="충북".equals(user.getLocation()) ? "selected" : "" %>>충북</option>
 									<option value="대전" <%="대전".equals(user.getLocation()) ? "selected" : "" %>>대전</option>
 									<option value="경북" <%="경북".equals(user.getLocation()) ? "selected" : "" %>>경북</option>
 									<option value="경남" <%="경남".equals(user.getLocation()) ? "selected" : "" %>>경남</option>
 									<option value="대구" <%="대구".equals(user.getLocation()) ? "selected" : "" %>>대구</option>
 									<option value="부산" <%="부산".equals(user.getLocation()) ? "selected" : "" %>>부산</option>
 									<option value="울산" <%="울산".equals(user.getLocation()) ? "selected" : "" %>>울산</option>
 									<option value="전북" <%="전북".equals(user.getLocation()) ? "selected" : "" %>>전북</option>
 									<option value="전남" <%="전남".equals(user.getLocation()) ? "selected" : "" %>>전남</option>
 									<option value="광주" <%="광주".equals(user.getLocation()) ? "selected" : "" %>>광주</option>
 									<option value="제주" <%="제주".equals(user.getLocation()) ? "selected" : "" %>>제주</option>
 									<option value="해외" <%="해외".equals(user.getLocation()) ? "selected" : "" %>>해외</option>
 								</select>
 							</td>
 						</tr>
 					</table>
 				</div>
 					<div class="text-center">
 						<button class="btn btn-dark btn-lg" type="button" onclick="checkFieldValue()">회원정보수정</button>
 						<a style="background-color: gray; color: white;" href="../home.jsp" class="btn btn-default btn-lg">취소</a>
 					</div>
 					<div class="text-right">
 						<a href="#" id="deleteuser" class="btn btn-light" onclick="deleteuser()">회원탈퇴</a>
 					</div>
 			</form>
 		</div>
 	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function checkFieldValue() {		
	var userid = document.getElementById("userid").value;
	
	if (!userid) {
		alert("아이디를 입력해주세요.");
		document.getElementById("userid").focus();
		return;
	}
	
	var userpwd1 = document.getElementById("pwd").value;
	var userpwd2 = document.getElementById("pwdcheck").value;
	
	if (!userpwd1) {
		alert("비밀번호를 입력해주세요.");
		document.getElementById("pwd").focus();
		return;
	}
	
	if (!userpwd2) {
		alert("비밀번호 확인 여부를 확인해주세요.");
		document.getElementById("pwd").focus();
		return;
	}
	
	var username = document.getElementById("username").value;
	
	if (!username) {
		alert("사용자 이름을 입력해주세요.")
		document.getElementById("username").focus();
		return;
	}
	
	var postalcode = document.getElementById("sample4_postcode").value;
	
	if (!postalcode) {
		alert("주소를 입력해주세요.");
		document.getElementById("sample4_postcode").focus();
		return;
	}
	
	var cell = document.querySelector("input[name=cell2]").value;
	
	if (!cell) {
		alert("전화번호를 입력하세요");
		document.querySelector("input[name=cell2]").focus();
		return;
	}
	
	var email = document.getElementById("email").value;
	
	if (!email) {
		alert("이메일 주소를 입력해주세요.");
		document.getElementById("email").focus();
		return;
	}
	
	var birthYear = document.getElementById("birthyear").value;
	
	if (!birthYear) {
		alert("생년월일을 입력해주세요.");
		document.getElementById("birthyear").focus();
		return;
	}
	
	var birthMonth = document.getElementById("birthmonth").value;
	
	if (!birthMonth) {
		alert("생년월일을 입력해주세요.");
		document.getElementById("birthmonth").focus();
		return;
	}
	
	var birthDay = document.getElementById("birthday").value;
	
	if (!birthDay) {
		alert("생년월일을 입력해주세요.");
		document.getElementById("birthday").focus();
		return;
	}
	
	document.getElementById("user-form").submit();
}

	function valueCheckPassword() {
		var pwd = document.getElementById("pwd").value;
		var el = document.getElementById("pwdmessage");
		
		var pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{10,16}$/;
		
		if (!pwdReg.test(pwd)) {
			el.textContent = "올바른 비밀번호가 아닙니다.";
			el.style.color = "red";
			return;
		} else {
			el.textContent = "올바른 비밀번호입니다.";
			el.style.color = "green";
		}
	}
	
	function valueCheckPasswordDuplicate() {
		var userpwd1 = document.getElementById("pwd").value;
		var userpwd2 = document.getElementById("pwdcheck").value;
		var el = document.getElementById("pwdcheckmessage");
		
		if (userpwd1 != userpwd2) {
			el.textContent = "비밀번호가 일치하지 않습니다.";
			el.style.color = "red";
		} else {
			el.textContent = "비밀번호가 일치합니다.";
			el.style.color = "green";
		}
	}
	
	function valueCheckEmail() {
		var email = document.getElementById("email").value;
		var el = document.getElementById("emailmessage");
			
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
		if (!regExp.test(email)) {
			el.textContent = "올바른 이메일 주소를 입력해 주세요.";
			el.style.color = "red";
			return;
		} else {
			el.textContent = "사용가능한 이메일 주소입니다.";
			el.style.color = "green";
		}	
	}
	
	function deleteuser() {
		var check = confirm("정말 탈퇴하시겠습니까?");
		if (check == true) {
			document.getElementById("deleteuser").setAttribute("href", "delete.jsp");
			alert("회원탈퇴가 완료되었습니다.");
		} else {
			document.getElementById("deleteuser").setAttribute("href", "modify.jsp");
		}
	}

	function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
        }
    }).open();
}
</script>
</body>
</html>