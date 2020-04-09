package byteStream;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileCopyDemo05 {

	public static void main(String[] args) throws FileNotFoundException, IOException{
		System.out.println("파일 복사가 시작합니다");
		long startTime = System.currentTimeMillis();
		
		FileInputStream fis = new FileInputStream("c:/files/javaIsSimple.pdf");
		FileOutputStream fos = new FileOutputStream("c:/files/javaIsSimple_copy.pdf");
		
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(fos);
		
		int value = 0;	
		while ((value = bis.read()) != -1) {
			bos.write(value);
		}
		
		bis.close();
		bos.close();
		
		long endTime = System.currentTimeMillis();
		System.out.println("파일 복사가 종료되었습니다.");
		System.out.println("소요시간: " + ((endTime - startTime)/1000 + "초"));
	}
}
