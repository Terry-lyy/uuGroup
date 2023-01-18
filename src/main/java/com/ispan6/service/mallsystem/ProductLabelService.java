package com.ispan6.service.mallsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.dao.mallsystem.ProductLabelDAO;

@Service
@Transactional
public class ProductLabelService {
	
	@Autowired
	private ProductLabelDAO productLabelDAO;
	
	public List<ProductLabel> findAllLabel() {
		return productLabelDAO.findAll();
	}
}
