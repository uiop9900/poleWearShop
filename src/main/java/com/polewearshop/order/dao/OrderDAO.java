package com.polewearshop.order.dao;

import org.springframework.stereotype.Repository;

import com.polewearshop.order.model.Order;

@Repository
public interface OrderDAO {

	public void insertOrder(Order order);
}
