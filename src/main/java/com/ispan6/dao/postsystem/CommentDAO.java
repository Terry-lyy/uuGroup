package com.ispan6.dao.postsystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.postsystem.CommentBean;


public interface CommentDAO extends JpaRepository<CommentBean, Integer>,CrudRepository<CommentBean, Integer> {

}
