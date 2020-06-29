<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/withice/css/naviAndFooter.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
 	#button:hover {
		background-color: white;
		color: #585858;
	}
</style>
</head>
<body>
<div class="container">
<div class="row" style="background-color: #585858; color: white;">
	<div class="col-12 my auto" style="padding: 10px 10px;">
		<strong>Address Book</strong>
	</div>
</div>
<div class="row" style="padding: 20px 20px;">
	<div class="col-12">
		<div class="table">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>배송주소록 유의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1. 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</td>
					</tr>
					<tr>
						<td>2. 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row" style="padding: 20px 20px;">
	<div class="col-12">
		<form id="address-form" method="post" action="addressregister.jsp">
		<input type="hidden" name="userid" value="<%=loginedUserId %>"/>
			<div class="table">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>배송지명 <img src="../../images/userimage/circle-16.png" width="5px;" height="5px;" /></th>
							<td><input type="text" name="name" id="name"/></td>
						</tr>
						<tr>
							<th>성명 <img src="../../images/userimage/circle-16.png" width="5px;" height="5px;" /></th>
							<td><input type="text" name="receiver" id="receiver"/></td>
						</tr>
						<tr>
							<th>주소 <img src="../../images/userimage/circle-16.png" width="5px;" height="5px;" /></th>
							<td>
 								<input type="text" id="sample4_postcode" name="postcode" style="width: 100px;" readonly>
 								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
 								<input type="text" id="sample4_roadAddress" name="mainaddress" style="width: 300px;" readonly> 기본주소<br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="subaddress" style="width: 300px;"> 나머지주소
 							</td>
						</tr>
						<tr>
							<th>일반전화</th>
							<td>
								<select name="tel1" style="width: 70px; height: 25px;">
									<option value="no">선택</option>
	 								<option value="02">02</option>
	 								<option value="031">031</option>
	 								<option value="032">032</option>
	 								<option value="033">033</option>
	 								<option value="041">041</option>
	 								<option value="042">042</option>
	 								<option value="043">043</option>
	 								<option value="051">051</option>
				 					<option value="052">052</option>
				 					<option value="053">053</option>
				 					<option value="054">054</option>
				 					<option value="055">055</option>
				 					<option value="061">061</option>
				 					<option value="062">062</option>
				 					<option value="063">063</option>
				 					<option value="064">064</option>
				 					<option value="0502">0502</option>
				 					<option value="053">0503</option>
				 					<option value="0504">0504</option>
				 					<option value="0505">0505</option>
				 					<option value="0506">0506</option>
				 					<option value="0507">0507</option>
				 					<option value="070">070</option>
				 					<option value="010">010</option>
				 					<option value="011">011</option>
				 					<option value="016">016</option>
				 					<option value="017">017</option>
				 					<option value="018">018</option>
				 					<option value="019">019</option>
				 					<option value="0508">0508</option>
								</select> - 
								<input type="text" name="tel2" maxlength="4" style="width: 70px; height: 25px;" /> - 
								<input type="text" name="tel3" maxlength="4" style="width: 70px; height: 25px;" /></td>
						</tr>
						<tr>
							<th>
								휴대전화 <img src="../../images/userimage/circle-16.png" width="5px;" height="5px;" />
							</th>
							<td>
								<select name="cell1" style="width: 60px; height: 25px;">
									<option value="010">010</option>
			 						<option value="011">011</option>
			 						<option value="016">016</option>
			 						<option value="017">017</option>
			 						<option value="018">018</option>
			 						<option value="019">019</option>
								</select> - 
								<input type="text" name="cell2" id="cell2" maxlength="4" style="width: 60px; height: 25px;" /> - 
								<input type="text" name="cell3" id="cell3" maxlength="4" style="width: 60px; height: 25px;" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-12 text-center">
					<button class="btn btn-dark" type="button" id="button" onclick="checkFieldValue()">등록</button>
					<a href="list.jsp" class="btn btn-outline-secondary">취소</a>
				</div>
			</div>	
		</form>
	</div>
</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function checkFieldValue() {		
	var name = document.getElementById("name").value;
	
	if (!name) {
		alert("배송지명 항목은 필수 입력값입니다.");
		document.getElementById("name").focus();
		return;
	}

	var receiver = document.getElementById("receiver").value;
	
	if (!receiver) {
		alert("성명 항목은 필수 입력값입니다.")
		document.getElementById("receiver").focus();
		return;
	}
	
	var postalcode = document.getElementById("sample4_postcode").value;
	
	if (!postalcode) {
		alert("주소 항목은 필수 입력값입니다.");
		document.getElementById("sample4_postcode").focus();
		return;
	}
	
	var cell2 = document.getElementById("cell2").value;
	
	if (!cell2) {
		alert("휴대전화 번호 항목은 필수 입력값입니다.");
		document.getElementById("cell2").focus();
		return;
	}
	
	var cell3 = document.getElementById("cell3").value;
	
	if (!cell3) {
		alert("휴대전화 번호 항목은 필수 입력값입니다.");
		document.getElementById("cell2").focus();
		return;
	}
	
	document.getElementById("address-form").submit();
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