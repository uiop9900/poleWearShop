package com.polewearshop.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.order.model.OrderProduct;

@Repository
public interface OrderProductDAO {

	public void insertOrderProductByBasketNumber(
			@Param("orderId") int orderId, 
			@Param("productId") int productId, 
			@Param("count") int count, 
			@Param("price") int price, 
			@Param("color") String color,
			@Param("size") String size); 
	
	public List<OrderProduct> selectOrderProductById(int orderId);

}
