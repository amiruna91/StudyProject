package date01;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDemo03 {

	public static void main(String[] args) {
		/*
		 *  Date를 지정된 형식의 문자열로 변환하기
		 */
		
		Date today = new Date();
		
		SimpleDateFormat df = new SimpleDateFormat("a h:m:s");
		String formatedDateText1 = df.format(today);
		System.out.println(formatedDateText1);
	}
}

/*
* 패턴			출력내용				출력값
* ------------------------------------------
* yyyy				년					2020
* MM				월					04			 1~9까지 01,02,......09로 표현
* M					월					4
* dd				일					06
* d					일					6
* yyyy-MM-dd							2020-04-06
* yyyy.M.dd								2020.4.06
* yyyy년 M월 dd일						2020년4월6일
* EEEE				요일				월요일
* a					오전/오후			오전
* HH(H)				0~23시
* hh(h)				1~12시
* mm(m)				0~59분
* ss(s)				0~59초
*/