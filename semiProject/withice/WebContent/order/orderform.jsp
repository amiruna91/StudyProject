<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.Cart"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.dao.CartDao"%>
<%@page import="com.withice.dto.CartDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.vo.Product"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
  <style>
	 div.col-md-12 {
		font-size: 12px;
	}
	.row {
		padding-top: 20px;
	}
	.col-md-12 > a {
		color: gray;
		text-decoration: none;
	}
	a {
		color : black;
		text-decoration: none;
	}
	a:hover {
		color: black;
	}
	table {
		font-size: 12px;
	}
	h6 {
		font-size: 10px;
	}
  	th{
  	background-color: #FAF8F4;
  	}
  	a {
	color : black;
	text-decoration: none;
	}
	a:hover {
	color: black;
	}
  </style>
</head>
<body>
<%@ include file="../common/logincheck.jsp"%>
<%@ include file="../common/navbar.jsp"%>
<%
	String [] productNo = request.getParameterValues("product_no");
	String [] productAmount = request.getParameterValues("product_amount");
	String [] splitProductNo = {};
	String [] splitProductAmount = {};
	for(int i=0; i<productNo.length; i++){
		splitProductNo = productNo[i].split(",");
		splitProductAmount = productAmount[i].split(",");
	}
	ProductDao productDao = new ProductDao();
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(loginedUserId);
	CartDao cartDao = new CartDao();

