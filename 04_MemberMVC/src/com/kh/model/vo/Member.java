package com.kh.model.vo;
/*
 * VO(Value Object) --값을 담는 객체(이걸 더 자주 사용) / DTO(Data Transfer Object) --데이터 교환과 관련된 객체(게터세터)
 * 
 * 
 * */
public class Member {

	private String id;
	private String password;
	private String name;
	
	public Member() {}
	public Member(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + "]";
	}

}