package com.sample.bookstore.service;

import com.sample.bookstore.vo.Book;
import com.sample.bookstore.vo.Rental;
import com.sample.bookstore.vo.User;

public class BookstoreService {

	BookService bookService = new BookService();
	UserService userService = new UserService();
	RentalService rentalService = new RentalService();
	
	// 회원등록 서비스
	// 이름과 전화번호를 전달받아서 회원등록 서비스를 제공한다.
	//		- User객체를 생성해서 이름과 전화번호를 저장한다.
	//		- 회원등록시 100포인트를 지급한다.
	//		- UserService의 회원등록 기능을 실행한다.
	public void addNewUser(String name, String tel) {
		User user = new User();
		user.name = name;
		user.tel = tel;
		user.point = 100;
		user.isDisabled = false;
		
		userService.insertUser(user);
	}
	
	// 회원조회 서비스
	// 회원번호를 전달받아서 회원번호에 대한 회원정보를 화면에 출력한다.
	//		- UserService의 회원조회기능을 실행해서 회원정보를 제공받는다.
	//		- 조회된 회원정보를 화면에 출력한다.
	public void retrieveUserInfo(int userNo) {
		User u = userService.findUserByNo(userNo);
		
		System.out.println("------------------------------------");
		System.out.println("회원번호: " + u.no);
		System.out.println("회원이름: " + u.name);
		System.out.println("전화번호: " + u.tel);
		System.out.println("포 인 트: " + u.point);
		System.out.println("탈퇴여부:" + u.isDisabled);
		System.out.println("------------------------------------");
	}
	
	// 회원수정 서비스
	// 수정할 회원정보를 전달받아서 해당 회원의 정보를 수정한다.
	//		= UserSerivce의 회원정보 변경기능을 실행해서 회원정보를 수정한다.
	public void modifyUserInfo(User user) {
		userService.updateUser(user);
	}
	
	// 회원탈퇴 서비스
	// 탈퇴처리할 회원번호를 전달받아서 해당 회원을 탈퇴처리한다.
	//		- UserService의 회원조회기능을 실행해서 회원정보를 제공받는다.
	//		- 조회된 회원의 탈퇴여부를 탈퇴처리로 변경한다.
	//		- RentalService의 반납기능을 실행해서 해당 회원이 대여중인 모든 책을 반납처리한다.
	public void disabledUser(int userNo) {
		User u = userService.findUserByNo(userNo);
		u.isDisabled = true;
		
		Book book = null;
		Rental[] rental = rentalService.returnAllRentalByUserNo(userNo);
		for (int i = 0; i < rental.length; i++) {
			if (rental[i] == null) break;
			book = bookService.findBookByNo(rental[i].bookNo);
			book.stock += 1;			
		}
	}
	
	// 전체 회원조회 서비스
	// 등록된 모든 회원정보 조회를 처리한다.
	// 		- UserService의 모든 회원정보 조회기능을 실행해서 모든 회원정보를 제공받는다.
	//		- 조회된 회원정보를 화면에 출력한다.
	public void retrieveAllUsers() {
		User[] u = userService.getAllUsers();
		System.out.println("===============================================================");
		System.out.println("번호    이름     전화번호     포인트   탈퇴여부");
	
		for (int i = 0; i < u.length; i++) {
			if (u[i] == null) break;
			System.out.print(u[i].no + "\t");
			System.out.print(u[i].name + "\t");
			System.out.print(u[i].tel + "\t");
			System.out.print(u[i].point + "\t");
			System.out.println(u[i].isDisabled);
		}
	}
	
