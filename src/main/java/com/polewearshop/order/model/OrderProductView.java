package com.polewearshop.order.model;

import java.util.List;

import com.polewearshop.product.model.Product;

public class OrderProductView {
	//비회원 조회시 필요
	private Order order;
	private List<Product> product;
	private List<OrderProduct> orderProduct;
	private List<String> productImage;
	
	public List<String> getProductImage() {
		return productImage;
	}
	public void setProductImage(List<String> productImage) {
		this.productImage = productImage;
	}
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
