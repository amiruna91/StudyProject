package com.sample.school.service;

import com.sample.school.repository.CourseRepository;
import com.sample.school.repository.ProfessorRepository;
import com.sample.school.repository.RegistrationRepository;
import com.sample.school.repository.SubjectRepository;
import com.sample.school.repository.StudentRepository;
import com.sample.school.vo.Course;
import com.sample.school.vo.Professor;
import com.sample.school.vo.Registration;
import com.sample.school.vo.Student;
import com.sample.school.vo.Subject;

public class SchoolServiceImple implements SchoolService {

	private CourseRepository courseRepo = new CourseRepository();
	private ProfessorRepository professorRepo = new ProfessorRepository();
	private RegistrationRepository registrationRepo = new RegistrationRepository();
	private SubjectRepository subjectRepo = new SubjectRepository();
	private StudentRepository userRepo = new StudentRepository();
	
	// 신규교수 등록
	@Override
	public void addNewProfessor(Professor professor) {
		Professor[] allPro = professorRepo.getAllProfessor();
		
		for (int i = 0; i < allPro.length; i++) {
			if (allPro[i].getEmail().equals(professor.getEmail())) {
				System.out.println("이메일이 동일한 교수정보가 있습니다.");
				return;
			}
		}
		
		professorRepo.insertProfessor(professor);
		System.out.println("### 신규등록이 완료되었습니다");
	}
	
	// 신규과목 등록
	@Override
	public void addNewSubject(Subject subject) {
		Subject[] allSub = subjectRepo.getAllSubject();
		
		for (int i = 0; i < allSub.length; i++) {
			if (allSub[i].getTitle().equals(subject.getTitle())) {
				System.out.println("동일한 과목이 있습니다.");
				return;
			}			
		}

		subjectRepo.insertSubject(subject);
		System.out.println("### 신규 과목등록이 완료되었습니다");
	}
	
	// 과목조회
	@Override
	public void searchSubject(int professorNo) {
		Professor pro = professorRepo.getProfessorByNo(professorNo);
		
		if (pro == null) {
			System.out.println("입력한 교수번호와 일치하는 교수님 정보가 없습니다.");
			return;
		}
		
		Subject[] allSub = subjectRepo.getAllSubject();
		System.out.println("[" + pro.getName() + "] 교수님의 " + pro.getDept() + "관련 과목들\n");
		
		for (int i = 0; i < allSub.length; i++) {
			if (allSub[i].getDept().equals(pro.getDept())) {
				System.out.println("과목번호: " + allSub[i].getNo());
				System.out.println("과 목 명: " + allSub[i].getTitle());
				System.out.println("학    과: " + allSub[i].getDept());
				System.out.println("학    점: " + allSub[i].getCredit());
				System.out.println();
			}
		}
	}
	
	// 신규 개설과정 등록
	@Override
	public void openedNewCourse(Course course) {
		Professor pro = professorRepo.getProfessorByNo(course.getProfessorNo());
		if (pro == null) {
			System.out.println("입력한 교수번호와 일치하는 교수님 정보가 없습니다.");
			return;
		}
		
		Subject sub = subjectRepo.getSubjectByNo(course.getSubjectNo());
		if (sub == null) {
			System.out.println("입력환 과목번호와 일치하는 과목정보가 없습니다.");
			return;
		}
		
		if (!pro.getDept().equals(sub.getDept())) {
			System.out.println("교수님이 소속된 학과가 과목이 아닙니다.");
			return;
		}

		courseRepo.insertCourse(course);
		System.out.println("### 신규등록이 완료되었습니다");
	}
	
	// 개설과정 조회
	@Override
	public void searchCourseByProfessorNo(int professorNo) {
		Professor pro = professorRepo.getProfessorByNo(professorNo);
		
		if (pro == null) {
			System.out.println("입력한 교수번호와 일치하는 교수님 정보가 없습니다.");
			return;		
		}
		
		Course[] allCourse = courseRepo.getAllCourse();
		System.out.println("[" + pro.getName() + "]교수님의 개설과정");
		
		for (int i = 0; i < allCourse.length; i++) {
			if (allCourse[i].getProfessorNo() == professorNo) {
				printCourseInfo(allCourse[i]);
			}
		}
	}
	
