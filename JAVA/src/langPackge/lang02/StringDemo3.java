package lang02;

import java.util.StringJoiner;

public class StringDemo3 {

	public static void main(String[] args) {
		
		// String.join(CharSequence 구분자, CharSequence... element) <- 가변길이 매개변수
		// 전달받은 엘리먼트들을 지정된 구분자로 이어붙인다.
		
		String[] names = {"김유신", "이순신", "강감찬",	"류관순"};
		String text1 = String.join(";", names);
		System.out.println(text1);
		
		String text2 = String.join("-", "자바","파이썬","루비", "펄", "고", "줄리아", "코툴린");
		System.out.println(text2);
		
		// StringJoiner
		// new StringJoiner(CharSequence 구분자)
		// new StringJoiner(CharSequence 구분자, CharSequence 접두사, CharSequence 접미사)
		// void add(CharSequence item) : StringJoiner에 아이텀을 추가한다.
		// String toString() : StringJoiner에 추가된 아이템을 전부 이어붙여서 문자열로 반환한다.
		String[] fileNames = {"휴가신청서", "병가신청서", "사직서"};
		StringJoiner joiner1 = new StringJoiner(",");
		for (String name : fileNames) {
			joiner1.add(name);
		}
		String text3 = joiner1.toString();
		System.out.println(text3);
	}
}
