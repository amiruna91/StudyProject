package oop2_08;

public class Employee extends Person{

	private String dept;
	private String position;
	private int salary;
	
	public Employee() {
		super();	// super()는 부모클래스의 기본 생성자를 실행시킨다.
					// 모든 생성자 메서드에는 부모클래스의 기본 생성자를 실행시키는
					// super(); 수행문이 자동으로 추가된다.
					// 개발자가 다른 super(값, 값, ...) 메서드를 실행시키는 수행문을 추가하면
					// super(); 수행문은 추가되지 않는다.
	}
	
	public Employee(String name, String email, String dept, String position, int salary) {
		/*
		 	super() 메서드는 부모의 생성자를 가르킨다.
		 	자식클래스의 생성자 안에서 부모클래스의 생성자를 실행할 때만 사용한다.
		 	super() 메서드는 메서드의 첫번째 수행문으로만 사용할 수 있다.
		 	
		 	super(name, email)은
		 	Class Person {
		 		String name;
		 		String email;
		 		
		 		public Person() {}			<---- Emplolee에서 super()로 접근할 수 있다.
		 		
		 		public Person(String name, String mail) {    <---- emplolee에서 super(String, String)으로 
		 			this.name = name;							  접근할 수 있다.
		 			this.email = email;
		 	}
		 	 
		 
		 */
		super(name, email);	// 항상 첫번째 라인에 위히해야 한다.
		this.dept = dept;
		this.position = position;
		this.salary = salary;
	}
	
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("### Employee의 printInfo() ###");
		System.out.println("부서: " + dept);
		System.out.println("직위: " + position);
		System.out.println("급여: " + salary);
		
	}
}
