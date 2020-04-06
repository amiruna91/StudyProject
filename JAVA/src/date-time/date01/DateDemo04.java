package date01;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDemo04 {

	public static void main(String[] args) throws ParseException {
		/*
		 *  지정된 날짜 형식으로 작성된 문자열을 Date로 변환하기
		 */
		
		String text = "1991.11.21";
		SimpleDateFormat df = new SimpleDateFormat("yyyy.M.d");
		Date date = df.parse(text);
		System.out.println(date);
	}
}
