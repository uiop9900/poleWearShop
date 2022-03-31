package com.polewearshop.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.product.model.Product;

@Repository
public interface ProductDAO {
	
	public void insertProduct(Product product);
	
	public Product selectProductById(int productId);
	
	public List<Product> selectProductListByType(String type);
	
	public List<Product> selectProductList();
	
	public List<Product> selectProductListForBest();
	
	public void updateProductById(
			@Param("id") int productId, 
			@Param("productNumber") String productNumber, 
			@Param("type") String type, 
			@Param("productName") String productName,
			@Param("content") String content, 
			@Param("price") int price, 
			@Param("stock") int stock); 
	
	public void deleteProductById(int productId);
	
	public void updateCountById(
			@Param("id") int productId, 
			@Param("stock") int stock);
}
