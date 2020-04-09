package byteStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputStreamDemo01 {

	public static void main(String[] args) throws FileNotFoundException, IOException{
		
		FileOutputStream fos = new FileOutputStream("c:/files/sample2.txt");

		fos.write('h');
		fos.write('e');
		fos.write('l');
		fos.write('l');
		fos.write('o');
		fos.write(',');
		fos.write(' ');
		fos.write('j');
		fos.write('a');
		fos.write('v');
		fos.write('a');
		
		fos.close();
	}
}
