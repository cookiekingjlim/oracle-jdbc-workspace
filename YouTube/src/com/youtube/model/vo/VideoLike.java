package com.youtube.model.vo;

import java.util.Date;

public class VideoLike {
	private int vLikeCode;
    private Date vLikeDate;
    private int videoCode;
    private Member member;
	public VideoLike() {
	}
	public VideoLike(int vLikeCode, Date vLikeDate, int videoCode, Member member) {
		this.vLikeCode = vLikeCode;
		this.vLikeDate = vLikeDate;
		this.videoCode = videoCode;
		this.member = member;
	}
	@Override
	public String toString() {
		return "VideoLike [vLikeCode=" + vLikeCode + ", vLikeDate=" + vLikeDate + ", videoCode=" + videoCode
				+ ", member=" + member + "]";
	}
	public int getvLikeCode() {
		return vLikeCode;
	}
	public void setvLikeCode(int vLikeCode) {
		this.vLikeCode = vLikeCode;
	}
	public Date getvLikeDate() {
		return vLikeDate;
	}
	public void setvLikeDate(Date vLikeDate) {
		this.vLikeDate = vLikeDate;
	}
	public int getVideoCode() {
		return videoCode;
	}
	public void setVideoCode(int videoCode) {
		this.videoCode = videoCode;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
    
}
