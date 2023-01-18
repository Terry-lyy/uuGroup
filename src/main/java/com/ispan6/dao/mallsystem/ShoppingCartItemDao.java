package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.membersystem.MemberTest;



public interface ShoppingCartItemDao extends JpaRepository<ShoppingCartItem, Integer>,CrudRepository<ShoppingCartItem, Integer>{

	@Query(value = "select * from shoppingcartitem where sci_mid = ?1 and sci_pid = ?2",nativeQuery = true)
	List<ShoppingCartItem> findByMemberIdAndProductId(Integer memberId, Integer id);

	@Query(value = "select * from shoppingcartitem where sci_mid = ?1",nativeQuery = true)
	List<ShoppingCartItem> findAllByMemberId(int i);

	
	

}
