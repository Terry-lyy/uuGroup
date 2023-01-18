package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.ispan6.bean.mallsystem.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>,CrudRepository<Product, Integer> {

	
	// show product by Type
	@Query("from Product where p_type = :type")
	public List<Product> findByType(@Param("type") String type);
	@Query("from Product where p_type = ?1")
	public List<Product> findByTypeId(Integer id);

	// show product by Label
	@Query("from Product where p_label = :label")
	public List<Product> findByLabel(@Param("label") String label);
	@Query("from Product where p_label = ?1")
	public List<Product> findByLabelId(Integer id);

	// show product by price
	@Query("from Product where price between ?1 and ?2 and status = 0")
	public List<Product> findByPriceBetween(Double lowpeice, Double highprice);

	// show product order by price desc
	@Query("from Product where status = 0 order by price desc")
	public List<Product> orderByPriceDesc();
	
	// show product order by price asc
	@Query("from Product where status = 0 order by price asc")
	public List<Product> orderByPriceAsc();
	
	// show product order by price inventory
	@Query(value = "select * from product where p_status = 0 and p_name like %?1%", nativeQuery = true)
	public List<Product> findBySearch(String keyword);
	
	@Query("from Product where status = 0")
	public List<Product> getAllProductOnSell();
	
	@Query("from Product where status = 0 order by sales desc")
	public List<Product> findAllProductOrderBySales();

	public List<Product> findTop5ByOrderBySalesDesc();
	
	
	
	



	
	// show product by img search
	// show product by many keyword search
}
