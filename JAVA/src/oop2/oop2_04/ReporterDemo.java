package oop2_04;

public class ReporterDemo {

	public static void main(String[] args) {
		
		String[] names = {"김유신", "강감찬", "이순신", "류관순", "윤봉길"};
		
		// 데이터 출력을 지원하는 객체들
		DataOutput do1 = new DataOutput();
		ConsoleDataOutput do2 = new ConsoleDataOutput();
		FileDataOutput do3 = new FileDataOutput("c:/files", "data.txt");
		
		Reporter reporter = new Reporter();
		// Reporter객체의 setOutputer() 메서드를 이용해서 
		// Reporter객체의 DataOutput멤버변수에 
		// 데이터 출력을 지원하는 객체를 전달해서 조립한다.
		reporter.setOutputer(do2);
		reporter.setData(names);
		reporter.reporting();
	}
}
