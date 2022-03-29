package com.polewearshop.order.model;

import java.util.List;

import com.polewearshop.product.model.Product;

public class OrderProductView {
	//비회원 조회시 필요
	private Order order;
	private List<Product> product;
	private List<OrderProduct> orderProduct;
	
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	public List<OrderProduct> getOrderProduct() {
		return orderProduct;
	}
	public void setOrderProduct(List<OrderProduct> orderProduct) {
		this.orderProduct = orderProduct;
	}
	
	


}
