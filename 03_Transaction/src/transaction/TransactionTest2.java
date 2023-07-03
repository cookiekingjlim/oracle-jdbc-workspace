package transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;

import config.ServerInfo;

public class TransactionTest2 {

	public static void main(String[] args) {
		
		
		//1. 드라이버 로딩
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			System.out.println("Driver Loading...");
			
		//2. 데이터베이스 연결
			Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);
			System.out.println("DB Connection...!");
			
			
		//3. 쿼리문 실행
			PreparedStatement st1 = conn.prepareStatement("SELECT * FROM bank");
			ResultSet rs = st1.executeQuery();
			
			
			System.out.println("=============은행조회===============");
			while(rs.next()) {
				System.out.println(rs.getString("name") + "/" + rs.getString("bankname") + "/" + rs.getInt("balance"));
			}
			
			System.out.println("=================================");

			/*
			 * 민소 -> 도경: 50만원씩 이체
			 * 이와 관련된 모든 쿼리를 하나로 묶는다.. 하나의 단일 트랜잭션...
			 * setAutocommit(), commit(), rollback().. 등등 사용해서 민소의 잔액이 마이너스가 되면 이체 취소!
			 * */
			conn.setAutoCommit(false);
			PreparedStatement st2 = conn.prepareStatement("UPDATE bank SET balance = balance - ? WHERE name =?");
			st2.setInt(1, 500000);
			st2.setString(2, "김민소");
			st2.executeUpdate();
			
			PreparedStatement st3 = conn.prepareStatement("UPDATE bank SET balance = balance + ? WHERE name =?");
			st3.setInt(1, 500000);
			st3.setString(2, "김도경");
			st3.executeUpdate();
			
			PreparedStatement st4 = conn.prepareStatement("SELECT balance FROM bank WHERE name = ?");
			st4.setString(1, "김민소");
			ResultSet rs2 = st4.executeQuery();
			
			if(rs2.next()) {
				 if(rs2.getInt("balance") <0) {
					 conn.rollback();
					 System.out.println("잔액부족");
				 } else {
					 conn.commit();
					 System.out.println("이체완료");
				 }
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}

}
