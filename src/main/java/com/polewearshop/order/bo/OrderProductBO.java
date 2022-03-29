package com.polewearshop.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.order.dao.OrderProductDAO;
import com.polewearshop.order.model.OrderProduct;

@Service
public class OrderProductBO {
	
	@Autowired
	private OrderProductDAO orderProductDAO;
	
	public void addOrderProductByBasketNumber(int orderId, int productId, int count, int price, String color
			,String size) {
		orderProductDAO.insertOrderProductByBasketNumber(orderId, productId, count, price, color, size);
	}
	
	public List<OrderProduct> getOrderProductById(int orderId) {
		return orderProductDAO.selectOrderProductById(orderId);
	}
	
}
