package collection.recruit;

import java.util.InputMismatchException;
import java.util.Scanner;

import collection.recruit.service.RecruitmentService;
import collection.recruit.vo.Career;
import collection.recruit.vo.Resume;

public class RecruitApp {

	public static void main(String[] args) {
		RecruitmentService service = new RecruitmentService();
		
		while (true) {
			try {
				Scanner scanner = new Scanner(System.in);
				System.out.println("=========================================");
				System.out.println("1.구직자  2.인사담당자  0.종료");
				System.out.println("=========================================");
				
				System.out.print("메뉴를 선택하세요: ");
				int menuNo = scanner.nextInt();
				
				if (menuNo == 1) {
					System.out.println("=============================================================================================");
					System.out.println("1.이력서등록/수정  2.경력사항등록/수정  3.채용상태확인  4.구직신청 현황조회  5.구직신청 삭제");
					System.out.println("=============================================================================================");
					
					System.out.print("메뉴를 선택하세요");
					int empMenuNo = scanner.nextInt();
					
					// 이력서 등록/수정
					if (empMenuNo == 1) {
						System.out.println("=============================");
						System.out.println("1.이력서등록  2.이력서수정");
						System.out.println("=============================");
						
						System.out.print("구직자 메뉴를 선택하세요");
						int resumeNo = scanner.nextInt();
						
						if (resumeNo == 1) {
							// 이름, 전화번호, 지원부서를 입력받는다.
							System.out.println("[이력서 등록]");
							
							System.out.print("이름을 입력하세요: ");
							String name = scanner.next();
							System.out.print("전화번호를 입력하세요: ");
							String tel = scanner.next();
							System.out.print("지원부서를 입력하세요: ");
							String dept = scanner.next();
							
							Resume resume = new Resume();
							resume.setName(name);
							resume.setTel(tel);
							resume.setDept(dept);
							
							service.addNewResume(resume);
							
						} else if (resumeNo == 2) {
							// 구직신청번호, 이름, 전화번호, 지원부서를 입력받는다.
							System.out.println("[이력서 수정]");
							
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
							System.out.print("이름을 입력하세요: ");
							String name = scanner.next();
							System.out.print("전화번호를 입력하세요: ");
							String tel = scanner.next();
							System.out.print("지원부서를 입력하세요: ");
							String dept = scanner.next();
							
							Resume resume = new Resume();
							resume.setName(name);
							resume.setTel(tel);
							resume.setDept(dept);
							
							service.updateResume(recruitmentNo, resume);
							
						}
						
					// 경력사항 등록/ 수정
					} else if (empMenuNo == 2) {
						System.out.println("==================================================");
						System.out.println("1.경력사항 등록  2.경력사항 수정  3.경력사항 삭제");
						System.out.println("====================================================");
						
						System.out.print("메뉴를 선택하세요");
						int careerNo = scanner.nextInt();
						
						if (careerNo == 1) {
							// 재직회사명, 근무부서, 직위, 근무년수를 입력받는다.
							System.out.println("[경력사항 등록]");
							
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
							
							System.out.print("재직회사명을 입력하세요: ");
							String companyName = scanner.next();
							System.out.print("근무부서명을 입력하세요: ");
							String dept = scanner.next();
							System.out.print("재직시직위를 입력하세요: ");
							String position = scanner.next();
							System.out.print("근무년수를 입력하세요: ");
							int year = scanner.nextInt();
							
							Career career = new Career();
							career.setCompanyName(companyName);
							career.setDept(dept);
							career.setPosition(position);
							career.setYear(year);
							
							service.addCareer(recruitmentNo, career);
							
						} else if (careerNo == 2) {
							//자신의 경력사항 수정기능
							//구직신청번호, 회사명으로 경력사항을 찾아서
							System.out.println("[경력사항 수정기능]");
							
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
							
							System.out.print("재직회사명을 입력하세요: ");
							String companyName = scanner.next();
							System.out.print("수정할 근무부서명을 입력하세요: ");
							String dept = scanner.next();
							System.out.print("수정할 재직시 직위를 입력하세요: ");
							String position = scanner.next();
							System.out.print("수정할 근무년수를 입력하세요: ");
							int year = scanner.nextInt();
							
							Career career = new Career();
							career.setCompanyName(companyName);
							career.setDept(dept);
							career.setPosition(position);
							career.setYear(year);
							
							service.updateCareer(recruitmentNo, career);
							
						} else if (careerNo == 3) {
							// 경력사항 삭제하기
							// 구직신청번호, 회사명으로 경력사항을 찾아서
							System.out.println("[경력사항 삭제기능]");
							
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
							
							System.out.print("재직회사명을 입력하세요: ");
							String companyName = scanner.next();
							
							service.deleteCareer(recruitmentNo, companyName);
							
						}
						
					} else if (empMenuNo == 3) {
						// 구직신청번호를 입력받는다.
						System.out.println("[채용상태 확인]");
						
						System.out.print("구직신청번호를 입력하세요: ");
						int recruitmentNo = scanner.nextInt();
						
						service.printRecruitmentDetail(recruitmentNo);
						
					// 구직신청 현황조회
					} else if (empMenuNo == 4) {
						System.out.println("======================================");
						System.out.println("1.지원자 수 조회   2.평균근무 기간조회");
						System.out.println("======================================");
						
						System.out.print("메뉴를 선택하세요");
						int infoNo = scanner.nextInt();
						
						if (infoNo == 1) {
							// 지원자 수 조회
							// 자신과 같은 부서에 지원 사람들의 숫자
							System.out.println("[지원자 수 조회]");
							
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
					
							service.searchApplicantNum(recruitmentNo);
						
						} else if (infoNo == 2) {
							// 평균근무 기간조회
							// 자신과 같은 부서에 지원한 사람들의 평균 근무기간 조회  
							// 자신의 근무년수도 표시
							System.out.println("[지원자 수 조회]");
								
							System.out.print("구직신청번호를 입력하세요: ");
							int recruitmentNo = scanner.nextInt();
						}
						
					} else if (empMenuNo == 5) {
						// 구직신청번호를 입력받는다.
						System.out.println("[구직신청 삭제]");
						
						System.out.print("구직신청번호를 입력하세요: ");
						int recruitmentNo = scanner.nextInt();
						
						service.deleteRecruitment(recruitmentNo);
						
					} 
					
				} else if (menuNo == 2) {
					System.out.println("=================================================================================");
					System.out.println("1.채용신청서 조회  2.채용신청서 상세조회  3.채용신청서 심사  4.전체 구직신청조회");
					System.out.println("================================================================================");
					
					System.out.print("구직자 메뉴를 선택하세요");
					int empMenuNo = scanner.nextInt();
					
					if (empMenuNo == 1) {
						// 입력값 없음
						System.out.println("[채용신청서 조회]");
						
						service.printAllRecruitment();
						
					} else if (empMenuNo == 2) {
						// 구직신청번호를 입력받는다.
						System.out.println("[채용신청서 상세조회]");
						
						System.out.print("구직신청번호를 입력하세요: ");
						int recruitmentNo = scanner.nextInt();
						
						service.printRecruitmentDetail(recruitmentNo);
						
					} else if (empMenuNo == 3) {
						// 구직신청번호와 합격불합격여부를 Y/N으로 입력받는다.
						System.out.println("[채용신청서 심사]");
						
						System.out.print("구직신청번호를 입력하세요: ");
						int recruitmentNo = scanner.nextInt();
						System.out.print("합격여부를 입력하세요(Y/N): ");
						String isPassed = scanner.next();
						
						boolean passed = (isPassed.equals("Y")) ? true : false;
						
						service.checkRecruitment(recruitmentNo, passed);
					} else if (empMenuNo == 4) {
						System.out.println("============================");
						System.out.println("1.이름순  2.근무경력순");
						System.out.println("============================");
						
						System.out.print("메뉴를 선택하세요: ");
						int infoNo = scanner.nextInt();
						
						if (infoNo == 1) {
							System.out.println("[이름순으로 조회하기]");
							
							service.infoByName();
							
						} else if (infoNo == 2) {
							System.out.println("[근무경력순으로 조회하기]");
							
						}
						
					}
					
				} else if (menuNo == 0) {
					System.out.println("### 프로그램을 종료합니다.");
					scanner.close();
					break;
				}
			System.out.println();
			} catch (InputMismatchException e) {
				System.out.println("다시 입력하세요!!");
			}
		}
	}
}
