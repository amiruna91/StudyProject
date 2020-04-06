package oop2_09;

// 인터페이스 -> 기획서
// 모든 종류의 모니터가 반드시 갖춰야 하는 기능을 정의한다.
// 모든 종류의 모니터에 대한 표준(사용방법의 표준)을 정한다.
public interface Monitor {

	public abstract void on();
	void off();						// public abstract는 생략가능
	void display();					// public abstract는 생갹가능
}
