package map;

import java.util.ArrayList;
import java.util.HashMap;

public class HashMapDemo04 {

	public static void main(String[] args) {
		
		ArrayList<String> addresses = new ArrayList<String>();
		addresses.add("서울특별시 종로구 봉익동");
		addresses.add("경기도 부천시 윈미구");
		addresses.add("서울특별시 서대문구 북가좌동");
		addresses.add("경기도 고양시 ");
		addresses.add("경상북도 구미시");
		addresses.add("경상남도 김해시");
		addresses.add("경상남도 창원시");
		addresses.add("경상남도 진주시");
		addresses.add("경상북도 영주시");
		addresses.add("경상북도 포항시");
		addresses.add("인천직할시 부형구");
		addresses.add("경기도 성남시");
		
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		for (String addr : addresses) {
			int endpoint = addr.indexOf(" ");
			String city = addr.substring(0, endpoint);
			
			if (result.containsKey(city)) {
				int count = result.get(city);
				result.put(city, count+1);
			} else {
				result.put(city, 1);
			}
		}
	}
}
