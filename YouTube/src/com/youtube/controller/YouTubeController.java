package com.youtube.controller;

import java.sql.SQLException;

import com.youtube.model.dao.MemberDAO;
import com.youtube.model.vo.Member;

public class YouTubeController {
	private MemberDAO memberDao = new MemberDAO();
	
	public boolean register(Member member) {
		try {
			if(memberDao.register(member)==1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
