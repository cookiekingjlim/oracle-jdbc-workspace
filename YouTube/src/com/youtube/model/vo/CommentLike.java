package com.youtube.model.vo;

import java.util.Date;

public class CommentLike {
	private int commLikeCode;
    private Date commLikeDate;
    private VideoComment videoComment;
    private Member member;
  
    public CommentLike() {}

	public CommentLike(int commLikeCode, Date commLikeDate, VideoComment videoComment, Member member) {
		super();
		this.commLikeCode = commLikeCode;
		this.commLikeDate = commLikeDate;
		this.videoComment = videoComment;
		this.member = member;
	}
    
    
}



