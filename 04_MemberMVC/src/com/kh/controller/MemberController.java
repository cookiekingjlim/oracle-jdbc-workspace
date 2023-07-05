package com.kh.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.model.dao.MemberDAO;
import com.kh.model.vo.Member;

public class MemberController {

	private MemberDAO dao = new MemberDAO();
	
	public boolean joinMembership(Member m) {
		// id가 없다면 회원가입 후 true 반환
		// 없다면 false 값 반환
			try {
				if(dao.getMember(m.getId()) == null) {
					dao.registerMember(m);
					return true;
				} else {
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
	}
	
	public String login(String id, String password) {
		// 로그인 성공하면 이름 반환
		// 실패하면 null 반환
		
		try {
			Member m = new Member();
			m.setId(id);
			m.setPassword(password);
			Member login = dao.login(m);
			if(login != null) {
				return login.getName();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			
		} 
		return null;
		
	}
	
	public boolean changePassword(String id, String oldPw, String newPw) {
		// 로그인 했을 때 null이 아닌 경우
		Member m = new Member();
		m.setId(id);
		m.setPassword(oldPw);	//이걸 통해 로그인 할 거니까
		
		try {
			if(dao.login(m) != null) {
			// 비밀번호 변경 후 true 반환, 아니라면 false 반환
				m.setPassword(newPw);
				dao.updatePassword(m);
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void changeName(String id, String name) {
		// 이름 변경!
		Member m = new Member();
		m.setId(id);
		m.setName(name);
		
		try {
			dao.updateName(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}


}