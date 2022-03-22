package com.polewearshop.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ColorDAO {

	public void insertColor(
			@Param("productId") int productId, 
			@Param("color") String color);
}
