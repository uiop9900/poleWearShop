package com.polewearshop.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.order.dao.OrderDAO;
import com.polewearshop.order.model.Order;

@Service
public class OrderBO {

	
	@Autowired
	private OrderDAO orderDAO;
	
	
	public void addOrder (Order order) {
		orderDAO.insertOrder(order);
	}
	
	public Order makeNonMemberOrder(String type, int nonMemberId, int deliveryFee, String deliveredAddress, 
			String	deliveredPhoneNumber, String deliveredComment, String deliveredName) {
		
		Order order = new Order();
		order.setType(type);
		order.setOrderUserId(nonMemberId);
		order.setDeliveryFee(deliveryFee);
		order.setDeliveredAddress(deliveredAddress);
		order.setDeliveredPhoneNumber(deliveredPhoneNumber);
		order.setDeliveredComment(deliveredComment);
		order.setDeliveredName(deliveredName);
		
		return order;
	}
	
	public List<Order> getOrderListByTypeOrderUserId(String type, int orderUserId) {
		return orderDAO.selectOrderListByTypeOrderUserId(type, orderUserId);
	}

}
