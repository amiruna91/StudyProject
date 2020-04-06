package control;

public class WhileDemo5 {

	public static void main(String[] args) {
		
		// 1 + (-2) + 3 + (-4) + 5 +....몇까지 더하면 총합이 100이상이 되는지 구하기
		
		int sum = 0;
		int i = 1;
		
		while (true) {
			sum += (i%2 == 0) ? i * -1 :  i;
			
			if (sum >= 100) break;
			i++;
		}
		System.out.println(i);
	}
}
