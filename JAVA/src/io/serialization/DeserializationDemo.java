package serialization;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

public class DeserializationDemo {

	public static void main(String[] args) 
			throws FileNotFoundException, IOException, ClassNotFoundException {
		
		FileInputStream fis = new FileInputStream("c:/files/user.sav");
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		User user = (User) ois.readObject();

		System.out.println("번    호: " + user.getNo());
		System.out.println("아 이 디: " + user.getUserId());
		System.out.println("비밀번호: " + user.getPassword());
		System.out.println("전화번호: " + user.getTel());
		System.out.println("이 메 일: " + user.getEmail());
		
		ois.close();

	}
}