	// 현재 회원의 대여 현황 조회 서비스
	//회원번호를 입력받아서 그 고객이 대여중인 모든 책정보
	//(책번호, 제목, 가격, 대여상태) 출력하기
	public void returnStatusInfo(int userNo) {
		User user = userService.findUserByNo(userNo);
		Rental[] rental = rentalService.returnRentalbyUserNo(userNo);
		Book book = null;
		
		if (rental[0] == null) {
			System.out.println();
			System.out.println("현재 고객님의 대여정보는 없습니다.");
		}
		
		System.out.println("===============================================================");
		System.out.println("[" + user.name + "]님의 대여 정보");
		System.out.println("도서번호    책제목     가격   대여여부");
		
		for (int i = 0; i < rental.length; i++) {
			if (rental[i] == null) break;
			book = bookService.findBookByNo(rental[i].bookNo);
			System.out.print(book.no + "\t");
			System.out.print(book.title + "\t");
			System.out.print(book.price + "\t");
			System.out.println(rental[i].isRent);
			
		}
		System.out.println("===============================================================");		
	}
	
	// 도서등록 서비스
	// 제목, 저자, 가격을 전달받아서 도서 등록 서비스를 처리한다.
	//		- Book객체를 생성해서 제목, 저자, 가격 정보를 저장한다.
	//		- 재고는 10000권으로 한다.
	// 		- BookService의 도서등록기능을 실행한다.
	public void insertNewBook(String title, String writer, int price) {
		Book book = new Book();
		
		book.title = title;
		book.writer = writer;
		book.price = price;
		book.stock = 10000;
		
		bookService.insertBook(book);
	}
		
	// 도서 검색 서비스
	// 제목를 전달받아서 도서 검색서비스를 처리한다.
	//		- BookService의 도서 검색기능을 실행해서 책정보를 제공받는다.
	//		- 조회된 책정보를 화면에 출력한다.
	public void searchBooks(String title) {
		Book[] book = bookService.findBookByTitle(title);
		
		if (book[0] == null) {
			System.out.println();
			System.out.println("해당 도서의 정보가 없습니다.");
		}
		
		System.out.println("===============================================================");
		System.out.println("번호    제목             저자    가격   수량");
		
		for (int i = 0; i < book.length; i++) {
			if (book[i] == null) break;
			System.out.print(book[i].no + "\t");
			System.out.print(book[i].title + "\t");
			System.out.print(book[i].writer + "\t");
			System.out.print(book[i].price + "\t");
			System.out.println(book[i].stock);
		}
		System.out.println("===============================================================");
	}
		
	// 도서 정보 수정 서비스
	// 책정보를 전달받아서 책정보 수정서비스를 처리한다.
	//		- BookService의 책정보 수정기능을 실행한다.
	public void modifyBook(Book book) {
		bookService.updateBook(book);
	}
	
	// 전체도서 조회 서비스
	// 모든 책정보 조회 서비스를 처리한다.
	// 		- BookService의 모든 책조회 기능을 실행한다.
	public void retrieveAllBooks() {
		Book[] book = bookService.getAllBooks();
		System.out.println("===============================================================");
		System.out.println("번호    제목             저자    가격   수량");
		
		for (int i = 0; i < book.length; i++) {
			if (book[i] == null) break;
			System.out.print(book[i].no + "\t");
			System.out.print(book[i].title + "\t");
			System.out.print(book[i].writer + "\t");
			System.out.print(book[i].price + "\t");
			System.out.println(book[i].stock);
		}
		System.out.println("===============================================================");
	}
	
	// 대여현황조회(추가기능)
	// 책번호를 입력받아서 그 책을 대여중인 정보(대여번호, 회원번호, 회원명) 출력하기
	public void rentalStatusInfo(int bookNo) {
		Rental[] rental = rentalService.returnRentalbyBookNo(bookNo);
		User user = null;
		
		if (rental[0] == null) {
			System.out.println();
			System.out.println("해당 책의 대여정보가 없습니다.");
			return;
		}
		
		System.out.println("===============================================================");
		System.out.println("대여번호   회원번호   회원명");
		
		for (int i = 0; i< rental.length; i++) {
			if (rental[i] == null) break;
			System.out.print(rental[i].no + "\t" + "  ");
			System.out.print(rental[i].userNo + "\t");
			
			user = userService.findUserByNo(rental[i].userNo);
			System.out.println(user.name);
			
		}
	}
	
