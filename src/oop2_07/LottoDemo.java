package oop2_07;

import java.util.Arrays;

public class LottoDemo {

	public static void main(String[] args) {
		
		Lotto lotto = new Lotto();
		
		for (int i = 1; i <= 5; i++) {
			int [] numbers1 = lotto.generateNumber();
			System.out.println(Arrays.toString(numbers1));
		}
	}
}
