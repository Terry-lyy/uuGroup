package com.ispan6.dao.chatsystem;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.ispan6.bean.chatsystem.CustomerServiceMessage;


public interface CustomerServiceMessageDAO extends JpaRepository<CustomerServiceMessage, Integer>{

	@Query(value="select * from CustomerServiceMessage where fromMessageText like %?1%",nativeQuery = true)
	public CustomerServiceMessage findLikeMessage(String text);
	
	
}
