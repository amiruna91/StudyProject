package control;

public class RandomDemo {

	public static void main(String[] args) {
		System.out.println("주사위 놀이하기");
		
		// 주사위는 1 ~ 6사이의 정수값이 랜덤하게 나와야 한다.
		// 최소값: 1 최대값: 6
		// (int) (Math.random() * 최대값 + 최소값)
		int ran = (int) (Math.random() * 6 + 1);
		System.out.println(ran);
	}
}
