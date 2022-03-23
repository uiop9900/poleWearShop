package com.polewearshop.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.product.model.ProductImages;

@Repository
public interface ProductImagesDAO {

	public List<ProductImages> selectProductImagesListByProductId(int productId);
	
	public void insertProductImages(
			@Param("productImagePath") String productImagePath, 
			@Param("productId") int productId);
	
	public void deleteProductImagesdbByProductId(int productId);
	
	public void updateProductImagestoNullByimagePath(
			@Param("productId") int productId,
			@Param("productImagePath") String productImagePath);
}
