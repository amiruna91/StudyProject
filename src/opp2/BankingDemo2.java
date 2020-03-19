package oop2;

import java.util.Scanner;

public class BankingDemo2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Banking[] banks = new Banking[50];
		int savePoint = 0;
		
		/*
		 *	BankingDemo2클래스를 작성하시오.
    		BankingDemo2에 Banking객체를 여러 개 담는 배열을 생성하시오.
    		BankingDemo2클래스에서는 Banking클래스를 이용해서 신규계좌개설, 입금하기, 출금하기, 비번변경하기, 
    		해지하기를 서비스하기 
		 */
		while (true) {
			System.out.println();
			System.out.println("=======================================================");
			System.out.println("1.신규  2.조회  3.입금  4.출금  5.비번변경  6.해지  0.종료");
			System.out.println("=======================================================");
			System.out.print("번호를 입력하세요:");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println();
				System.out.println("----------- 계좌 신규 개설 ----------");
				Banking bank = new Banking();
				
				//  이름, 계좌번호, 비밀번호, 잔액, 가입기간을 입력받아서 Bankig에 담고, 배열에 저장하시오
				System.out.println("이름을 입력하세요:");
				bank.name = scanner.next();
				System.out.println("계좌번호를 입력하세요:");
				bank.no = scanner.next();
				System.out.println("비밀번호를 입력하세요:");
				bank.password = scanner.nextInt();
				System.out.println("잔액을 입력하세요:");
				bank.period = scanner.nextInt();
				System.out.println("가입기간을 입력하세요:");
				bank.period = scanner.nextInt();
				
				banks[savePoint] = bank;
				savePoint++;
			} else if (menuNo == 2) {
				// BankingDemo2에서 조회를 선택하면
			    // 계좌번호를 입력받아서 배열에 저장된 계좌중에서 계좌번호가 일치하는 Banking을 찾아서 정보를 
			    // 표시하시오
				System.out.println("----------- 계좌정보 조회 -----------");
				System.out.println("계좌번호를 입력하세요:");
				String noStr = scanner.next();
				for (int i = 0; i < savePoint; i++) {
					if (noStr.equals(banks[i].no)) {
						banks[i].display();
					}
				}
			} else if (menuNo == 3) {
				// BankingDemo2에서 입금을 선택하면
			    // 계좌번호, 입금액을 입력받아서 배열에 저장된 계좌중에서 계좌번호가 일치하는 Banking을 
				// 찾아서 입금처리 하시오.
				System.out.println("---------- 입금 ---------");
				System.out.println("계좌번호를 입력하세요:");
				String noStr = scanner.next();
				System.out.println("입금액을 입력하세요:");
				int money = scanner.nextInt();
				
				for (int i = 0; i < savePoint; i++) {
					if (noStr.equals(banks[i].no)) {
						banks[i].deposit(money);
					}
				}
			} else if (menuNo == 4) {
				/*
				 * BankingDemo2에서 출금을 선택하면
      			   계좌번호, 출금액, 비밀번호를 입력받아서 배열에 저장된 계좌중에서 계좌번호가 일치하는 
      			   Banking을 찾아서 출금처리 하시오. 
				 */
				
				System.out.println("------------ 출금 -----------");
				System.out.println("계좌번호를 입력하세요:");
				String noStr = scanner.next();
				System.out.println("출금액을 입력하세요:");
				int money = scanner.nextInt();
				System.out.println("비밀번호을 입력하세요:");
				int pwd = scanner.nextInt();
				
				for (int i = 0; i < savePoint; i++) {
					if (noStr.equals(banks[i].no)) {
						banks[i].withdraw(money, pwd);
					}
				}
			} else if (menuNo == 5) {
				/*
				 *  BankingDemo2에서 비번변경을 선택하면
      				계좌번호, 이전비밀번호, 새 비밀번호를 입력받아서 배열에 저장된 계좌중에서 
      				계좌번호가 일치하는 Banking을 찾아서 변경처리 하시오.
				 */
				
				System.out.println("------------ 비밀 번호 변경 -----------");
				System.out.println("계좌번호를 입력하세요:");
				String noStr = scanner.next();
				System.out.println("이전 비밀번호를 입력하세요:");
				int oldPwd = scanner.nextInt();
				System.out.println("새 비밀번호을 입력하세요:");
				int newPwd = scanner.nextInt();
				
				for (int i = 0; i < savePoint; i++) {
					if (noStr.equals(banks[i].no)) {
						banks[i].changePassword(oldPwd, newPwd);
					}
				}
			} else if (menuNo == 6) {
				/*
				 *  BankingDemo2에서 해지를 선택하면
      				계좌번호, 비밀번호를 입력받아서 배열에 저장된 계좌중에서 계좌번호가 일치하는 
      				Banking을 찾아서 출금처리 하시오. 
				 */
				System.out.println("------------ 계좌 해지 -----------");
				System.out.println("계좌번호를 입력하세요:");
				String noStr = scanner.next();
				System.out.println("이전 비밀번호를 입력하세요:");
				int pwd = scanner.nextInt();
				
				for (int i = 0; i < savePoint; i++) {
					if (noStr.equals(banks[i].no)) {
						banks[i].close(pwd);
					}
				}
			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
		scanner.close();
	}
}
