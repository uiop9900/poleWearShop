package com.polewearshop.order.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.order.dao.OrderProductDAO;

@Service
public class OrderProductBO {
	
	@Autowired
	private OrderProductDAO orderProductDAO;
	
	public void addOrderProductByBasketNumber(int orderId, int productId, int count, int price, String color
			,String size) {
		orderProductDAO.insertOrderProductByBasketNumber(orderId, productId, count, price, color, size);
	}
	
}
