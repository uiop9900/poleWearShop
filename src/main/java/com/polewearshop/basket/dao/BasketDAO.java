package com.polewearshop.basket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.basket.model.Basket;

@Repository
public interface BasketDAO {

	public void addBasket(Basket basket);
	
	public List<Basket> selectBasketListByBasketNumber(int basketNumber);
	
	public void updateBasketNumberById(
			@Param("id") int basketId,
			@Param("basketNumber") int basketNumber);
	
	public void updateMemberIdByBasketNumber(
			@Param("memberId") int memberId, 
			@Param("basketNumber") int basketNumber);
	
	public void deleteBasketByBasketNumber(int basketNumber);
}
