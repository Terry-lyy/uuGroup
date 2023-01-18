package com.ispan6.service.reunionsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.reunionsystem.Reuniontype;
import com.ispan6.dao.reunionsystem.ReuniontypeRepository;

@Service
@Transactional
public class ReuniontypeService {

	@Autowired
	private ReuniontypeRepository reuniontypeRepository;
	
	public List<Reuniontype> findAllType(){
		return reuniontypeRepository.findAll();	
	}
}
