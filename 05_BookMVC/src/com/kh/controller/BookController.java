package com.kh.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.model.dao.BookDAO;
import com.kh.model.vo.Book;
import com.kh.model.vo.Member;
import com.kh.model.vo.Rent;

public class BookController {

	private BookDAO dao = new BookDAO();
	private Member member = new Member();
	
	public ArrayList<Book> printBookAll(){	// DAO 에서 SELECT
		try {
			return dao.printBookAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean registerBook(Book book) {	//INSERT
		try {
			if(dao.registerBook(book) ==1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean sellBook(int no) {	//DELETE
		try {
			if(dao.sellBook(no) == 1) 
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean registerMember(Member member) {
		try {
			if(dao.registerMember(member) == 1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Member login(String id, String password) {
		try {
			member = dao.login(id, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public boolean deleteMember() {	//UPDATE 사용 로그인할 때 N인 경우
		try {
			if(dao.deleteMember(member.getMemberId(), member.getMemberPwd()) == 1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean rentBook(int no) {	
		try {
			if(dao.rentBook(new Rent(new Member(member.getMemberNo()), new Book(no))) == 1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRent(int no) {
		try {
			if(dao.deleteRent(no)==1)
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Rent> printRentBook(){	// 본인이 대여한 리스트만 가져오는 것. 조인도 해야해...
		try {
			return dao.printRentBook(member.getMemberId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
