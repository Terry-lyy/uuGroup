package com.ispan6.dao.matchsystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.ispan6.bean.matchsystem.SelfHobbitBean;

public interface SelfHobbitDto extends JpaRepository<SelfHobbitBean, Integer>, JpaSpecificationExecutor<SelfHobbitBean> {

}
