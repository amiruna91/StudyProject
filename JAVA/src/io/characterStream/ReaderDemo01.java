package characterStream;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class ReaderDemo01 {

	public static void main(String[] args) throws IOException {
		
		FileReader fr = new FileReader("c:/files/데이터.txt");
		BufferedReader br = new BufferedReader(fr);
		
		int totalOrder = 0;
		String text = null;
		while ((text = br.readLine()) != null) {
			if (!text.isEmpty()) {
				String[] items = text.split(",");
				totalOrder += Integer.parseInt(items[4]);
			}
		}
		System.out.println("총 구매금액: " + totalOrder);
		
		br.close();
		
	}
}
