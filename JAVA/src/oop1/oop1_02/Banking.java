package oop1_02;

/**
 * 계좌에 대한 입금기능, 출금기능, 조회기능, 비밀번호 변경기능, 해지기능을 제공하는 클래스다.
 * @author JHTA
 *
 */
public class Banking {
	
	static final double RATE_OF_INTEREST = 0.021;
	String name;
	String no;
	int password;
	long balance;
	int period;
	
	// 입금기능은 입금액을 전달받아서 잔액을 증가시킨다.
	void deposit(long money) {
		balance += money;
		System.out.println("입금이 완료되었습니다.");
		System.out.println("현재 잔액은: " + balance + "원 입니다.");
	}
	
	// 출금기능은 출금액과 비밀번호를 전달받아서 비밀번호가 일치하는 경우
	// 잔액을 출금액만큼 감소시키고, 출금액에서 수수료(1300원)를 뺀 금액을 반환한다.
	long withdraw(long money, int pwd) {
		long withdrawMoney = 0L;
		
		if (balance >= money + 1300) {
			if (password == pwd) {
				balance -= (money + 1300);
				withdrawMoney = money;
				System.out.println("출금이 완료되었습니다.");
				System.out.println("현재 잔액은: " + balance + "원 입니다.");
			} else {
				System.out.println("비밀번호가 일치하지 않습니다.");
			}
		} else {
			System.out.println("잔액이 부족합니다.");
		}
		return withdrawMoney;
	}
	
	// 조회기능은 소유주, 계좌번호, 현재잔액을 화면에 출력한다.
	void display() {
		System.out.println("--------------- 계좌정보 ---------------");
		System.out.println("예 금 주: " + name);
		System.out.println("계좌번호: " + no);
		System.out.println("현재잔액: " + balance + "원");
		System.out.println("적금기간: " + period + "개월");
		System.out.println("금    리: " + Banking.RATE_OF_INTEREST *100 + "%");
		System.out.println("-----------------------------------------");
	}
	
	// 비밀번호 변경기능은 이전 비밀번호와 새 비밀번호를 전달받아서 이전 비밀번호가 일치하는 경우에만
	// 비밀번호를 새 비밀번호로 바꾼다.
	void changePassword(int oldPwd, int newPwd) {
		if (password == oldPwd) {
			password = newPwd;
			System.out.println("새 비밀번호로 변경되었습니다.");
		} else {
			System.out.println("비밀번호가 일치하지 않습니다.");
		}
	}
	
	// 해지기능은 비밀번호를 전달 받아서 비밀번호가 일치하는 경우에만 계좌를 해지하고, 금리를 적용한 
	// 총해지금액을 반환한다.
	long close(int pwd) {
		long finalMoney = 0L;
		
		if (password == pwd) {
			finalMoney = balance +(long) (balance * Banking.RATE_OF_INTEREST * period/12);
			
			// 계좌정보 폐기
			name = null;
			no = null;
			password = 0;
			balance = 0L;
			period = 0;
			System.out.println("해지가 완료되었습니다.");
		} else {
			System.out.println("비밀번호가 일치하지 않습니다.");
		}
		return finalMoney;
	}
}














