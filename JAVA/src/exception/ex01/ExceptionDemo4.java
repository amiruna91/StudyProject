package ex01;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ExceptionDemo4 {

	public static void main(String[] args) {
		
		try {
			URL url = new URL("http://blogfiles.naver.net/MjAxOTExMTdfMTEx/MDAxNTczOTk4OTk4NjA0.fhtQBWZ3uaXAikDamoL2YL"
					+ "B5d-wgv-Kd8Bhj569sS44g.XMGtX_j-zbPBUf7yTcaFsPWLtisGCmd3jH6FrWvp4dog.JPEG.jywanna1/1045F603-BB85"
					+ "-4125-ABF8-551DECAB83E1.jpeg");
			InputStream in = url.openStream();
			
			FileOutputStream out = new FileOutputStream("C:/files/star.png");
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = in.read(buf)) != -1) {
				out.write(buf, 0, len);
			}
			out.close();
			
		} catch (MalformedURLException e) {
			//e.printStackTrace();
			String err = e.getMessage();
			System.out.println("에러 메세지: " + err);
		} catch (FileNotFoundException e) {
			//e.printStackTrace();			
			String err = e.getMessage();
			System.out.println("에러 메세지: " + err);
		} catch (IOException e) {
			//e.printStackTrace();
			String err = e.getMessage();
			System.out.println("에러 메세지: " + err);
			
		}
	}
}
