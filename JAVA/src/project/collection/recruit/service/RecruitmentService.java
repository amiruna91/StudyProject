package collection.recruit.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

import collection.recruit.repo.RecruitmentRepository;
import collection.recruit.vo.Career;
import collection.recruit.vo.Recruitment;
import collection.recruit.vo.Resume;

public class RecruitmentService {

	private RecruitmentRepository repo = new RecruitmentRepository();
	
	// 이력서 등록기능
	public void addNewResume(Resume resume) {
		// 구직신청객체 생성
		// 구직신청객체에 전달받은 이력서 객체 저장
		// 레포지토리객체를 사용해서 db에 저장하고, 자신의 구직신청번호를 반환받는다.
		// 구직신청번호를 출력한다.
		Recruitment recruitment = new Recruitment();
		recruitment.setResume(resume);
		
		int recruitmentNo = repo.addRecuitment(recruitment);
		
		System.out.println("구직신청번호는 [" + recruitmentNo + "] 입니다.");
		System.out.println("### 이력서 등록이 완료되었습니다.");
		
	}
	
	// 경력사항 등록기능
	public void addCareer(int recruitmentNo, Career career) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 구직신청객체의 경력사항에 전달받은 경력사항객체를 추가한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		recruitment.addCareer(career);
		System.out.println("### 경력사항 등록이 완료되었습니다.");
		
	}
	
	//경력사항 수정 기능
	public void updateCareer(int recruitmentNo, Career career) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		ArrayList<Career> careers = recruitment.getCareers();
		if (careers.isEmpty()) {
			System.out.println("경력사항이 없습니다!!");
			return;
		}
		
		for (Career car : careers) {
			if (car.getCompanyName().equals(career.getCompanyName())) {
				car.setDept(career.getDept());
				car.setPosition(career.getPosition());
				car.setYear(career.getYear());
				System.out.println("### 수정이 완료되었습니다.");
				break;
			} else {
				System.out.println("입력하신 회사명과 일치하는 정보가 없습니다.");
			}
		}
	}
	
	// 경력사항 삭제 기능
	public void deleteCareer(int recruitmentNo, String companyName) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		ArrayList<Career> careers = recruitment.getCareers();
		if (careers.isEmpty()) {
			System.out.println("경력사항이 없습니다!!");
			return;
		}
		
		Iterator<Career> itr = careers.iterator();
		while (itr.hasNext()) {
			Career car = itr.next();
			if (car.getCompanyName().equals(companyName)) {
				itr.remove();
				System.out.println("### 경력이 삭제되어었습니다.");
				break;
			}
		}
	}
	
	// 구직신청 상태 조회 기능
	public void printRecruitmentDetail(int recruitmentNo) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회해서 화면에 출력한다.
		// 구직신청번호, 이름 ,전화번호, 지원부서, 합격여부, 경력사항, 전부 출력
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		printRecruitment(recruitment);
	}
	
	// 이력서 수정 기능
	public void updateResume(int recruitmentNo, Resume resume) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 구직신청객체의 이력서정보를 전달받은 이력서 정보로 교체한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		recruitment.setResume(resume);
		System.out.println("### 이력서 수정이 완료되었습니다.");
	}
	
	// 구직신청 삭제하기
	public void deleteRecruitment(int recruitmentNo) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 삭제한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		repo.deleteRecruitmentByNo(recruitmentNo);
		System.out.println("### 구직신청정보를 삭제 하였습니다.");
	}
	
	// 지원자 수 조회
	public void searchApplicantNum(int recruitmentNo) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		Resume resume = recruitment.getResume();
		if (resume == null) {
			System.out.println("등록된 이력서가 없습니다.");
			return;
		}
		
		int count = 0;
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		for (Recruitment otherRecruitment : recruitments) {
			Resume otherResume = otherRecruitment.getResume();
			if (resume.getDept().equals(otherResume.getDept())) {
				count++;
			}
		}
		System.out.println("[" + resume.getDept() + "]부서를 지원한 인원은 " + count + " 명 입니다");
	}
	
	// 평균근무 기간조회
	public void searchApplicantAverageNum(int recruitmentNo) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		Resume resume = recruitment.getResume();
		if (resume == null) {
			System.out.println("등록된 이력서가 없습니다.");
			return;
		}
		
		int mytotalYear = 0;
		int totalYear = 0;
		int countPeople = 0;
		
		mytotalYear = totalYear(recruitment);
		
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		for (Recruitment otherRecruitment : recruitments) {
			Resume otherResume = otherRecruitment.getResume();
			if (resume.getDept().equals(otherResume.getDept())) {
				totalYear += totalYear(otherRecruitment);
				countPeople++;
			}
		}
		System.out.println("나의 근무 년수: " + mytotalYear);
		System.out.println("평균 근무 년수: " + totalYear/countPeople);
	}
	
	// 전체 구직신청정보 간단 조회
	public void printAllRecruitment() {
		// 레포지토리에서 모든 구직신청 정보를 조회해서 화면에 출력한다.
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		
		for (Recruitment recruitment : recruitments) {
			printRecruitmentSimple(recruitment);
		}
	}
	
	// 구직신청 심사하기
	public void checkRecruitment(int recruitmentNo, boolean passed) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		// 합격/불합격여부를 결정한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		if (recruitment == null) {
			System.out.println("입력한 구직신청번호와 일치하는 정보가 없습니다.");
			return;
		}
		
		recruitment.setPassed(passed);
		
		System.out.println("### 심사가 끝났습니다.");
		
	}
	
	// 이름순으로 조회하기
	public void infoByName() {
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		
		Collections.sort(recruitments, new Comparator<Recruitment>() {
			public int compare(Recruitment o1, Recruitment o2) {
				
				return o1.getResume().getName().compareTo(o2.getResume().getName());
			}
		});
		
		System.out.println("이름  신청번호    전화번호      지원부서      합격여부");
		for (Recruitment recruitment : recruitments) {
			oneLineInfo(recruitment);
		}
	}
	
	// 근무 경력순으로 조회하기
	public void infoByYear() {
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		
		Collections.sort(recruitments, new Comparator<Recruitment>() {
			public int compare(Recruitment o1, Recruitment o2) {
				int num1 = totalYear(o1);
				int num2 = totalYear(o2);
				
				return (num1 - num2) * -1;
			};
		});
		
		System.out.println("이름  신청번호    전화번호      지원부서      합격여부");
		for (Recruitment recruitment : recruitments) {
			oneLineInfo(recruitment);
		}
	}
	
	// 한줄로 간단 조회 기능
	private void oneLineInfo(Recruitment recruitment) {
		Resume resume = recruitment.getResume();
		System.out.print(resume.getName() + "\t");
		System.out.print(recruitment.getNo() + "\t");
		System.out.print(resume.getTel() + "\t");
		System.out.print(resume.getDept() + "\t");
		System.out.println(recruitment.isPassed());
	}
	// 구직신청 간단 조회
	private void printRecruitmentSimple(Recruitment recruitment) {
		System.out.println("신청번호: " + recruitment.getNo());
		Resume resume = recruitment.getResume();
		System.out.println("이    름: " + resume.getName());
		System.out.println("전화번호: " + resume.getTel());
		System.out.println("지원부서: " + resume.getDept());
		System.out.println("합격여부: " + recruitment.isPassed());
		System.out.println();
	}
	
	// 구직신청 상태 상세 출력
	private void printRecruitment(Recruitment recruitment) {
		// 구직신청번호, 이름 ,전화번호, 지원부서, 합격여부, 경력사항, 전부 출력
		printRecruitmentSimple(recruitment);
		
		System.out.println("[경력사항]");
		System.out.println("-----------------------------------------------------");
		System.out.println("회사명\t부서명\t최종직급\t근무기간");
		
		ArrayList<Career> careers = recruitment.getCareers();
		for (Career career : careers) {
			System.out.print(career.getCompanyName() + "\t");
			System.out.print(career.getDept() + "\t");
			System.out.print(career.getPosition() + "\t");
			System.out.println(career.getYear());			
		}
	}
	
	// 경력사항 년수 총합 구하는 기능
	private int totalYear(Recruitment recruitment) {
		int total = 0;
		ArrayList<Career> careesrs = recruitment.getCareers();
		
		for (Career careesr : careesrs) {
			total += careesr.getYear();
		}
		return total;
	}
}
