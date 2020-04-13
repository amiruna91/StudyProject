package demo01.person;

public class PersonDemo {
	
	// 학생, 대학생 대학원생이 파리미터 타입으로 저장된 Course객체만 전달받는다.
	public static void addStudentCourse(Course<? extends Student> c) {}
	
	// 직장인, 일반사람이 파라미터 타입으로 지정된 Course객체만 전달받는다.
	public static void addWorkAndPersonCourse(Course<? super Worker> c) {}
	
	public static void main(String[] args) {
		/*
		 * 와일드 카드 제네릭 타입제한
		 * 		<? extends T>	상위제한	T와 T의 자손들
		 * 		<? super T>		하위제한	T와 T의 조상들
		 * 		<?>				제한없음	<? extends Object>와 동일
		 * 	* 단, 와일드카드를 사용해서 타입제한을 하기위해서는 해당 클래스가
		 * 	 제네릭타입 클래스여야 한다.
		 */
		
		Course<Student> c1 = new Course<Student>("전공과정");
		Course<PostGraduateStudent> c2 = new Course<PostGraduateStudent>("석사과정");
		Course<Worker> c3 = new Course<Worker>("직장인과정");
		Course<Person> c4 = new Course<Person>("일반인과정");
		
		addStudentCourse(c1);
		addStudentCourse(c2);
//		addStudentCourse(c3);	// c3는 파리미터 타입이 Worker로 지정되어 있어서 전달불가
//		addStudentCourse(c4);	// c4는 파리미터 타입이 Person으로 지정되어 있어서 전달불가
		
//		addWorkAndPersonCourse(c1);		// c1는 파리미터 타입이 Student로 지정되어 있어서 전달불가
//		addWorkAndPersonCourse(c2);		// c2는 파리미터 타입이 PostGraduateStudent로 지정되어 있어서 전달불가
		addWorkAndPersonCourse(c3);
		addWorkAndPersonCourse(c4);
	}
}
