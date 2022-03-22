package com.polewearshop.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SizeDAO {

	public void insertSize(
			@Param("productId") int productId, 
			@Param("size") String size);
}
