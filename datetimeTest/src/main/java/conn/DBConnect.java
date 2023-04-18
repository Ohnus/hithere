package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//싱글톤
public class DBConnect {
	private static DBConnect dbconn = new DBConnect();
	private String url = "jdbc:oracle:thin:@localhost:1521/xe"; // @db서버주소:리스너번호/sid
											// localhost(ip개념)
	private DBConnect() {} // 생성자 private.. 싱글톤
	
	public static DBConnect getInstance() {
		return dbconn; // 모든 db작업을 이 conn 객체로 실행한다.
	}
	
	public Connection conn() {
		try {
			//드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			//세션수립 .. db에 커넥트 로그인
			return DriverManager.getConnection(url, "hr", "hr");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
