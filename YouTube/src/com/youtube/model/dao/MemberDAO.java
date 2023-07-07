package com.youtube.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.youtube.model.vo.Member;
import com.youtube.model.vo.Subscribe;

import config.ServerInfo;

public class MemberDAO implements MemberDAOTemplate{

	private Properties p = new Properties();

	public MemberDAO() {
		try {
			p.load(new FileInputStream("src/config/jdbc.properties"));
			Class.forName(ServerInfo.DRIVER_NAME);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public Connection getConnect() throws SQLException {
		Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);
		return conn;
	}

	@Override
	public void closeAll(PreparedStatement st, Connection conn) throws SQLException {
		if (st != null)
			st.close();
		if (conn != null)
			conn.close();
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement st, Connection conn) throws SQLException {
		closeAll(st, conn);
		if (rs != null)
			rs.close();
	}

	@Override
	public int register(Member member) throws SQLException {
		Connection conn = getConnect();
		PreparedStatement st = conn.prepareStatement(p.getProperty("register"));
		st.setString(1, member.getMemberId());
		st.setString(2, member.getMemberPassword());
		st.setString(3, member.getMemberNickname());
		int result = st.executeUpdate();
		closeAll(st,conn);
		
		return result;
	}

	@Override
	public Member login(String id, String password) throws SQLException {
		Connection conn = getConnect();
		PreparedStatement st = conn.prepareStatement(p.getProperty("login"));
		st.setString(1, id);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		
		if(rs.next()) {
			Member m = new Member();
			m.set
			
		}
		
		return null;
	}

	@Override
	public int addSubscribe(Subscribe subscribe) throws SQLException {
		return 0;
	}

	@Override
	public int deleteSubscribe(int subsoCode) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<Subscribe> mySubscribeliList(String memberId) throws SQLException {
		return null;
	}

}
