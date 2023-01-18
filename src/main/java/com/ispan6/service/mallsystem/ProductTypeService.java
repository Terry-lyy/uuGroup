package com.ispan6.service.mallsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.dao.mallsystem.ProductTypeDAO;

@Service
@Transactional
public class ProductTypeService {

	@Autowired
	private ProductTypeDAO productTypeDAO;
	
	public List<ProductType> findAllType(){
		return productTypeDAO.findAll();	
	}
}
