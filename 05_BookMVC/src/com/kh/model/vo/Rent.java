package com.kh.model.vo;

import java.util.Date;

public class Rent {
	private int rentNo;
	private Member member;	//foreign key로 지정된 건 객체로 가져와야함
	private Book book;
	private Date rentDate;
	
	public Rent() {}
	
	public Rent(int rentNo, Member member, Book book, Date rentDate) {
		this.rentNo = rentNo;
		this.member = member;
		this.book = book;
		this.rentDate = rentDate;
	}


	public Rent(Member member, Book book) {
		this.member = member;
		this.book = book; //-->이렇게 생성자로 담아내기 싫으면 세터 써도 됨
	}

	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Date getRentDate() {
		return rentDate;
	}
	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}
	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", member=" + member + ", book=" + book + ", rentDate=" + rentDate + "]";
	}
	
	
}
