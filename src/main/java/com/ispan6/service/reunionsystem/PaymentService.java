package com.ispan6.service.reunionsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.reunionsystem.Payment;
import com.ispan6.dao.mallsystem.ProductLabelDAO;
import com.ispan6.dao.reunionsystem.PaymentReposity;

@Service
@Transactional
public class PaymentService {
	
	@Autowired
	private PaymentReposity paymentReposity;
	
	public List<Payment> findAllPayment() {
		return paymentReposity.findAll();
	}
}
