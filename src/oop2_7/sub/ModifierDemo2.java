package oop2_7.sub;

public class ModifierDemo2 {

	public static void main(String[] args) {
		
		Modifier m = new Modifier();
		
		// Modifier과 같은 패키지에 위치한 ModifierDemo2에서는 
		// default, protected, public 접근체한이 지정된 멤버는 접근할 수 있다.
		m.b = 10;
		m.c = 10;
		m.d = 10;
	}
}
