package com.polewearshop.order.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderProductDAO {

	public void insertOrderProductByBasketNumber(
			@Param("orderId") int orderId, 
			@Param("productId") int productId, 
			@Param("count") int count, 
			@Param("price") int price, 
			@Param("color") String color,
			@Param("size") String size); 
}