	// 대여 서비스
	// 사용자번호와 책번호를 전달받아서 대여 서비스를 처리한다.
	//		- Rental객체를 생성해서 사용자번호, 책번호를 저장한다.
	//		- 대여여부는 대여중으로 설정한다.
	//		- 책재고 변경하기
	//			- BookService에서 책번호에 해당하는 책정보 조회기능 실행
	//			- 조회된 책의 재고를 1감소시킨다.
	public void rentBook(int userNo, int bookNo) {
		Rental rental = new Rental();
		rental.userNo = userNo;
		rental.bookNo = bookNo;
		rental.isRent = true;
		
		rentalService.insertRental(rental);
		Book book = bookService.findBookByNo(bookNo);
		book.stock -= 1;
	}
		
	// 반납 서비스
	// 대여번호를 전달받아서 반납 서비스를 처리한다.
	//		- RentalService에서 대여번호에 해당하는 대여정보 조회 기능을 실행
	//		- 조회된 대여정보의 반납여부를 false로 설정한다.
	//		- 사용자포인트 증가, 책재고 변경하기
	//			- UserService에서 사용자번호로 사용자정보 조회하기 실행
	//			- BookService에서 책번호로 책정보 조회하기 실행
	//			- 조회된 사용자의 포인트를 책가격의 1%만큼 증가시키기
	//			- 조회된 책정보의 재고를 1증가시키기
	public void returnBook(int rentalNo) {
		Rental rental = rentalService.findRentalByNo(rentalNo);
		rental.isRent = false;
		
		User user = userService.findUserByNo(rental.userNo);
		Book book = bookService.findBookByNo(rental.bookNo);
		user.point += (int) (book.price * 0.01);
		book.stock += 1;
	}
		
	// 대여현황 조회 서비스
	// 모든 대여정보를 조회하는 서비스를 처리한다.
	//		- RentalService의 전체 대여정보조회 기능을 실행한다.
	//		- 조회된 대여정보를 화면에 출력한다. (null체크)
	public void retrieveAllRentals() {
		Rental[] rental = rentalService.getAllRentals();
		Book book = null;
		User user = null;
		
		if (rental != null) {
			System.out.println("===============================================================");
			System.out.println("대여번호   도서번호 	  책제목     고객번호   고객명   대여여부");
			
			for (int i = 0; i < rental.length; i++) {
				if (rental[i] == null) break;
				System.out.print(rental[i].no + "\t" + "   ");
				
				book = bookService.findBookByNo(rental[i].bookNo);
				System.out.print(rental[i].bookNo + "\t" + " ");
				System.out.print(book.title + "\t");

				user = userService.findUserByNo(rental[i].userNo);
				System.out.print(rental[i].userNo + "\t");
				System.out.print(user.name + "\t" + " ");
				System.out.println(rental[i].isRent);
			}
			System.out.println("===============================================================");
		} else {
			System.out.println("대여 정보가 없습니다.");
		}
	}
	
	// 회원번호를 입력받아서 그 고객이 대여중인 모든 책을 일괄반납처리하기
	public void returnAllRentals(int userNo) {
		Rental[] rental = rentalService.returnRentalbyUserNo(userNo);
		Book book = null;
		
		if (rental[0] == null) {
			System.out.println("고객님이 반납하실 책은 없습니다.");
			return;
		}
		
		for (int i = 0; i < rental.length; i++) {
			if (rental[i] == null) break;
			
			rental[i].isRent = false;
			
			book = bookService.findBookByNo(rental[i].bookNo);
			book.stock += 1;
		}
		System.out.println("### 반납처리가 완료되었습니다.");
	}
		
}
