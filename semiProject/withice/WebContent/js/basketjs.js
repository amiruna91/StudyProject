
function deleteAllConfirmByCart() {
	var check = confirm("장바구니를 비우시겠습니까?");
	if(check == true){
		alert("장바구니를 비었습니다.");
		document.getElementById("deletecart").setAttribute("href", "/withice/order/deleteallcart.jsp");
	} else{
		document.getElementById("deletecart").setAttribute("href", "/withice/order/basket.jsp");
	}
}
function deleteAllConfirmByWish() {
	var check1 = confirm("관심상품을 비우시겠습니까?");
	if(check1 == true){
		alert("관심상품를 비었습니다.");
		document.getElementById("deletewish").setAttribute("href", "/withice/order/deleteallwish.jsp");
	} else{
		document.getElementById("deletewish").setAttribute("href", "/withice/myshop/wish_list.jsp");
	}
}


//전체 선택/해제 체크박스의 체크상태가 변할 때 실행되는 함수
function toggleAllCheckboxes(event) {
	// 전체 선택/해제 체크박스의 현재 체크여부를 조회한다.(true/false 값 중 하나다.)
	var currentHeaderCheckboxStatus = event.target.checked;
	
	// 모든 상품의 체크박스를 전부 조회한다.(input[id^=product-checkbox]는 input태그 중에서 id가 product-checkbox로 시작하는 엘리먼트를 전부 나타낸다.)
	var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
	for (var i=0; i<checkboxes.length; i++) {
		var checkbox = checkboxes[i];
		// 상품 체크박스의 체크상태에  전체 선택/해제 체크박스의 현재 체크상태값을 대입한다.
		checkbox.checked = currentHeaderCheckboxStatus;
	}
}

//전체 선택/해제 체크박스의 체크상태를 변경한다.(상품 체크박스의 체크상태를 조사해서 전부 체크된 경우에는 자동으로 전체 선택/해제 체크박스가 체크되게 한다.)
function changeCheckedHeaderCheckbox() {
	// 모든 상품의 체크박스를 전부 조회한다.(input[id^=product-checkbox]는 input태그 중에서 id가 product-checkbox로 시작하는 엘리먼트를 전부 나타낸다.)
	var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
	
	// 체크되지 않은 체크박스가 있을 경우 true값을 대입할 변수
	var isExistUncheckedCheckbox = false;
	for (var i=0; i<checkboxes.length; i++) {
		var checkbox = checkboxes[i];
		if (!checkbox.checked) {
			// 체크되지 않은 체크박스가 있으면 isExistUncheckedCheckbox에 true를 대입한다.
			isExistUncheckedCheckbox = true;
			break;
		}
	}
	
	// isExistUncheckedCheckbox가 true이면 체크되지 않은 상품체크박스가 하나 이상 있다. --> 전체 선택/해제 체크박스의 체크상태를 false로 바꾼다. ---> isExistUncheckedCheckbox의 반대값을 대입
	// isExistUncheckedCheckbox가 false이면 체크되지 않은 상품체크박스가 하나도 없다. --> 전체 선택/해제 체크박스의 체크상태를 true로 바꾼다. ---> isExistUncheckedCheckbox의 반대값을 대입
	document.getElementById("header-checkbox").checked = !isExistUncheckedCheckbox;
}

//각 상품 체크박스의 체크상태가 변할 때 실행되는 함수
function toggleChecked() {
	// 전체 선택/해제 체크박스의 체크상태를 변경한다.
	changeCheckedHeaderCheckbox()
}
function orderAll() {
	var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
	var productNo = [];
	var productAmount = [];
	if(checkboxes.length===0){
		alert("주문할 상품이 없습니다.");
		location.href='basket.jsp';
	} else {
		for (var i=0; i<checkboxes.length; i++) {
			productNo[i] = document.getElementsByName("product_no")[i].value;
			productAmount[i] = document.getElementsByName("product_amount")[i].value;
		}
		location.href='orderform.jsp?product_no='+productNo+'&product_amount='+productAmount;
	}
	
}

function selectOrder() {
	var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
	var productNo = [];
	var productAmount = [];
	var cnt = 0;
	for (var i=0; i<checkboxes.length; i++){
		var checkbox = checkboxes[i];
		if(checkbox.checked){
			productNo[cnt] = document.getElementsByName("product_no")[i].value;
			productAmount[cnt] = document.getElementsByName("product_amount")[i].value;
			cnt++;
		}
	}
	if(cnt == 0){
		alert("주문할 상품을 체크해주세요.");
		return;
	} else{
		location.href='orderform.jsp?product_no='+productNo+'&product_amount='+productAmount;
		
	}
}

function selectDelete() {
	var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
	var productNo = [];
	var cnt = 0;
	for (var i=0; i<checkboxes.length; i++){
		var checkbox = checkboxes[i];
		if(checkbox.checked){
			productNo[cnt] = document.getElementsByName("product_no")[i].value;
			cnt++;
		}
	}
	if(cnt == 0){
		alert("삭제할 상품을 체크해주세요.");
		return;
	} else{
		location.href='deletecart.jsp?product_no='+productNo;
		
	}
}
