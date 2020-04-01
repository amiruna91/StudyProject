package ex01;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ExceptionDemo3 {

	public static void main(String[] args) {
		
		try {
			URL url = new URL("http://blogfiles.naver.net/MjAxOTExMTdfMTEx/MDAxNTczOTk4OTk4NjA0.fhtQBWZ3uaXAikDamoL2YLB"
					+ "5d-wgv-Kd8Bhj569sS44g.XMGtX_j-zbPBUf7yTcaFsPWLtisGCmd3jH6FrWvp4dog.JPEG.jywanna1/1045F603-BB85-"
					+ "4125-ABF8-551DECAB83E1.jpeg");
			InputStream in = url.openStream();
			System.out.println("해당 인터넷 리소스와 연결이 완료되었습니다.");
			
			System.out.println("사진 저장을 시작합니다.");
			FileOutputStream out = new FileOutputStream("C:/files/star.png");
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = in.read(buf)) != -1) {
				out.write(buf, 0, len);
			}
			out.close();
			
			System.out.println("사진이 저장이 완료되었습니다.");
			
		} catch (MalformedURLException e) {
			System.out.println("올바른 URL이 아닙니다.");
		} catch (IOException e) {
			System.out.println("해당 인터넷 리소스를 읽어오는 도중 오류가 발생하였습니다.");
		}
	}
}
