package characterStream;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ReaderDemo02 {

	public static void main(String[] args) throws IOException {
		
		Scanner scanner = new Scanner(System.in);
		List<Book> books = new ArrayList<Book>();
		
		BufferedReader reader = new BufferedReader(new FileReader("c:/files/데이터.txt"));
		String text = null;
		while ((text = reader.readLine()) != null) {
			if (!text.isEmpty()) {
				String[] items = text.split(",");
				// 유니코드65279 BOM UTF-8 형식
				for (String a : items[0].split("")) {
					int b = a.charAt(0);
					System.out.println("a:" + b);
				}
				int no = Integer.parseInt(items[0]);
				String title = items[1];
				String writer = items[2];
				String publisher = items[3];
				int price = Integer.parseInt(items[4]);
				
				Book book = new Book();
				book.setNo(no);
				book.setTitle(title);
				book.setWriter(writer);
				book.setPublisher(publisher);
				book.setPrice(price);
				
				books.add(book);
			}
		}
		reader.close();
		
		// 데이터.txt의 도서정보를 읽어서 Book객체에 담고, ArrayList에 Book객체 저장하기.
		while (true) {
			System.out.println("=============================================");
			System.out.println("1.도서내역조회  2.상세조회  0.종료");
			System.out.println("=============================================");
			
			System.out.print("메뉴번호를 입력하세요: ");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[도서 목록]");
				
				System.out.printf("%-3d %-20s %-15s %-7s\n", "번호", "제목", "저자", "출판사", "가격");
				for (Book book : books) {
					int no = book.getNo();
					String title = book.getTitle();
					String writer = book.getWriter();
					int price = book.getPrice();
					
					System.out.printf("%-3d %-20s %-15s %-7s\n", no, title, writer, price);
				}
			} else if (menuNo == 2) {
				System.out.println("[도서정보 보기]");
				System.out.print("책번호를 입력하세요: ");
				int bookNo = scanner.nextInt();
				
				for (Book book : books) {
					if (book.getNo() == bookNo) {
						System.out.println("번호  : " + book.getNo());
						System.out.println("제목  : " + book.getTitle());
						System.out.println("저자  : " + book.getWriter());
						System.out.println("출판사: " + book.getPublisher());
						System.out.println("가격  : " + book.getPrice());
					}
				}
			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다");
				break;
			}
		}
		scanner.close();
	}
}
