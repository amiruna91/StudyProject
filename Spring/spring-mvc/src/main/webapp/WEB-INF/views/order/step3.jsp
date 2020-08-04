<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<title>쇼핑몰</title>
</head>

<body>
	<div class="container mt-3 mb-5">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<form method="post" action="step3.do">
						<div class="card-header">구매상품</div>
						<div class="card-body">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>상품이름</th>
										<td>${orderForm.productName }</td>
									</tr>
									<tr>
										<th>상품가격</th>
										<td>
											<fmt:formatNumber value="${orderForm.productPrice }" /> 원</td>
									</tr>
									<tr>
										<th>상품할인 가격</th>
										<td>
											<fmt:formatNumber value="${orderForm.productDiscountPrice }" /> 원</td>
									</tr>
									<tr>
										<th>구매수량</th>
										<td>
											<fmt:formatNumber value="${orderForm.amount }" /> 개</td>
									</tr>
									<tr>
										<th>구매자 이름</th>
										<td>${orderForm.username }</td>
									</tr>
									<tr>
										<th>구매자 연락처</th>
										<td>${orderForm.usertel }</td>
									</tr>
									<tr>
										<th>결재방식</th>
										<td>${orderForm.payType }</td>
									</tr>
									<tr>
										<th>계좌(카드)번호</th>
										<td>${orderForm.payAccount }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body">
							<div class="form-group">
								<label>수령자 이름</label>
								<input type="text" class="form-control" name="receiverUsername"/>
							</div>
							<div class="form-group">
								<label>수령자 전화번호</label>
								<input type="text" class="form-control" name="receiverTel" />
							</div>
							<div class="form-group">
								<label>수령자 주소</label>
								<input type="text" class="form-control" name="receiverAddress" />
							</div>
						</div>
						<div class="card-footer text-right">
							<button type="submit" class="btn btn-primary">주문완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>