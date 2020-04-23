package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Demo01 {

	public static void main(String[] args) throws Exception{
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("조회할 등급을 적으세요: ");
		String grade = scanner.next();
		
		// 1. JDBC 드라이버를 JVM의 드라이버 레지스트리에 등록하기
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 2. 데이터베이스와 연결을 담당하는 Connection객체 획득하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "zxcv1234";
		Connection conneciton = DriverManager.getConnection(url, user, password);
		
		// 3. SQL 실행, 결과값반환을 담당하는 PreparedStatemnet객체 획득하기
		String sql = "select gra, lowest_sal, highest_sal from job_grades where gra = ?";
		PreparedStatement pstmt = conneciton.prepareStatement(sql);
		pstmt.setString(1, grade);
		
		// 4. SQL 실행하고, 조회결과 획득하기
		ResultSet rs = pstmt.executeQuery();
		
		// 5. 조회결과
		while (rs.next()) {
			String 등급 = rs.getString("gra");
			int 최소급여 = rs.getInt("lowest_sal");
			int 최대급여 = rs.getInt("highest_sal");
			
			System.out.println(등급 + " " + 최소급여 + " " + 최대급여);
		}
		
		// 6. 데이터베이스와 연결된 모든 자원 해제하기
		rs.close();
		pstmt.close();
		conneciton.close();
		scanner.close();
	}
}
