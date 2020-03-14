package programmers;

import java.lang.reflect.Array;
import java.util.Arrays;

public class Test1 {
	
	public static void main(String[] args) {
		/*
		 *  완주하지 못한 사람 찾기
		 *  항상 완주자 명단은 총 명단 보다 1 작다.
		 *  동명이인이 존재 할 수 도 있다.
		 */
		
		String[] allList = {"a", "b", "c", "d","e","e","d"};
		String[] cptList = {"a", "b", "c", "d","e","d"};
		String answer = "";
		int i = 0;
		
		//1> 내가 직접 푼 알고리즘
//		boolean flag = false;
//		
//		for (; i < allList.length; i++) {
//			flag = true;
//			for (int j = 0; j < cptList.length; j++) {	
//				if(allList[i].equals(cptList[j])) {				
//					cptList[j] = null;
//					flag = false;
//					break;
//				} 
//			}
//			if(flag) {
//				answer += all[i];
//			}
//		}
//		System.out.println(rt);
		
		// 효율성이 통과된 알고리즘 풀이
		Arrays.sort(allList);
		Arrays.sort(cptList);
		
		for (; i < cptList.length; i++) {
			if (!allList[i].equals(cptList[i])) {
				answer = allList[i];
			}
		}
		answer = allList[i];
		System.out.println(answer);
	}
}
