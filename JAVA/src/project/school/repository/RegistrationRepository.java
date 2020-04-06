package com.sample.school.repository;

import java.util.Arrays;

import com.sample.school.vo.Registration;

public class RegistrationRepository {

	private Registration[] db = new Registration[100];
	private int position = 0;
	private int sequence = 50000;
	
	public RegistrationRepository() {
		insertRegistration(new Registration(60003, 40001, false, 95));
		insertRegistration(new Registration(60003, 40002, false, 90));
		insertRegistration(new Registration(60003, 40003, true, 80));
		
		insertRegistration(new Registration(60004, 40001, false, 45));
		insertRegistration(new Registration(60004, 40003, false, 40));
		insertRegistration(new Registration(60004, 40005, false, 80));

		insertRegistration(new Registration(60001, 40008, false, 75));
		insertRegistration(new Registration(60001, 40009, false, 63));
		insertRegistration(new Registration(60001, 40010, true, 62));
		insertRegistration(new Registration(60001, 40011, true, 73));
		
	}
	
	public void insertRegistration(Registration registration) {
		registration.setNo(sequence);
		db[position] = registration;
		
		position++;
		sequence++;
	}
	
	public Registration getRegistrationByNo(int registerationNo) {
		for (int i = 0; i < position; i++) {
			if (db[i].getNo() == registerationNo) {
				return db[i];
			}
		}
		return null;
	}
	
	public Registration[] getAllRegistrationis() {
		return Arrays.copyOfRange(db, 0, position);
	}
}
