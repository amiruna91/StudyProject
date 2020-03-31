package oop1_4;

public class ProductService {

	Product[] db = new Product[20];
	int position = 0;
	
	// 배열에 저장된 모든 상품정보를 출력한다.
	void printAllProducts() {
		System.out.println();
		System.out.println("상품명\t제조사\t카테고리\t가격\t할인율\t재고량\t절판여부");
		
		for (int i = 0; i < position; i++) {
			System.out.print(db[i].name + "\t");
			System.out.print(db[i].maker + "\t");
			System.out.print(db[i].category + "\t");
			System.out.print(db[i].price + "\t");
			System.out.print(db[i].discountRate + "\t");
			System.out.print(db[i].stock + "\t");
			System.out.println(db[i].isSoldOut);
		}
		
	}
	// 상품객체(새 상품, 이월상품)를 전달받아서 배열에 저장한다.
	void insertProduct(Product product) {
		db[position] = product;
		position++;
	}
	
	// 상품명과 입고량을 전달받아서 이미 배열에 저장된 상품의 재고량을 증가시킨다.
	void addProductStock(String name, int amount) {
		Product foundProduct = foundProduct(name);
		
		if (foundProduct != null) {
			foundProduct.stock += amount;
			foundProduct.isSoldOut = true;
			System.out.println("현재" + foundProduct.name + "의재고량은: " + foundProduct.stock + "입니다.");
		}
	}
	
	// 상품명과 출고량을 전달받아서 배열에서 해당 상품을 찾아서 재고량을 감소시킨다.
	// 단, 재고량보다 출고량이 많은 경우 오류 메세지를 표시한다.
	// 단, 재고량이 0이 되면 해당상품의 절판여부를 true로 설정한다.
	void exportProduct(String name, int amount) {
		Product foundProduct = foundProduct(name);
		
		if (foundProduct != null && foundProduct.stock >= amount) {
			foundProduct.stock -= amount;
			System.out.println("출고후" + foundProduct.name + "의 재고량은: " + foundProduct.stock + "입니다.");
		} else if (foundProduct != null && foundProduct.stock < amount) {
			System.out.println("재고가 부족합니다.");
		}
		
		if (foundProduct.stock == 0) {
			foundProduct.isSoldOut = true;
			System.out.println("재고가 모두 소진됐습니다.");
		}
	}
	// 상품명을 전달받아서 배열에서 상품명이 일치하는 상품정보를 출력한다.
	void printProductByName(String name) {
		Product foundProduct = foundProduct(name);
	
		if (foundProduct != null) {
			foundProduct.display();
		} else {
			System.out.println("해당 상품이 없습니다.");
		}
	}
	
	// 제조사명을 전달받아서 배열에서 제조사명이 일치하는 상품정보를 출력한다.
	void printProductByMaker(String maker) {
		Product foundProduct = null;
		for (int i = 0; i < position; i++) {
			if (maker.equals(db[i].maker)) {
				foundProduct = db[i];
				foundProduct.display();
			}
		}
		if (foundProduct == null) {
			System.out.println("해당 제조사명의 상품이 없습니다.");
		}
	}
	
	// 카테고리명을 전달받아서 배열에서 카테고리명이 일치하는 상품정보를 출력한다.
	void printProductByCategory(String category) {
		Product foundProduct = null;
		for (int i = 0; i < position; i++) {
			if (category.equals(db[i].category)) {
				foundProduct = db[i];
				foundProduct.display();
			}
		}
		if (foundProduct == null) {
			System.out.println("해당 카테고리의 상품이 없습니다.");
		}
	}
	
	// 최저가격과 최고가격을 전달받아서 배열에서 해당 가격범위에 속하는 상품정보를 출력한다.
	void printProductByPrice(int minPrice, int maxPrice) {
		Product foundProduct = null;
		for (int i = 0; i < position; i++) {
			if (db[i].price >= minPrice && db[i].price <= maxPrice) {
				foundProduct = db[i];
				foundProduct.display();
			}
		}
		if (foundProduct == null) {
			System.out.println("해당 가격 범위의 상품이 없습니다.");
		}
	}
	
	// 입력받은 상품명과 일치하는 상품명 찾는 기능
	Product foundProduct(String name) {
		Product foundPro = null;
		
		for (int i = 0; i < position; i++) {
			if (name.equals(db[i].name)) {
				foundPro = db[i];
				break;
			}
		}
		
		return foundPro;
	}
}
