package demo01.app;

import java.lang.reflect.Field;

import demo01.annotation.NotNull;

public class NotNullAnnotationProcessor {

	public static void main(String[] args) throws Exception {
		
		User user = new User();
		user.setName("홍길동");
		
		// User객체의 설계도정보가 포함된 Class객체 조회하기
		Class clz = user.getClass();
		
		// User객체에 선언된 멤버변수(필드) 모두 조회하기
		Field[] fields = clz.getDeclaredFields();
		for (Field field : fields) {
			// 필드명 조회하기
			String fieldName = field.getName();
			// 해당 필드가 @NotNull 어노테이션이 부탁되어 있는지 확인하기
			boolean isNotNullField = field.isAnnotationPresent(NotNull.class);
			if (isNotNullField) {
				// 해당 필드에 저장된 값 조회사기
				String value = (String) field.get(user);
				System.out.println("필드명: " + fieldName + ", " + value);
				
				// 필드의 값이 null이라면
				if (value == null) {
					// 필드에 부착된 NotNull 어노테이션 객체 획득하기
					NotNull annotation = field.getAnnotation(NotNull.class);
					// 어노테이션의 구성요서 중 message의 값 조회하기
					String message = annotation.message();
					// 메세지값 화면에 출력하기
					System.out.println("에러 메세지: " + message);
				}
			}
		}
	}
}
