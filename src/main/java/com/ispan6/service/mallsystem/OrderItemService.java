package com.ispan6.service.mallsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.OrderItems;
import com.ispan6.dao.mallsystem.OrderItemDao;

@Service
@Transactional
public class OrderItemService {
	
	@Autowired
	private OrderItemDao  orderItemDao;

	public List<OrderItems> findAllByOrderId(Integer orderId) {
		return orderItemDao.findAllByOrderBeanId(orderId);
	}

	public List<OrderItems> findByProductId(Integer id) {
		return orderItemDao.findByProductId(id);
	}

//	private OrderItemServiceDao orderItemServiceDao;
	
	
}
