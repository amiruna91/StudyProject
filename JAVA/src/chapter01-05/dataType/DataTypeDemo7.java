package dataType;

public class DataTypeDemo7 {
	
	public static void main(String[] args) {
		//변수 활용하기
		/*
		 *  본인의 이름, 전화번호, 이메일, 나이, 키, 몸무게, 혈액형, 결혼여부를 
		 *  저장하는 변수를 선언하고 해당값을 각 변수에 저장하기
		 *  
		 *  각 변수에 저장된 값을 출력하기
		 */
		
		String name = "문주영";
		String phone = "010-5522-2428";
		String email = "amiruna@naver.com";
		int age = 30;
		double height = 180;
		double weight = 80;
		String bloodType = "A";
		boolean maritalStatus = false;
		
		System.out.println("이름: " + name);
		System.out.println("전화번호: " + phone);
		System.out.println("이메일: " + email);
		System.out.println("나이: " + age);
		System.out.println("키: " + height);
		System.out.println("몸무게: " + weight);
		System.out.println("혈액형: " + bloodType);
		System.out.println("결혼여부: " + maritalStatus);
	
	}
}
