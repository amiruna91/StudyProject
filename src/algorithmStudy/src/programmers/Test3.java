package programmers;

import java.util.Arrays;

public class Test3 {
	
	public static void main(String[] args) {
		/*
		 * K번째 숫자.
		 * [1, 5, 2, 6, 3, 7, 4]	다음과 같이 배열 있고
		 * [[2, 5, 3], [4, 4, 1], [1, 7, 3]]	
		 * 각 배열에 첫번째 인덱스 부터 두번째 인덱스 숫자 만큼 주어진 배열을 자르고 재 정렬한다.
		 * 세번째 인덱스 숫자 를 보고 재정비된 배열에서 그에 맞는 값을 뽑아서 새로온 배열에 담자
		 * 예) [2.5.3] 이면 2번째 부터 5번째 까지 배열를 잘라 내자
		 * 	  [5,2,6,3] 그다음 재정렬 시키면 [2,3,5,6] 그다음 3번째 숫자를 뽑아서 배열에
		 * 	   담으면 된다.   [5]
		 *  최종값 --->  [5, 6, 3]
		 */
		
		int[] array = {1,5,2,6,3,7,4};
		int[][]cmd = {{2,5,3},{4,4,1},{1,7,3}};
		int[] arr3 = new int[cmd.length];
		
		for (int i = 0; i < cmd.length; i++) {
			int[] arr2 = Arrays.copyOfRange(array, cmd[i][0]-1, cmd[i][1]);
			
			//System.out.println(Arrays.toString(arr2));
			
			Arrays.sort(arr2);
			
			//System.out.println(Arrays.toString(arr2));
			//System.out.println(arr2[cmd[i][2]-1]);
			
			arr3[i] = arr2[cmd[i][2]-1];
			
			//System.out.println(Arrays.toString(arr3));
		}
		System.out.println("\n최종 출력: " + Arrays.toString(arr3));
	}
}
