package oop1_03;

public class ArgSample {

	void changeValue(int num) {
		
		System.out.println("changeValue()에서의 before num ---->" + num);
		num = 150;
		System.out.println("changeValue()에서의 after num ---->" + num);
	}
	
	// 참조형 타입의 값을 매개변수로 전달받는 경우
	
	void changeDataValue(Data data) {
		System.out.println("changeDataValue()에서 changeValue 수행 전 data.num ---> " + data.num);
		data.num = 300;
		System.out.println("changeDataValuen()에서 changeValue 수행 후 data.num ---> " + data.num);
	}
}
