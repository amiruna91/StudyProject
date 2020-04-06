package oop2_11;

public interface HTAIterator {
	
	/**
	 * 데이터를 꺼내서 반환한다.
	 * @return 자료구조에 저장된 데이터
	 */
	String next();
	
	/**
	 * 다음에 꺼낼 데이터가 있는지 여부를 알려준다.
	 * @return 다음에 꺼낼 데이터 있으면 true, 없으면 false를 반환한다.
	 */
	boolean hasNext();
}
