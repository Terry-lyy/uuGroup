package com.ispan6.service.chatsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.chatsystem.CustomerServiceMessage;
import com.ispan6.dao.chatsystem.CustomerServiceMessageDAO;

@Transactional
@Service
public class CustomerServiceMessageService {
	@Autowired
	private CustomerServiceMessageDAO customerServiceMessageDAO;
	
	
	public CustomerServiceMessage findLikeMessage(String text){
		return customerServiceMessageDAO.findLikeMessage(text);
	}
}
