package ex01;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ExceptionDemo5 {

	public static void main(String[] args) {
		try {
			ExceptionDemo5.saveImage("http://blogfiles.naver.net/MjAxOTEyMDZfNTgg/MDAxNTc1NjMzNTYyNTIz."
					+ "HvBOiFNA2r954L1g1CQW79cDihiJSePgOtU2nR8Gml8g.InJjog7XBckUTu2Gs5246ZkcAmmUTpeW4w3AZuxhpJUg."
					+ "JPEG.lee130101/%BE%C6%C0%CC%C0%AF%C5%A9%B7%D3%B8%DE%C0%CE%C4%C6_RGB-2%28%B7%CE%B0%ED%29.jpg");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 예외처리를 saveImage() 메서드를 호출한 측에 위임하기
	//		throws 키워드를 사용하면 해당 메서드안에서 발생이 예상되는 예외에 대한 처리를 이
	//		메서드를 호출한 측에 떠넘길 수 있다.
	private static void saveImage(String path) throws MalformedURLException, IOException {
		URL url = new URL(path);
		InputStream in = url.openStream();
		
		FileOutputStream out = new FileOutputStream("c:/files/iu.jpg");
		
		ExceptionDemo5.copy(in, out);
	}
	
	private static void copy(InputStream in, OutputStream out) throws IOException {
		byte[] buf = new byte[1024];
		int len = 0;
		while ((len = in.read(buf)) != -1) {
			out.write(buf, 0, len);
		}
		out.close();
	}
}
