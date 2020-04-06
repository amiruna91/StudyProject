package oop1_02;
/**
 * 고객들의 계좌정보를 관리한다.
 * 신규계좌의 등록, 계좌에 대한 입출금/해지 등의 서비스를 제공한다.
 * @author JHTA
 *
 */
public class BankingService {
	
	// 모든 개설된 계좌정보를 저장하는 배열
	Banking[] db = null;
	int savePosition = 0;
	
	// 기본생성자를 사용하는 경우 계좌정보 100개를 저장할 수 있는 배열을 생성함
	BankingService() {
		db = new Banking[100];
	}
	
	// 이 생성자를 사용하는 경우 전달받은 size만큼 계좌정보를 저장할 수 있는 매열을 생성함.
	BankingService(int size) {
		db = new Banking[size];
	}
	
	// 등록된 전체 계좌정보를 출력하는 서비스
	void printAllBanking() {
		System.out.println("=====================================");
		System.out.println("예금주	계좌번호	잔액	가입기간");
		System.out.println("=====================================");
		for (int i = 0; i < savePosition; i++) {
			Banking banking = db[i];
			System.out.print(banking.name + "\t");
			System.out.print(banking.no + "\t\t");
			System.out.print(banking.balance + "\t");
			System.out.println(banking.period + "\t");
		}
		System.out.println("=====================================");
	}
	
	// 신규계좌를 등록하는 서비스
	void addNewBanking(String name, int pwd, long money) {
		Banking banking = new Banking();
		banking.name = name;
		banking.no = "" + (int) (Math.random()*100000 + 10000);
		banking.password = pwd;
		banking.balance = money;
		banking.period = 24;	// 계약기간.
		
		db[savePosition] = banking;
		savePosition++;		
	}
	
	// 게좌번호에 해당하는 계좌정보를 조회(출력)하는 서비스
	void printBankingByNo(String bankingNo) {
		boolean flag = false;
		for (int i = 0; i < savePosition; i++) {
			if (bankingNo.equals(db[i].no)) {
				System.out.println("------- 계좌 정보 ------");
				System.out.println("예 금 주: " + db[i].name);
				System.out.println("계좌번호: " + db[i].no);
				System.out.println("잔    액: " + db[i].balance);
				System.out.println("가입기간: " + db[i].period);
				flag = true;
			}
		}
		
		if (!flag) {
			System.out.println("해당 계좌번호의 정보는 없습니다.");
		}
	}
	
	// 계좌번호, 입금액을 전달받아서 해당 계좌에 입금하는 서비스
	void depositToBanking(String bankingNo, long money) {
		boolean flag = false;
		for (int i = 0; i < savePosition; i++) {
			if (bankingNo.equals(db[i].no)) {
				db[i].balance += money;
				flag = true;
			}
		}
		
		if (!flag) {
			System.out.println("일치하는 계좌번호가 없습니다.");
		}
	}
	
	// 계좌번호, 비밀번호, 출금액을 전달받아서 출금액만큼 반환하는 서비스
	long withdrawFromBanking(String bankingNo, int pwd, long money) {
		Banking foundNo = null;
		long withdrawMoney = 0L;
		for (int i = 0; i < savePosition; i++) {
			if (bankingNo.equals(db[i].no)) {
				foundNo = db[i];
				break;
			}
		}
		
		if (foundNo == null) System.out.println("일치하는 계좌번호가 없습니다.");
 		
		if (foundNo.balance >= money) {
			if (pwd == foundNo.password) {
				foundNo.balance -= money;
				System.out.println("출금이 완료되었습니다.");
				System.out.println(money + "원이 출금 됩니다.");
				System.out.println("현재 잔액은:" + foundNo.balance + "원 입니다.");
				withdrawMoney = money;
			} else {
				System.out.println("비밀번호가 일치하지 않습니다.");
			}
		} else {
			System.out.println("잔액이 부족합니다.");
		}
		return withdrawMoney;
	}
	
	// 계좌번호, 비밀전호를 전달받아서 계좌를 해지하고, 해지금액 전체를 반환하는 서비스
	long closeBanking(String bankingNo, int pwd) {
		long totalMoney = 0L;
		Banking found = null;
		
		for (int i = 0; i < savePosition; i++) {
			if (bankingNo.equals(db[i].no)) {
				found = db[i];
				break;
			}
		}
		
		if (found == null) System.out.println("일치하는 계좌번호가 없습니다.");
		
		if (pwd == found.password) {
			totalMoney = found.balance + (long) (found.balance * Banking.RATE_OF_INTEREST * found.period/12);
			
			// 계약 해지
			found.no = null;
			found.name = null;
			found.password = 0;
			found.balance = 0;
			
			System.out.println("해지가 완료 되었습니다.");
			System.out.println("총 해지 금액은 " + totalMoney + "원 입니다.");
			
		} else {
			System.out.println("비밀번호가 일치하지 않습니다.");
		}
		
		return totalMoney;
	}
}









