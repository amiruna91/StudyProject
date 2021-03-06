package date01;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class DateDemo05 {

	public static void main(String[] args) throws ParseException {
		
		// 기념일 계산기
		Date today = new Date();
		final long ONE_DATE_TIME = 60*60*24*1000;
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy.M.d");
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("-----------------------------------------");
		System.out.println("1.몇일째 날?  2.그날은 몇일까?");
		System.out.println("-----------------------------------------");
		
		System.out.print("메뉴를 선택하세요: ");
		int menuNo = scanner.nextInt();
		
		if (menuNo == 1) {
			System.out.print("기념일을 입력하세요(입력예: 2001.4.6) : ");
			String text = scanner.next();
			Date memoriaDay = df.parse(text);
			
			long todayTime = today.getTime();
			long memoriaDayTime = memoriaDay.getTime();
			
			long dayCount = (todayTime - memoriaDayTime)/ONE_DATE_TIME;
			System.out.println("오늘은 " + dayCount +"일째 날입니다.");
			
			
		} else if (menuNo == 2) {
			System.out.print("날짜를 입력하세요(입력예: 100) : ");
			int dayCount = scanner.nextInt();
			
			long todayTime = today.getTime();
			long dayTime = ONE_DATE_TIME*dayCount;
			
			Date futureDay = new Date(todayTime + dayTime);
			String text = df.format(futureDay);
			System.out.println("오늘부터 [" + dayCount + "]일째는 " + text + "입니다.");
		}
		
		
		
	}
}
