package com.ibreed_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibreed_project.dao.ICommentDAO;
import com.ibreed_project.model.CommentVO;
@Service
public class CommentService implements ICommentService {

	 @Autowired
	    private ICommentDAO commentDAO;
	 
	@Override
	public void addComment(CommentVO commentVO) {
		  commentDAO.insertComment(commentVO);
	}

	@Override
	public List<CommentVO> getCommentsByPostId(int postId) {
		return commentDAO.selectCommentsByPostId(postId);
	}

	@Override
	public void updateComment(CommentVO commentVO) {
		  commentDAO.updateComment(commentVO);

	}

	@Override
	public void deleteComment(int commentId) {
		commentDAO.deleteComment(commentId);
	}

}
