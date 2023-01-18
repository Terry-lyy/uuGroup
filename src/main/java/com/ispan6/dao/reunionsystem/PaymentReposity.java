package com.ispan6.dao.reunionsystem;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan6.bean.reunionsystem.Payment;

public interface PaymentReposity extends JpaRepository<Payment,Integer>{

}
