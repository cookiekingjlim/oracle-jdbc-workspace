package com.youtube.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.youtube.model.vo.CommentLike;
import com.youtube.model.vo.VideoComment;
import com.youtube.model.vo.VideoLike;

public class CommentLikeDAO implements CommentLikeDAOTemplate{

	@Override
	public Connection getConnect() throws SQLException {
		return null;
	}

	@Override
	public void closeAll(PreparedStatement st, Connection conn) throws SQLException {
	}

	@Override
	public void closeAll(ResultSet rs, PreparedStatement st, Connection conn) throws SQLException {
	}

	@Override
	public int addLike(VideoLike like) throws SQLException {
		return 0;
	}

	@Override
	public int deleteLike(int likeCode) throws SQLException {
		return 0;
	}

	@Override
	public int addComment(VideoComment comment) throws SQLException {
		return 0;
	}

	@Override
	public int updateComment(VideoComment comment) throws SQLException {
		return 0;
	}

	@Override
	public int deleteComment(int commentCode) throws SQLException {
		return 0;
	}

	@Override
	public ArrayList<VideoComment> videoCommentList(int videoCode) throws SQLException {
		return null;
	}

	@Override
	public int addCommentLike(CommentLike like) throws SQLException {
		return 0;
	}

	@Override
	public int deleteCommentLike(int likeCode) throws SQLException {
		return 0;
	}

}
