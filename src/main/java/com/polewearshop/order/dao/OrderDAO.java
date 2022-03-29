package com.polewearshop.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.order.model.Order;

@Repository
public interface OrderDAO {

	public void insertOrder(Order order);
	
	public List<Order> selectOrderListByTypeOrderUserId(
			@Param("type") String type, 
			@Param("orderUserId") int orderUserId);
}
