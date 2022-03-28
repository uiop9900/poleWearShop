package com.polewearshop.basket.model;

import com.polewearshop.product.model.Product;
import com.polewearshop.user.model.Member;

public class BasketView {
	private Product product;
	private Basket basket;
	private Member member;
	
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}

	
	
	
}
