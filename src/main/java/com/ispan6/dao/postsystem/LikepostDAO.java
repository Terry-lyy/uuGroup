package com.ispan6.dao.postsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.postsystem.LikepostBean;


public interface LikepostDAO extends JpaRepository<LikepostBean, Integer>,CrudRepository<LikepostBean, Integer> {

	
	 @Transactional
	 @Modifying
	 @Query(value = "select * from likepost where postid = ?1", nativeQuery = true)
		public List<LikepostBean> findBypostid(Integer postid);


	
}
	