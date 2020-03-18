package oop1;

import java.util.Scanner;

public class OrderDemo1 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		Order[] order = new Order[100];
		int savePoint = 0;

		while (true) {
			//메뉴 출력
			System.out.println();
			System.out.println("=====================================");
			System.out.println("1.조회   2.검색   3.입력   4.종료");
			System.out.println("=====================================");
			System.out.print("번호를 입력하세요:");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[고객 주문내용 조회]");
				
				if (savePoint == 0){
					System.out.println("고객 주문내용이 존재하지 않습니다.");
				} else {
					System.out.println("고객명\t고개등급\t총구매금액\t적립포인트\t사은품");
					System.out.println("============================================================");
					
					for (int i = 0; i < savePoint; i++) {
						System.out.print(order[i].name + "\t");
						System.out.print(order[i].grade + "\t");
						System.out.print(order[i].price + "\t");
						System.out.print(order[i].point + "\t");
						System.out.println(order[i].gift);
					}
				}				
			} else if (menuNo == 2) {
				System.out.println("[고객 주문정보 검색]");
				
				System.out.print("검색조건을 입력하세요(N[고객정보] or G[사은품]):");
				String option = scanner.next();
				System.out.println("검색내용을 입력하세요:");
				String text = scanner.next();
				System.out.println("고객명\t고개등급\t총구매금액\t적립포인트\t사은품");
				System.out.println("============================================================");
				
				for (int i = 0; i < savePoint; i++) {
					Order o = order[i];
					
					boolean isFound = false;
					if (option.equals("N") && text.equals(o.name)) {
						isFound = true;
					} else if (option.equals("G") && text.equals(o.gift)) {
						isFound = true;
					}	
					
					if (isFound) {
						System.out.print(order[i].name + "\t");
						System.out.print(order[i].grade + "\t");
						System.out.print(order[i].price + "\t");
						System.out.print(order[i].point + "\t");
						System.out.println(order[i].gift);
					}
				}				
			} else if (menuNo == 3) {
				System.out.println("[고객정보 입력]");
				
				System.out.print("이름을 입력하세요:");
				String name = scanner.next();
				System.out.print("고객등급을 입력하세요:");
				String grade = scanner.next();
				System.out.print("총 구매금액을 입력하세요:");
				int price = scanner.nextInt();
				
				Order o = new Order();
				
				o.name = name;
				o.grade = grade;
				o.price = price;
				
				if (grade.equals("클래식")) {
					o.point = (int) (price*0.01);
				} else if (grade.equals("베스트")) {
					o.point = (int) (price*0.02);
				} else if (grade.equals("에이스")) {
					o.point = (int) (price*0.03);
				} else if (grade.equals("프리미어")) {
					o.point = (int) (price*0.05);
				}
				
				if (price >= 5000000) {
					o.gift = "숙박권";
				} else if (price >= 1000000) {
					o.gift = "상품권";
				} else if (price >= 500000) {
					o.gift = "할인권";
				} else {
					o.gift = "주차권";
				}
				order[savePoint] = o;
				savePoint++;
			} else if (menuNo == 4) {
				System.out.println("상품권관리 프로그램을 종료합니다.");
				break;
			}
		}
		scanner.close();
	}
}
