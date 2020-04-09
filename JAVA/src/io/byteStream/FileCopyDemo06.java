package byteStream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

public class FileCopyDemo06 {

	public static void main(String[] args) throws IOException{
		
		FileInputStream fis = new FileInputStream("c:/files/javaIsSimple.pdf");
		FileOutputStream fos = new FileOutputStream("c:/files/javaIsSimple_copy2.pdf");
		
		IOUtils.copy(fis, fos);
	}
}
