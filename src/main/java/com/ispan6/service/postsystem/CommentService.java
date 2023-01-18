package com.ispan6.service.postsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ispan6.bean.postsystem.CommentBean;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.CommentDAO;

@Service
@Transactional
public class CommentService {
	
	
	@Autowired
    private CommentDAO commentDAO;

    public void addComment(CommentBean comment) {
        commentDAO.save(comment);
    }

    public void deleteComment(CommentBean comment) {
        commentDAO.delete(comment);
    }
    
    public void insertOrUpdate(CommentBean comment) {
    	commentDAO.save(comment);
	}

    public List<CommentBean> getAllComments() {
        return commentDAO.findAll(Sort.by(Sort.Direction.ASC, "commenttime"));
    }
    public void deleteCommentById(Integer commentId) {
        CommentBean comment = commentDAO.findById(commentId).orElse(null);
        if (comment != null) {
          commentDAO.deleteById(commentId);
        }
   
  }
}
