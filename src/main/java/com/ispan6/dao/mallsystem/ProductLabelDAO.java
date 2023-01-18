package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan6.bean.mallsystem.ProductLabel;

public interface ProductLabelDAO extends JpaRepository<ProductLabel, Integer>{

}