	// 개설과정 신청자 조회
	@Override
	public void searchApplyStudent(int professorNo, int courseNo) {
		Professor pro = professorRepo.getProfessorByNo(professorNo);
		if (pro == null) {
			System.out.println("입력한 교수번호와 일치하는 교수님 정보가 없습니다.");
			return;		
		}
		
		Course cou = courseRepo.getCourseByNo(courseNo);
		if (cou == null) {
			System.out.println("입력한 번호와 일치하는 개설과정이 없습니다.");
			return;
		}
		
		if (cou.getProfessorNo() != professorNo) {
			System.out.println("입력하신 담당교수님 번호와 개설과정 담당교수님 번호가 일치하지 않습니다.");
			return;
		}
		
		System.out.println();
		printCourseInfo(cou);
		
		System.out.println("[" + cou.getName() + "] 과정 신청자");
		Registration[] allReg = registrationRepo.getAllRegistrationis();
		for (int i = 0; i < allReg.length; i++) {
			if (allReg[i].getCourseNo() == courseNo) {
				Student student = userRepo.getStudentByNo(allReg[i].getStudentNo());
				System.out.println("학생번호: " + student.getNo());
				System.out.println("학생이름: " + student.getName());
				System.out.println("이 메 일: " + student.getEmail());
				System.out.println("학    과: " + student.getDept());
				System.out.println("학    년: " + student.getGrade());
				System.out.println();
			}
		}
	}
	
	// 성적입력
	@Override
	public void grantScore(int professorNo, int registerationNo, int score) {
		Registration reg = registrationRepo.getRegistrationByNo(registerationNo);
		if (reg == null) {
			System.out.println("입력한 수강신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		Professor pro = professorRepo.getProfessorByNo(professorNo);
		if (pro == null) {
			System.out.println("입력한 교수번호와 일치하는 교수님 정보가 없습니다.");
			return;
		}
		
		Course cou = courseRepo.getCourseByNo(reg.getCourseNo());
		if (cou.getProfessorNo() != professorNo) {
			System.out.println("해당 과정 담당교수번호와 일치 하지 않습니다.");
			return;
		}
		
		reg.setScore(score);
		
		System.out.println("### 성적입력이 완료되었습니다.");
	}
	
	// 학생관련 시스템
	// 학생등록
	@Override
	public void addNewStudent(Student student) {
		Student[] allStu = userRepo.getAllStudents();
		
		for (int i = 0; i < allStu.length; i++) {
			if (allStu[i].getEmail().equals(student.getEmail())) {
				System.out.println("이메일이 동일한 학생정보가 있습니다.");
				return;
			}
		}
		
		userRepo.insertStudent(student);
		System.out.println("### 신규등록이 완료되었습니다");
	}
	
	// 과목조회
	@Override
	public void searchSubjectByStudentNo(int studentNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생정보가 없습니다.");
			return;
		}
		
		System.out.println();
		System.out.println("[" + stu.getName() + "]님의 " + "[" + stu.getDept() + 
				"] 과목들");
		Subject[] allSub = subjectRepo.getAllSubject();
		for (int i = 0; i < allSub.length; i++) {
			if (allSub[i].getDept().equals(stu.getDept())) {
				System.out.println("과목명: " + allSub[i].getTitle());
				System.out.println();
			}
		}
	}
	
	// 개설과정 조회
	@Override
	public void searchCourseByStudentNo(int studentNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생정보가 없습니다.");
			return;
		}
		
		System.out.println("[" + stu.getName() + "]님의 [" + stu.getDept() + "] 개설 과정 목록");
		
		Subject[] allSub = subjectRepo.getAllSubject();
		Course[] allCou = courseRepo.getAllCourse();
		
		for (int i= 0; i < allSub.length; i++) { 
			int subjectNo = 0;
			
			if (allSub[i].getDept().equals(stu.getDept())) {
				subjectNo = allSub[i].getNo();
			}
			
			for (int j = 0; j < allCou.length; j++) {
				if (allCou[j].getSubjectNo() == subjectNo) {
					Professor professor = professorRepo.getProfessorByNo(allCou[i].getProfessorNo());
					
					System.out.println("과정번호: " + allCou[i].getNo());
					System.out.println("과 정 명: " + allCou[i].getName());
					System.out.println("담당교수: " + professor.getName());					
					System.out.println("신청정원: " + allCou[i].getQuota());
					System.out.println();
				}
			}
		}
	}
	
	// 수강신청
	@Override
	public void CourseRegistration(int studentNo, int courseNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생번호가 없습니다.");
			return;
		}
		
		Course cou = courseRepo.getCourseByNo(courseNo);
		if (cou == null) {
			System.out.println("입력하신 개설과정 번호와 일치하는 정보가 없습니다.");
		}
		
		Subject sub = subjectRepo.getSubjectByNo(cou.getSubjectNo());
		if (!sub.getDept().equals(stu.getDept())) {
			System.out.println("신청하신 과정의 학과와 일치하지 않습니다.");
			return;
		}
		
		// 정원이 다 찻는지 확인해야되는지 물어보자
		Registration[] allReg = registrationRepo.getAllRegistrationis();
		int courseCount = 0;
		for (int i = 0; i < allReg.length; i++) {
			if (allReg[i].getCourseNo() == courseNo) {
				courseCount++;
			}
		}
		
