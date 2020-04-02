package ex02;

public class UserRepository {

	private User[] db = new User[100];
	private int position = 0;
	
	public void insert(User user) {
		db[position] = user;
		position++;
	}
	
	public User getUserById(String userId) {
		for (int i = 0; i < position; i++) {
			if (db[i].getId().equals(userId)) {
				return db[i];
			}
		}
		return null;
	}
}
