package transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;

import config.ServerInfo;

public class TransactionTest {

	public static void main(String[] args) {
		//1. 드라이버 로딩
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			
		//2. 데이터 베이스 연결
			Connection conn = DriverManager.getConnection(ServerInfo.URL,ServerInfo.USER,ServerInfo.PASSWORD);
			System.out.println("DB Connection...");
			
			// 트랜젝션 시작하겠다는 것
			conn.setAutoCommit(false);	// 오토커밋 중단시킨 것
			
			
		//3. PreparedStatement 객체 생성
			String query1 = "INSERT INTO customer(name, age, address) VALUES(?,?,?)";
			PreparedStatement st = conn.prepareStatement(query1);
		
		//4. 쿼리문 실행
			st.setString(1, "김경미");
			st.setInt(2, 16);
			st.setString(3, "서울 강남구");
			
			int result = st.executeUpdate();
		
			Savepoint savepoint = conn.setSavepoint("A");

			String query2 = "SELECT * FROM customer WHERE name = ?";
			PreparedStatement st2 = conn.prepareStatement(query2);
			st2.setString(1, "홍수민"); // 레코드가 존재할 때
			
			ResultSet rs = st2.executeQuery();
			
			if(rs.next()) {	// 다음이 있으면
				conn.rollback(savepoint);	// 롤백
				System.out.println("회원 정보가 있으므로 Rollback!");
			} else {
				conn.commit();
				System.out.println("회원 정보가 없으므로 Commit!");
			}
			
			// 트랜잭션 처리를 다시 원래대로 돌려놓음!
//			conn.setAutoCommit(true);
			
//			System.out.println(result + "명 추가!");
			
			if(result == 1) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
			st.close();
			conn.close(); //자원반납!
			
		} catch (SQLException e) {
				e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	

}
