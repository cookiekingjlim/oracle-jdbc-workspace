package com.kh.controller;

import java.util.ArrayList;

import com.kh.model.dao.BookDAO;
import com.kh.model.vo.Book;
import com.kh.model.vo.Member;
import com.kh.model.vo.Rent;

public class BookController {

	private BookDAO dao = new BookDAO();
	private Member member = new Member();
	
	public ArrayList<Book> printBookAll(){	// DAO 에서 SELECT
		return null;
	}
	
	public boolean registerBook(Book book) {	//INSERT
		return false;
	}
	
	public boolean sellBook(int no) {	//DELETE
		return false;
	}
	
	public boolean registerMember(Member member) {
		return false;
	}
	
	public Member login(String id, String password) {
		return null;
	}
	
	public boolean deleteMember() {	//UPDATE 사용 로그인할 때 N인 경우
		return false;
	}
	
	public boolean rentBook(int no) {	
		return false;
	}
	
	public boolean deleteRent(int no) {
		return false;
	}
	
	public ArrayList<Rent> printRentBook(){	// 본인이 대여한 리스트만 가져오는 것. 조인도 해야해...
		return null;
	}
}
