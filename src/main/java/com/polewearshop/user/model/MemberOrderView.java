package com.polewearshop.user.model;

import java.util.List;

import com.polewearshop.order.model.Order;
import com.polewearshop.order.model.OrderProduct;
import com.polewearshop.product.model.Product;
import com.polewearshop.review.model.Review;

public class MemberOrderView {
	private Order order;
	private List<OrderProduct> orderProduct;
	private List<Product> product;

	public List<OrderProduct> getOrderProduct() {
		return orderProduct;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setOrderProduct(List<OrderProduct> orderProduct) {
		this.orderProduct = orderProduct;
	}
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}

}
