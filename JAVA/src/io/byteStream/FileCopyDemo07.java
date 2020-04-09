package byteStream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.commons.io.IOUtils;

public class FileCopyDemo07 {

	public static void main(String[] args) throws IOException {
		
		
		URL url = new URL("http://blogfiles.naver.net/MjAxOTEyMDZfMjMy/MDAxNTc1NjE0NzM1OTI4."
				+ "VLqf5AKv4k9yNbDA-UiprNcpxUTkzQhhzGqT7vHF22Ig.TozoAbT7mJyG6rsmxS7qs3W6XjST"
				+ "uhvCa0cxr9mHzEog.JPEG.farbemaria/1_%288%29.jpg");
		
		InputStream is = url.openStream();
		FileOutputStream fos = new FileOutputStream("c:/files/아이유.jpg");
		
		IOUtils.copy(is, fos);
	}
}
