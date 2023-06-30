package jdbc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import config.ServerInfo;

public class DBConnectionTest4 {
	
/*	public static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String USER = "kh";
	public static final String PASSWORD = "kh";
*/
	/*
	 * 디비 서버에 대한 정보가 프로그램상에 하드코딩 되어있음!
	 * --> 해결책: 별도의 모듈에 디비 서버에 대한 정보를 뽑아내서 별도 처리!
	 * */
	
	public static void main(String[] args) {
		// 1. 드라이버 로딩
		try {
			
			Properties p = new Properties();
			try {
				p.load(new FileInputStream("src/config/jdbc.properties"));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Class.forName(/*"oracle.jdbc.driver.OracleDriver"*/ServerInfo.DRIVER_NAME);	//이름들 밖으로 빼주는 게 좋아
			System.out.println("Driver Loading....");
			
		// 2. 디비 연결
			Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);
			System.out.println("DB Connection...!");
	
		// 3. Statement 객체 생성 - DELETE
			String query = p.getProperty("jdbc.sql.delete");/*"DELETE FROM emp WHERE emp_id = ?";*/ //파일로 키값 저장
			PreparedStatement st = conn.prepareStatement(query);
			
		//4. 쿼리문 실행
			st.setInt(1, 3); // emp_id가 1인 경우 삭제
			
			int result = st.executeUpdate();
			
			System.out.println(result + "명 삭제!");
			
			
			// 여기서 결과 나오는지 확인 - SELECT
			String query2 = p.getProperty("jdbc.sql.select");
			PreparedStatement st2 = conn.prepareStatement(query2);
			
			ResultSet rs = st2.executeQuery();
			
			while(rs.next()) {
				
				String empId = rs.getString("emp_id");
				String empName = rs.getString("emp_name");
				String deptTitle = rs.getString("dept_title");
				System.out.println(empId + " / " + empName + "/" + deptTitle );
			}

			
			} catch (SQLException e) {
				e.printStackTrace();
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
		}
	}

}

