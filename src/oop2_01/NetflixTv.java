package oop2_01;

public class NetflixTv extends IPTv{

	String membership;
	
	void watchMovie(String title) {
		if ("basic".equals(membership)) {
			System.out.println("표준 화질로 시청중");
		} else if ("standard".equals(membership)) {
			System.out.println("HD화질로 시청중");
		} else if ("premium".equals(membership)) {
			System.out.println("UHD 4K화질로 시청중");
		}
	}
}
