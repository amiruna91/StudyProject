package ex02;

public class HTAException extends RuntimeException{

	public HTAException() {
		
	}
	
	public HTAException(String message) {
		super(message);
	}
	
	public  HTAException(Throwable cause) {
		super(cause);
	}
	
	public HTAException(String message, Throwable cause) {
		super(message, cause);
	}
}