%>
<%
%>
<div class="container">
	<form id="order-form" method="post" action="insertorder.jsp">
	<div class="row">
		<div class="col-md-12 text-right">
			<a href="../home.jsp">Home</a> <span title="현재 위치"> > Order Sheet</span>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<p style="padding-top: 20px;">ORDER SHEET</p>
			<div class="row">
				<div class="col-12"></div>
				<table class="table table-bordered table-active">
					<tr>
						<th class="text-center" rowspan="3" style="padding-top: 30px;">혜택정보</th>
						<td>
							<span style="font-weight: bold;">
								<%=user.getName() %>
							</span> 님은, [<%=user.getGrade() %>] 회원이십니다. 
						</td>
					</tr>
					<tr>
						<td>가용 적립금 : <span style="font-weight: bold;"><%=user.getUsableMileage() %>원</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<p style="padding-top: 20px; font-weight: bold; font-size: 12px;">주문내역</p>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table text-center">
				<thead>
					<tr>
						<th>이미지</th>
						<th colspan="5">상품정보</th>
						<th>판매가</th>
						<th>수량</th>
						<th>적립금</th>
						<th>배송구분</th>
						<th>배송비</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				<%
					int totalPrice = 0;
					for(int i=0; i<splitProductNo.length; i++){
						int pNo = NumberUtil.stringToInt(splitProductNo[i]);
						Product product = productDao.getProductByNo(pNo);
				%>
					<tr>
						<td style="vertical-align: middle !important;">
							<input type="hidden" name="product_no" value="<%=product.getNo() %>" />
							<input type="hidden" name="product_amount" value="<%=NumberUtil.stringToInt(splitProductAmount[i]) %>" />
							<input type="hidden" name="product_price" value="<%=product.getPrice() %>" />
							<a href="/withice/product/productDetail.jsp?product_no=<%=product.getNo()%>">
								<img src="../images/product-images/<%=product.getThumbnail() %>" alt="" width="80" height="80" />
							</a>
						</td>
						<td style="vertical-align: middle !important;" colspan="5">
							<a style="text-decoration: none;" href="/withice/product/detail.jsp?product_no=<%=product.getNo()%>"><%=product.getName() %></a>
						</td>
						<td style="vertical-align: middle !important; font-weight: bold;"><%=NumberUtil.numberWithComma(product.getPrice()) %>원</td>
						<td style="vertical-align: middle !important;"><%=NumberUtil.stringToInt(splitProductAmount[i]) %></td>
						<td style="vertical-align: middle !important;">-</td>
						<td style="vertical-align: middle !important;">기본배송</td>
						<td style="vertical-align: middle !important;">무료</td>
						<td style="vertical-align: middle !important; font-weight: bold;">
							<%=NumberUtil.numberWithComma(product.getPrice() * NumberUtil.stringToInt(splitProductAmount[i]))  %>원
						</td>
					</tr>
				<%
					totalPrice +=(product.getPrice()*NumberUtil.stringToInt(splitProductAmount[i]));
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
			<span style="font-size: 12px;">[기본배송]</span>
		</div>
		<div class="col-9 text-right">
		<!-- 반복문 시작 -->

			<span style="font-size: 12px;">
				상품구매금액 <span style="font-weight: bold;"> </span> 
				+ 배송비 무료 = 합계 : 
				<span style="font-weight: bold; font-size:16px; margin-left: 8px;">
				<%=NumberUtil.numberWithComma(totalPrice) %>원</span>
			</span>
		<!-- 반복문 끝 -->
		</div>
	</div>
		
	<div class="row">
		<div class="col-12">
			<h6 style="color: red; font-size: 12px;"><span class="badge badge-danger">!</span>상품의 옵션 및 수량 변경은 상품상세정보 에서 가능합니다.</h6>
		</div>
	</div>
	
	<%
		AddressDao addressDao = new AddressDao();
		Address address = addressDao.getAddressHomeByUserId(user.getId());
				
	%>
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-10">
					<h6 style="font-weight: bold; font-size: 14px;">주문정보 </h6>
				</div>
				<div class="col-2 text-right">
					<span style="font-size: 10px;"><img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/> 필수입력사항</span>
				</div>
			</div>
				<table class="table table-bordered" style="font-size: 13px;">
					<tbody>
						<tr>
							<th style="vertical-align: middle !important;">주문하시는분 
								<img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/>
							</th>
							<td>
								<input type="text" id="textbox" value="<%=user.getName()%>" readonly/>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle !important;">주소
								<img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/>
							</th>
							<td>
								<input type="text" id="sample4_postcode"  style="width: 100px;" value="<%=address.getPostalCode()%>" readonly>
								<input  style="margin-bottom: 3px;"class="btn btn-outline-secondary btn-sm" type="button" onclick="sample4_execDaumPostcode()" value="주소 검색"><br>

								<input type="text" id="sample4_roadAddress" style="width: 300px; margin-bottom: 3px;" value="<%=address.getMain() %>" readonly> 기본주소<br>
								<input type="text" id="sample4_detailAddress" style="width: 300px;" value="<%=address.getSub() %>"readonly> 나머지주소
							</td>
						</tr>
						<tr>
 							<th style="vertical-align: middle !important;">일반전화</th>
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
			 					<input type="text" name="tel2" value="<%=telNum[1] %>" maxlength="4" style="width: 70px; height: 25px;" readonly/> -
			 					<input type="text" name="tel3" value="<%=telNum[2] %>" maxlength="4" style="width: 70px; height: 25px;" readonly/>
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
 							<td>
 								<select name="cell1">
		 							<option value="010" <%="010".equals(cell1) ? "selected" : "" %>>010</option>
		 							<option value="011" <%="011".equals(cell1) ? "selected" : "" %>>011</option>
		 							<option value="016" <%="016".equals(cell1) ? "selected" : "" %>>016</option>
		 							<option value="017" <%="017".equals(cell1) ? "selected" : "" %>>017</option>
		 							<option value="018" <%="018".equals(cell1) ? "selected" : "" %>>018</option>
		 							<option value="019" <%="019".equals(cell1) ? "selected" : "" %>>019</option>
 								</select> -
		 						<input type="text" name="cell2" value="<%=cell2 %>" maxlength="4" style="width: 50px; height: 25px;" readonly/> -
		 						<input type="text" name="cell3" value="<%=cell3 %>" maxlength="4" style="width: 50px; height: 25px;" readonly/>
 							</td>
 						</tr>
 						<tr>
	 						<th style="vertical-align: middle !important;">이메일 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
	 						<td>
	 							<input type="text" name="email" id="textbox" value="<%=user.getEmail() %>" readonly />
	 							<div style="font-size: 10px; margin: 0; color: gray;">
		 							<p style="margin-bottom: 0;">이메일을 통해 주문처리과정을 보내드립니다.</p>
		 							<p>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</p>
	 							</div>
	 						</td>
 						</tr>
					</tbody>
				</table>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-12">
			<div class="row">
				<div class="col-10">
					<h6 style="font-weight: bold; font-size: 14px;">배송정보 </h6>
				</div>
				<div class="col-2 text-right">
					<span style="font-size: 10px;"><img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/> 필수입력사항</span>
				</div>
			</div>
					<table class="table table-bordered" style="font-size: 13px;">
						<tbody>
							<tr>
								<th style="vertical-align: middle !important;">배송지선택 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
								<td>
									<input type="radio" name="1" value="equal" onclick="equalAddress()" checked/>주문자 정보와 동일
									<input type="radio" name="1" value="new" style="margin-left: 20px;" onclick="changeNewAddress()" />새로운 배송지
									<button class="btn btn-secondary btn-sm" onclick="openPopup()">주소록 보기</button>
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle !important;">받으시는분 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
								<td><input type="text" name="username" id="recipient" value="<%=user.getName()%>" /></td>
							</tr>
							<tr>
								<th style="vertical-align: middle !important;">주소
									<img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/>
								</th>
								<td>
									<input type="text" id="sample5_postcode" name="postcode"  style="width: 100px;" value="<%=address.getPostalCode()%>" readonly>
									<input  style="margin-bottom: 3px;"class="btn btn-outline-secondary btn-sm" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	
									<input type="text" id="sample5_roadAddress" name="mainadd"style="width: 300px; margin-bottom: 3px;" value="<%=address.getMain() %>" readonly> 기본주소<br>
									<input type="text" id="sample5_detailAddress"name="subadd" style="width: 300px;" value="<%=address.getSub() %>"> 나머지주소
								</td>
							</tr>
							<tr>
								<th style="vertical-align: middle !important;">일반전화</th>
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
			 					<input type="text" name="tel2" id="tel2" value="<%=telNum[1] %>" maxlength="4" style="width: 70px; height: 25px;"/> -
			 					<input type="text" name="tel3" id="tel3" value="<%=telNum[2] %>" maxlength="4" style="width: 70px; height: 25px;"/>
			 				</td>
							</tr>
	 						<tr>
	 							<th>휴대전화 <img src="../images/userimage/circle-16.png" width="5px;" height="5px;"/></th>
	 							<td>
	 								<select name="cell1" id="num1">
			 							<option value="010" <%="010".equals(cell1) ? "selected" : "" %>>010</option>
			 							<option value="011" <%="011".equals(cell1) ? "selected" : "" %>>011</option>
			 							<option value="016" <%="016".equals(cell1) ? "selected" : "" %>>016</option>
			 							<option value="017" <%="017".equals(cell1) ? "selected" : "" %>>017</option>
			 							<option value="018" <%="018".equals(cell1) ? "selected" : "" %>>018</option>
			 							<option value="019" <%="019".equals(cell1) ? "selected" : "" %>>019</option>
	 								</select> -
			 						<input type="text" name="cell2" value="<%=cell2 %>" maxlength="4" style="width: 50px; height: 25px;" id="num2"/> -
			 						<input type="text" name="cell3" value="<%=cell3 %>" maxlength="4" style="width: 50px; height: 25px;" id="num3"/>
	 							</td>
 							</tr>
	 						<tr>
		 						<th style="vertical-align: middle !important;">배송메시지</th>
		 						<td>
		 							<textarea name="message" id="msg" cols="100" rows="3"></textarea>
		 						</td>
	 						</tr>
						</tbody>
					</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>총 주문 금액</th>
			        <th>총 할인 + 부가결제 금액</th>
			        <th>총 결제예정 금액</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>
			        	<%=NumberUtil.numberWithComma(totalPrice) %>원
			        	<input type="hidden" name="totalprice" value="<%=totalPrice %>" />
			        </td>
			        <td>-0원</td>
			        <td>=<span><%=NumberUtil.numberWithComma(totalPrice) %></span>원</td>
			      </tr>
			      <tr>
			       	<th colspan="1">총 할인금액</th>
			       	<td colspan="2">0원</td>
			      </tr>
			       <tr>
			       	<th colspan="1">총 부가결제금액</th>
			       	<td colspan="2">0원</td>
			      </tr>
			      <tr>
			      	<td colspan="1">적립금</td>
			      	<td colspan="2">
			      		<p style="font-size: 12px;">
			      			<input id="order-mileage" type="number" name="mileage" value="0"/>원  (사용가능 적립금 : 
			      			<span style="color: red; font-weight: bold;"><%=NumberUtil.numberWithComma(user.getUsableMileage()) %></span>)원
			      		</p>
			      		<p style="margin: 0;">-적립금은 0원 이상일 때 결제가 가능합니다.</p>
			      		<p style="margin: 0;">-최대 사용금액은 제한이 없습니다.</p>
			      	</td>
			      </tr>
			    </tbody>
		  </table>
		</div>
	</div>
	</form>
	<div class="row">
		<div class="col-12 text-center">
			<button class="btn btn-secondary btn-lg" onclick="insertOrder()">주문하기</button>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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
	function sample5_execDaumPostcode() {
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
	            document.getElementById('sample5_postcode').value = data.zonecode;
	            document.getElementById("sample5_roadAddress").value = roadAddr;
	            
	  
	        }
	    }).open();
	}
	function changeNewAddress() {
		document.getElementById("recipient").value = "";
		document.getElementById("sample5_postcode").value = "";
		document.getElementById("sample5_roadAddress").value = "";
		document.getElementById("sample5_detailAddress").value = "";
		document.getElementById("num2").value = "";
		document.getElementById("num3").value = "";
		document.getElementById("tel2").value = "";
		document.getElementById("tel3").value = "";
		document.getElementById("msg").value = "";
	}
	function equalAddress() {
		document.getElementById("order-form").reset();
		
	}
	function insertOrder() {
		var recipient = document.getElementById("recipient").value;
		var postcode = document.getElementById("sample5_postcode").value;
		var mainadd = document.getElementById("sample5_roadAddress").value;
		var subadd = document.getElementById("sample5_detailAddress").value;
		var num2 = document.getElementById("num2").value;
		var num3 = document.getElementById("num3").value;
		if (!recipient) {
			alert("받으실분의 성함을 입력해주세요.");
			document.getElementById("recipient").focus();
			return;
		}
		if (!postcode) {
			alert("우편번호를 입력해주세요.");
			document.getElementById("postcode").focus();
			return;
		}
		if (!mainadd) {
			alert("주소를 입력해주세요.");
			document.getElementById("mainadd").focus();
			return;
		}
		if (!subadd) {
			alert("상세주소를 입력해주세요.");
			document.getElementById("subadd").focus();
			return;
		}
		if (!num2) {
			alert("휴대폰 앞자리를 입력해주세요.");
			document.getElementById("num2").focus();
			return;
		}
		if (!num3) {
			alert("휴대폰 뒷자리를 입력해주세요.");
			document.getElementById("num3").focus();
			return;
		}
		
		document.getElementById("order-form").submit();
	}
	function openPopup() {
        // window.name = "부모창 이름"; 
        window.name = "orderForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("../addr_popup/list.jsp",
                "childForm", "width=1200, height=800, resizable = no, scrollbars = no");    
        event.preventDefault();
	}
	function setAddressValue(receiver,postalCode,mainAdd,subAdd,phoneNum) {
		document.getElementById("recipient").value = receiver;
		document.getElementById("sample5_postcode").value = postalCode;
		document.getElementById("sample5_roadAddress").value = mainAdd;
		document.getElementById("sample5_detailAddress").value = subAdd;
		var splitPhoneNum = phoneNum.split("-");
		document.getElementById("num1").value = splitPhoneNum[0];
		document.getElementById("num2").value = splitPhoneNum[1];
		document.getElementById("num3").value = splitPhoneNum[2];
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	$(function() {
		var firstPrice = $("tbody:eq(4) tr:eq(0)").children("td:eq(2)").find("span").text();
		$("#order-mileage").change(function() {
		var checkednum = /[0-9]/;
		var tbody = $("tbody:eq(4) tr");
		var resultNum = checkednum.test(tbody.eq(3).children("td:eq(1)").children("p:eq(0)").find("input").val());  
			
		var priceStr = $(this).val();
		var price = parseInt(priceStr);
		var mileage = tbody.eq(3).children("td:eq(1)").children("p:eq(0)").find("span").text();
		var repmileage = parseInt(mileage.replace(",",""));
		if(price > repmileage){
			tbody.eq(3).children("td:eq(1)").children("p:eq(0)").find("input").val(repmileage);
			price = repmileage;
		}
		if(price < 0 || resultNum==false) {
			tbody.eq(3).children("td:eq(1)").children("p:eq(0)").find("input").val(0);
			price = 0;
		}
		

		var resultP = firstPrice;
		tbody.eq(0).children("td:eq(1)").text(price);
		var resultA = parseInt(resultP.replace(",",""));
		var resultB = tbody.eq(0).children("td:eq(2)").find("span").text(resultA-price);
		var resultB = tbody.eq(0).children("td:eq(2)").find("span").text();
		var resultC = numberWithCommas(resultB);

		})
	})
</script>
</body>
</html>