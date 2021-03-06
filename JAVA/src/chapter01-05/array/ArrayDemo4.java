package array;

public class ArrayDemo4 {

	public static void main(String[] args) {
		
		// 배열의 값 조회/출력하기
		// Enhanced-for문 (향상된 for문)
		//	- 배열, Collection(Set, List)와 같은 값을 여러개 저장하는 저장소에서 각 요소의 값을 하나씩 조회할 때 
		//	  사용하는 for문이다.
		//	- 반드시, 배열, Collection(Set, List)를 대상으로만 사용해야 한다.
		//	- for (타입 변수 : 배열) {
		//			수행문;
		//	  }
		//		* 지정된 배열의 처음부터 끝까지 저장된 값을 하나씩 순서대로 가져와서 변수에 저장하고 수행문을
		//		  실행한다.
		//	  	* 배열 : 조회할 값을 가지고 있는 배열
		//		* 타입 : 배열의 저장된 값의 타입 
		//		* 변수 : 배열에 저장된 값이 
		int[] scores = {60, 70, 80};
		for (int num : scores) {
			System.out.println(num);
		}
		
		String[] names = {"김유신", "강감찬", "홍길동"};
		for (String name : names) {
			System.out.println(name);
		}
	}
}
