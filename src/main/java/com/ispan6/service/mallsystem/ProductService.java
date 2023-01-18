package com.ispan6.service.mallsystem;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.dao.mallsystem.ProductDAO;

@Service
@Transactional
public class ProductService {
	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private ProductDAO productDAO;

	public List<Product> getAllProduct() {
		return productDAO.findAll();
	}

	public void insertProduct(Product product) {
		productDAO.save(product);
	}

	public void deleteProduct(Integer id) {
		productDAO.deleteById(id);
	}

	public void updateProduct(Integer id) {
		Product product = productDAO.findById(id).get();
		product.setStatus(1);
		productDAO.save(product);
	}

	public List<Product> findByTypeId(Integer id) {
		return productDAO.findByTypeId(id);
	}

	public List<Product> findByLabelId(Integer id) {
		return productDAO.findByLabelId(id);
	}

	public List<Product> findAllProductOrderByPriceDesc() {
		return productDAO.orderByPriceDesc();
	}

	public List<Product> findAllProductOrderByPriceAsc() {
		return productDAO.orderByPriceAsc();
	}

	public List<Product> findAllByPrice(Double lowPrice, Double highPrice) {
		return productDAO.findByPriceBetween(lowPrice, highPrice);
	}

	public Product findById(Integer id) {
		Optional<Product> product = productDAO.findById(id);
		if (product.isPresent()) {
			return product.get();
		}
		return null;
	}

	public List<Product> getAllProductOnSell() {
		return productDAO.getAllProductOnSell();
	}

	public List<Product> findAllProductOrderBySales() {
		return productDAO.findAllProductOrderBySales();
	}

	public List<Product> findAllProductByName(String keyword) {
		return productDAO.findBySearch(keyword);
	}
	
	public List<Product> findByTypeAndLabel(Integer[] typeCondi, Integer[] labelCondi) {
		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Product> query = builder.createQuery(Product.class);
		Root<Product> root = query.from(Product.class);
		List<Integer> typeList = Arrays.asList(typeCondi);
		List<Integer> labelList = Arrays.asList(labelCondi);
		Predicate typePredicate = null;
		Predicate labelPredicate = null;
		
		if (typeCondi.length == 0 && labelCondi.length == 0) {
			return productDAO.getAllProductOnSell();
		}
		
		if(typeCondi.length == 0) {
			typePredicate = root.get("type").in(1,2,3,4);
		}else {
			typePredicate = root.get("type").in(typeList);
		}
		
		if(labelCondi.length == 0) {
			labelPredicate = root.get("label").in(1,2,3);
		}else {
			labelPredicate = root.get("label").in(labelList);
		}
		Predicate statusPredicate = root.get("status").in(0);

		query.where(builder.and(typePredicate, labelPredicate,statusPredicate));

		TypedQuery<Product> typedQuery = entityManager.createQuery(query);
		return typedQuery.getResultList();
	}

	public List<Product> findTop5BySales() {
		return productDAO.findTop5ByOrderBySalesDesc();
	}

	public void insertCSV(String[] fields) {
		Product product = new Product();
		product.setName(fields[0]);
		product.setPrice(Double.valueOf(fields[1]));
		product.setInventory(Integer.valueOf(fields[2]));
		product.setDesc(fields[3]);
		product.setType(Integer.valueOf(fields[4]));
		product.setLabel(Integer.valueOf(fields[5]));
		product.setSales(0);
		product.setStatus(1);
		productDAO.save(product);
	}
	

}
