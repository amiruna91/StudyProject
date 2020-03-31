package oop1_02;

import java.text.DecimalFormat;

public class MyUtils {

	public static String numberWithComma(long number) {
		DecimalFormat df = new DecimalFormat("#,###");
		
		return df.format(number);
	}
}
