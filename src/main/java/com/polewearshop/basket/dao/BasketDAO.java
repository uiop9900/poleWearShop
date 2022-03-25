package com.polewearshop.basket.dao;

import org.springframework.stereotype.Repository;

import com.polewearshop.basket.model.Basket;

@Repository
public interface BasketDAO {

	public void addBasket(Basket basket);
	
	public void updateBasketNumberById(int basketId);
}
