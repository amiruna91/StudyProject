package control;

public class Lotto3 {

	public static void main(String[] args) {
		// 난수 -> 있는지 확인 -> 있다.	->	i-- 
		//				 	-> 없다.	->	i = 1 일때는 n1에 저장
		//							->  i = 2 일때는 n2에 저장

		int n1 = 0;	//첫번째 로또번호
		int n2 = 0;	//두번째 로또번호
		int n3 = 0;	//세번째 로또번호
		int n4 = 0;	//네번째 로또번호
		int n5 = 0;	//다섯번째 로또 번호
		int n6 = 0;	//여섯번째 로또 번호
		
		for (int i=1; i<=6; i++) {
			int num = (int) (Math.random() * 45 + 1);
			
			// num이 n1과 일치하거나 n2와 일치하거나...n6와 일치하면(OR결합)
			if(num == n1 || num == n2 || num == n3 || num == n4 || num == n5 || num == n6) {
				i--;
			} else if (i == 1) {
				n1 = num;
			} else if (i == 2) {
				n2 = num;
			} else if (i == 3) {
				n3 = num;
			} else if (i == 4) {
				n4 = num;
			} else if (i == 5) {
				n5 = num;
			} else if (i == 6) {
				n6 = num;
			}
		}
		System.out.println(n1 + " " + n2 + " " + n3 + " " + n4 + " " + n5 + " " + n6);
		
	}
}
