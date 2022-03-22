package com.polewearshop.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductImagesDAO {

	public void insertProductImages(
			@Param("productImagePath") String productImagePath, 
			@Param("productId") int productId);
}
