package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionTest2 {
	
	public static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String USER = "kh";
	public static final String PASSWORD = "kh";

	public static void main(String[] args) {
		// 1. 드라이버 로딩
		try {
			Class.forName(/*"oracle.jdbc.driver.OracleDriver"*/DRIVER_NAME);	//이름들 밖으로 빼주는 게 좋아
			System.out.println("Driver Loading....");
			
		// 2. 디비 연결
			Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);
			System.out.println("DB Connection...!");
	
		//3. Statement 객체 생성 - INSERT
			String query = "INSERT INTO emp(emp_id, emp_name) VALUES(?,?)";	// 넣어줄 값 직접 넣어주면 안돼
			PreparedStatement st = conn.prepareStatement(query);
			
		//4. 쿼리문 실행
			st.setInt(1, 3); // (위치,넣을 값) -> 첫번째 값 null이다
			st.setString(2, "임지우");
			
			int result = st.executeUpdate();	// 제대로 실행이 되면 1을 반환 아니면 0을 반환
			
			System.out.println(result + "명 추가!");
			
			} catch (SQLException e) {
				e.printStackTrace();
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
		}
	}

}
