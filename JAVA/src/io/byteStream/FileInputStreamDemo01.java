package byteStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileInputStreamDemo01 {

	public static void main(String[] args) throws FileNotFoundException, IOException{
		
		FileInputStream fis = new FileInputStream("c:/files/sample.txt");
		
		int value1 = fis.read();
		int value2 = fis.read();
		int value3 = fis.read();
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		
		fis.close();
		
	}
}
