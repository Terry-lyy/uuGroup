package com.ispan6.dao.postsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.ispan6.bean.postsystem.PostBean;

public interface PostDAO extends JpaRepository<PostBean, Integer>, CrudRepository<PostBean, Integer> {
//	// show all product without any condition

	// show post by conteent
	@Query("from PostBean where content = :content")
	public List<PostBean> findpostBycontent(@Param("content") String content);

	// 模糊搜尋 原SQL指令
	@Query(value = "select * from post where content like %:content%", nativeQuery = true)
	public List<PostBean> findpostLikecontent(@Param("content") String content);

	// show post by postid
	@Query("from PostBean where postid = :postid")
	public Optional<PostBean> findpostBypostid(@Param("postid") Integer postid);

	@Transactional
	@Modifying
	@Query(value = "delete from PostBean where postid = ?1")
	public List<PostBean> deletepostBypostid(Integer postid);

	public List<PostBean> findAllByOrderByPosttimeDesc();

	public List<PostBean> findFirstByOrderByPosttimeDesc();

}
