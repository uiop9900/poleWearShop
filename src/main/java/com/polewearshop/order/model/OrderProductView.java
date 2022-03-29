package com.polewearshop.order.model;

import com.polewearshop.basket.model.Basket;
import com.polewearshop.product.model.Product;

public class OrderProductView {
	//비회원 조회시 필요
	private Product product;
	private Basket basket;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Basket getBasket() {
		return basket;
	}
	public void setBasket(Basket basket) {
		this.basket = basket;
	}
	

	
	
}
