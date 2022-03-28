package com.polewearshop.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;
import com.polewearshop.order.dao.OrderDAO;
import com.polewearshop.order.model.Order;

@Service
public class OrderBO {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderProductBO orderProductBO;
	
	@Autowired
	private BasketBO basketBO;
	
	
	//basket에서 정보를 가지고 와서 orderProduct에 넣고
	//orderId를 order에 담는다.
	public void addOrder (Order order) {
		orderDAO.insertOrder(order);
	}
	
	public void generateOrderProductByBasketNumber(int orderId, int basketNumber) {
		//basket 리스트대로 Order를 추가하고 추가가 성공하면 basket에서 삭제한다.
		List<Basket> basketList = basketBO.getBasketListByBasketNumber(basketNumber);
		for (Basket basket : basketList) {
			orderProductBO.addOrderProductByBasketNumber(orderId, basket.getProductId(), basket.getCount(), 
					basket.getPrice(), basket.getColor(), basket.getSize());
		}
		basketBO.deleteBasketByBasketNumber(basketNumber);
	}
}
