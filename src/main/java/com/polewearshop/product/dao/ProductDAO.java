package com.polewearshop.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.polewearshop.product.model.Product;

@Repository
public interface ProductDAO {
	
	public void insertProduct(Product product);
	
	public List<Product> selectProductListByType(String type);
}