		if (courseCount >= cou.getQuota()) { 
			System.out.println("신청하신 과정의 정원이 다 찼습니다.");
			return;
		}
		
		Registration registration = new Registration(studentNo, courseNo, false, 0);
		registrationRepo.insertRegistration(registration);
		
		System.out.println("### 신청이 완료되었습니다.");
	}
	
	// 수강신청 현황 조회
	@Override
	public void CourseRegistrationInfo(int studentNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생번호가 없습니다.");
			return;
		}
		
		System.out.println("[" + stu.getName() + "]님의 신청과목");
		Registration[] allReg = registrationRepo.getAllRegistrationis();
		boolean flag = false;
		for (int i = 0; i < allReg.length; i++) {
			if (allReg[i].getStudentNo() == studentNo) {	
				System.out.println("수강신청번호: " + allReg[i].getNo());
					
				Course cou = courseRepo.getCourseByNo(allReg[i].getCourseNo());
				System.out.println("개설과정명: " + cou.getName());
				System.out.println("취소여부: " + allReg[i].getisCancel());
				System.out.println();
				flag = true;
			}
		}
		
		if (!flag) {
			System.out.println("신청하신 과목이 없습니다!");
		}
	}
	
	// 수강신청 취소
	@Override
	public void CancelCourseRegistration(int studentNo, int registrationNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생번호가 없습니다.");
			return;
		}
		
		Registration reg = registrationRepo.getRegistrationByNo(registrationNo);
		if (reg == null) {
			System.out.println("입력한 수강신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		if (reg.getStudentNo() != studentNo) {
			System.out.println("조회된 수강신청 학생번호와 입력한 학생번호가 일치하지 않습니다.");
			return;
		}
		
		if (reg.getisCancel() == true) {
			System.out.println("이미 취소된 수강입니다");
			return;
		}
		
		reg.setCancel(true);
		System.out.println("### 수강신청 취소가 완료되었습니다.");
	}
	
	// 성적 조회
	//	과목번호,과목명,개설과정명,담당교수명,성적,학점
	@Override
	public void searchRecord(int studentNo) {
		Student stu = userRepo.getStudentByNo(studentNo);
		if (stu == null) {
			System.out.println("학생번호와 일치하는 학생번호가 없습니다.");
			return;
		}
		
		// 모든 성적을 더한 값을 받는 변수
		int total = 0;
		int subCount = 0;
		
		System.out.println("[" + stu.getName() + "]님의 성적표");
		System.out.println("과목번호     과목명    개설과정명     담당교수명    성적   학점");
		Registration[] allReg = registrationRepo.getAllRegistrationis();
		for (int i = 0; i < allReg.length; i++) {
			if (allReg[i].getStudentNo() == studentNo && allReg[i].getisCancel() == false) {
				Course cou = courseRepo.getCourseByNo(allReg[i].getCourseNo());
				Subject sub = subjectRepo.getSubjectByNo(cou.getSubjectNo());
				Professor pro = professorRepo.getProfessorByNo(cou.getProfessorNo());
				
				System.out.print(" "+sub.getNo() + "\t" + "    ");
				System.out.print(sub.getTitle() + "\t");
				System.out.print(cou.getName() + "\t");
				System.out.print(pro.getName() + "\t"+ "      ");
				
				int score = allReg[i].getScore();
				String grades = getGrade(score);
				total += score;
				subCount++;
				
				System.out.print(score+ "     ");
				System.out.println(grades);
			}
		
		}
		System.out.println("평균성적: " + total/subCount + "학점: " + getTotalGrade(total/subCount));
	}
	
	private void printCourseInfo(Course course) {
		System.out.println("과정번호: " + course.getNo());
		System.out.println("과 정 명: " + course.getName());
		
		Subject sub = subjectRepo.getSubjectByNo(course.getSubjectNo());
		System.out.println("과 목 명: " + sub.getTitle());
		System.out.println("신청정원: " + course.getQuota());
		System.out.println();
	}
	
	private double getTotalGrade(int average) {
		if (average < 60) {
			return 0;
		}
		
		return (average - 60)/10.0 + 1;
	}
	
	private String getGrade(int score) {
		String grade = "";
		
		if (score >= 95) {
			grade = "A+";
		} else if (score >= 90) {
			grade = "A";
		} else if (score >= 85) {
			grade = "B+";
		} else if (score >= 80) {
			grade = "B";
		} else if (score >= 75) {
			grade = "C+";
		} else if (score >= 70) {
			grade = "C";
		} else if (score >= 65) {
			grade = "D+";
		} else if (score >= 60) {
			grade = "D";
		} else {
			grade = "F";
		}
		return grade;
	}
}
