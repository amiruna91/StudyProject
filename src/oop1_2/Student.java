package oop1_2;

/**
 *  
 * @author JHTA
 *
 */
public class Student {
	
	// 멤버변수 학생이름, 반, 번호, 국어점수, 영어점수, 수학점수
	String studenNm;
	int classNo;
	int studentNo;
	int kor;
	int eng;
	int math;
	
	// 객체의 국어, 영어, 수학점수를 모두 더해서 총점을 반환하는 메소드
	int totalScore () {
		
		return kor + eng + math;
	}
	
	// 총점을 과목수로 나눈 평균을 반환하는 메소드
	int average () {
		int total = totalScore();
		return total/3;
	}
	// 학생이름, 반, 번호, 국어점수, 영어점수, 수학점수, 총점, 평균을 화면에 출력하는 메소드
	
	void displayStudentInfo() {
		System.out.println("------- 학상정보 -------");
		System.out.println("학색이름: " + studenNm);
		System.out.println("      반: " + classNo);
		System.out.println("번    호: " + studentNo);
		System.out.println("국어점수: " + kor);
		System.out.println("영어점수: " + eng);
		System.out.println("수학점수: " + math);
		System.out.println("총    점: " + totalScore());
		System.out.println("평    균: " + average());
		System.out.println("--------------------------");
	}
	void printInformation() {
		System.out.print(studenNm + "\t\t");
		System.out.print(classNo + " \t");
		System.out.print(studentNo + "\t");
		System.out.print(kor + "\t");
		System.out.print(eng + "\t    ");
		System.out.print(math + "\t   ");
		System.out.print(totalScore() + "\t   ");
		System.out.println(average());
		
	}
}
