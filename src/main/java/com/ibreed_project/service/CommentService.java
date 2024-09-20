package com.ibreed_project.service;

import java.util.HashMap;
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
	public  void addComment(HashMap<String, Object> map) {

		  commentDAO.addComment(map);
	}

	@Override
	public void updateComment(CommentVO commentVO) {
		  commentDAO.updateComment(commentVO);

	}

	@Override
	public void deleteComment(int commentId) {
		commentDAO.deleteComment(commentId);
	}

	@Override
	public List<CommentVO> selectCommentsByPostId(int postId) {
		// TODO Auto-generated method stub
		return commentDAO.selectCommentsByPostId(postId);
	}

	public int getCommentCountByPostId(int postId) {
		// TODO Auto-generated method stub
		   return commentDAO.getCommentCountByPostId(postId);
	}

}
