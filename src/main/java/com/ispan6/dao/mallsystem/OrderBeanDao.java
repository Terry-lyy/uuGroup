package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.OrderBean;

public interface OrderBeanDao extends JpaRepository<OrderBean, Integer>,CrudRepository<OrderBean, Integer>{

	
	
	@Query(value = "select * from orders where o_memberid = ?1" ,nativeQuery = true)
	public List<OrderBean> findByMemberId(int id);

	@Query("from OrderBean order by date desc")
	public List<OrderBean> findAllOrderByDate();
	
	@Query("from OrderBean order by name desc")
	public List<OrderBean> findAllOrderByName();
	
	@Query("from OrderBean order by status desc")
	public List<OrderBean> findAllOrderByStatus();
	
}
