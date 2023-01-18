package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.bean.mallsystem.OrderItems;

public interface OrderItemDao  extends JpaRepository<OrderItems, Integer>,CrudRepository<OrderItems, Integer>{

	
	List<OrderItems> findAllByOrderBeanId(Integer orderId);
	
	List<OrderItems> findByProductId(Integer id);
}
