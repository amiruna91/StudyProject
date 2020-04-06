package com.sample.school;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import com.sample.school.service.SchoolService;
import com.sample.school.service.SchoolServiceImple;
import com.sample.school.vo.Course;
import com.sample.school.vo.Professor;
import com.sample.school.vo.Student;
import com.sample.school.vo.Subject;

public class SchoolApp {
	static BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

	private static int nextInt() {
		try {
			String text = in.readLine();
			return Integer.parseInt(text);
		} catch (IOException e) {
			return 0;
		}
	}
	
	private static String next() {
		try {
			return in.readLine();
		} catch (IOException e) {
			return "";
		}
	}
	
	public static void main(String[] args) {
		SchoolService service = new SchoolServiceImple();
		
		while (true) {
			try {

				System.out.println();
				System.out.println("[수강신청 프로그램]");
				System.out.println("===========================================================");
				System.out.println("1.교수관련 서비스  2.학생관련 서비스  0.프로그램 종료");
				System.out.println("===========================================================");
				
				System.out.print("메뉴를 선택하세요: ");
				int menuNo = nextInt();
				
				if (menuNo == 1) {
					System.out.println();
					System.out.println("=====================================================================");
					System.out.println("1.신규교수 등록  2.과목 등록/조회  3.개설과정 등록/조회  4.성적 입력");
					System.out.println("=====================================================================");
					
					System.out.print("메뉴를 선택하세요: ");
					int proMenuNo = nextInt();
					
					if (proMenuNo == 1) {
						// 신규교수 등록
						//	이름, 이메일, 학과, 직위, 급여를 입력받아서 등록한다.
						//	이메일이 동일한 교수정보는 등록될 수 없다.
						System.out.println("[신규교수 등록]");
						Professor professor = new Professor();
						
						System.out.print("이름을 입력하세요: ");
						professor.setName(next());
						System.out.print("이메일을 입력하세요: ");
						professor.setEmail(next());
						System.out.print("학과를 입력하세요: ");
						professor.setDept(next());
						System.out.print("직위를 입력하세요: ");
						professor.setPosition(next());
						System.out.print("급여를 입력하세요: ");
						professor.setSalary(nextInt());
						
						service.addNewProfessor(professor);
						
					} else if (proMenuNo ==2) {
						System.out.println();
						System.out.println("=========================");
						System.out.println("1.과목 등록  2.과목 조회");
						System.out.println("=========================");
						
						System.out.print("메뉴를 선택하세요: ");
						int subjectMenuNo = nextInt();
						
						if (subjectMenuNo == 1) {
							// 신규과목 등록
							//	과목명, 학과, 학점을 입력받아서 등록한다.
							//	과목명이 동일한 과목정보는 등록될 수 없다.
							System.out.println("[신규과목 등록]");
							Subject subject = new Subject();
							
							System.out.print("과목명을 입력하세요: ");
							subject.setTitle(next());
							System.out.print("학과를 입력하세요: ");
							subject.setDept(next());
							System.out.print("학점을 입력하세요(1 ~ 3): ");
							subject.setCredit(nextInt());
							
							service.addNewSubject(subject);
							
						} else if (subjectMenuNo == 2) {
							// 과목조회
							// 	교수번호를 입력받는다.
							// 	그 교수가 소속된 학과의 과목만 화면에 출력한다.
							System.out.println("[과목 조회]");
							
							System.out.print("교수번호를 입력하세요: ");
							int professorNo = nextInt();
							
							service.searchSubject(professorNo);
						}
						
					} else if (proMenuNo == 3) {
						System.out.println();
						System.out.println("=========================================================");
						System.out.println("1.개설과정 등록  2.개설과정 조회  3.과정 신청자 조회");
						System.out.println("=========================================================");
						
						System.out.print("메뉴를 선택하세요: ");
						int courseMenuNo = nextInt();
						
						if (courseMenuNo == 1) {
							// 신규 개설과정 등록
							//	과정명, 과목번호, 담당교수번호, 정원을 입력받아서 등록한다.
							//	그 교수가 소속된 학과에서 개설된 과목에 대해서만 신규 과정을 등록할 수 있다.
							System.out.println("[신규 개설과정 등록]");
							
							Course course = new Course();
							
							System.out.print("과정명을 입력하세요: ");
							course.setName(next());
							System.out.print("과목번호를 입력하세요: ");
							course.setSubjectNo(nextInt());
							System.out.print("담당교수번호를 입력하세요: ");
							course.setProfessorNo(nextInt());
							System.out.print("정원을 입력하세요: ");
							course.setQuota(nextInt());
							
							service.openedNewCourse(course);
							
						} else if (courseMenuNo == 2) {
							// 개설과정 조회
							// 	교수번호를 입력받는다.
							//	그 교수가 개설한 과정만 화면에 출력한다.
							System.out.println("[개설과정 조회]");
							
							System.out.print("담당교수 번호를 입력하세요: ");
							int professorNo = nextInt();
							
							service.searchCourseByProfessorNo(professorNo);
							
						} else if (courseMenuNo == 3) {
							// 개설과정 신청자 조회
							//	교수번호와 개설과정번호를 입력받는다.
							//	개설과정의 담당교수와 입력한 교수번호가 일치하는 경우만 해당 
							// 	과정 신청자를 조회해서 화면에 출력한다.
							System.out.println("[개설과정 신청자 조회]");
							
							System.out.print("담당교수 번호를 입력하세요: ");
							int professorNo = nextInt();
							System.out.print("개설과정 번호를 입력하세요: ");
							int courseNo = nextInt();
							
							service.searchApplyStudent(professorNo, courseNo);
						}
						
					} else if (proMenuNo == 4) {
						// 성적입력
						//	교수번호, 수강신청번호, 성적을 입력받는다.
						//	수강신청 정보의 과정번호로 조회된 과정정보의 교수번호와 입력한 교수번호가 
						//	일치할 때만 성적이 입력되게 한다.
						
						System.out.println("[성적입력]");
						
						System.out.print("담당교수 번호를 입력하세요: ");
						int professorNo = nextInt();
						System.out.print("수강신청 번호를 입력하세요: ");
						int registerationNo = nextInt();
						System.out.print("성적을 입력하세요: ");
						int score = nextInt();
						
						service.grantScore(professorNo, registerationNo, score);
					}
					
				} else if (menuNo == 2) {
					System.out.println();
					System.out.println("==========================================================================");
					System.out.println("1.학생등록  2.과목조회  3.개설과정 조회  4.수강 신청/취소  5.성적 조회");
					System.out.println("==========================================================================");
					
					System.out.print("메뉴를 선택하세요: ");
					int stuMenuNo = nextInt();
					
					if (stuMenuNo == 1) {
						// 학생등록
						// 이름, 이메일, 학과, 학년을 입력받아서 등록한다.
						System.out.println("[신규학생 등록]");
						
						Student student = new Student();
						System.out.print("이름을 입력하세요: ");
						student.setName(next());
						System.out.print("이메일을 입력하세요: ");
						student.setEmail(next());
						System.out.print("학과를 입력하세요: ");
						student.setDept(next());
						System.out.print("학년을 입력하세요: ");
						student.setGrade(nextInt());
						
						service.addNewStudent(student);
						
					} else if (stuMenuNo == 2) {
						// 과목조회
						// 학생번호를 입력받는다.
						System.out.println("[과목조회]");
						
						System.out.print("학생번호를 입력하세요: ");
						int studentNo = nextInt();
						
						service.searchSubjectByStudentNo(studentNo);
						
					} else if (stuMenuNo == 3) {
						// 개설과정 조회
						// 학생번호를 입력받는다.
						System.out.println("[개설과정 조회]");
						
						System.out.print("학생번호를 입력하세요: ");
						int studentNo = nextInt();
						
						service.searchCourseByStudentNo(studentNo);
						
					} else if (stuMenuNo == 4) {
						System.out.println();
						System.out.println("====================================================");
						System.out.println("1.수강신청  2.수강신청 현황 조회  3.수강신청 취소");
						System.out.println("=====================================================");
						
						System.out.print("메뉴를 선택하세요: ");
						int courseMenuNo = nextInt();
						
						if (courseMenuNo == 1) {
							// 수강신청
							// 학생번호와 개설과정번호를 입력받는다.
							System.out.println("[수강신청]");
							
							System.out.print("학생번호를 입력히세요: ");
							int studentNo = nextInt();
							System.out.print("개설과정번호를 입력히세요: ");
							int courseNo = nextInt();
							
							service.CourseRegistration(studentNo, courseNo);
							
						} else if (courseMenuNo == 2) {
							// 수강신청 현황 조회
							// 학생번호를 입력받는다.
							System.out.println("[수강신청 현황 조회]");
							
							System.out.print("학생번호를 입력히세요: ");
							int studentNo = nextInt();
							
							service.CourseRegistrationInfo(studentNo);
							
						} else if (courseMenuNo == 3) {
							// 수강신청 최소
							// 학생번호와 수강신청번호를 입력받는다.
							System.out.println("[수강신청 취소]");
							
							System.out.print("학생번호를 입력히세요: ");
							int studentNo = nextInt();
							System.out.print("수강신청번호를 입력히세요: ");
							int registrationNo = nextInt();
							
							service.CancelCourseRegistration(studentNo, registrationNo);
							
						}
						
					} else if (stuMenuNo == 5) {
						// 성적조회
						// 학생번호를 입력받는다.
						System.out.print("학생번호를 입력히세요: ");
						int studentNo = nextInt();
						
						service.searchRecord(studentNo);
					}
					
				} else if (menuNo == 0) {
					System.out.println("프로그램을 종료합니다.");
					break;
				}
			} catch (NumberFormatException e) {
				System.out.println();
				System.out.println("입력 오류입니다!!! 다시 입력해 주세요!!");
			}
		}
	}
}
