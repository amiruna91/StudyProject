package sort;

import java.util.ArrayList;
import java.util.Collections;

public class SortDemo04 {

	public static void main(String[] args) {
		
		ArrayList<Contact> contacts = new ArrayList<Contact>();
		
		contacts.add(new Contact(10, "류관순", "010-1111-2222", "ryu@gmail.com"));
		contacts.add(new Contact(7, "강감찬", "010-3333-2222", "kang@gmail.com"));
		contacts.add(new Contact(3, "이순신", "010-4444-2222", "lee@gmail.com"));
		contacts.add(new Contact(6, "김유신", "010-5555-2222", "kim@gmail.com"));
		contacts.add(new Contact(2, "윤봉길", "010-1242-2222", "yoon@gmail.com"));
		
		Collections.sort(contacts);
		
		for (Contact c : contacts) {
			System.out.println(c.getNo() + ", " + c.getName() + ", " + c.getTel() + ", " + c.getEmail());
		}
	}
}
