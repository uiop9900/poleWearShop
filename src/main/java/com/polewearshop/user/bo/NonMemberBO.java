package com.polewearshop.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;
import com.polewearshop.user.dao.NonMemberDAO;
import com.polewearshop.user.model.NonMember;

@Service
public class NonMemberBO {
	
	@Autowired
	private BasketBO basketBO;
	
	@Autowired
	private NonMemberDAO nonMemberDAO;
	
	public NonMember getNonMemberByNameOrderNumber(String name, String orderNumber) {
		return nonMemberDAO.selectNonMemberByNameOrderNumber(name, orderNumber);
	}
	
	public void addNonMember(NonMember nonMember) {
		nonMemberDAO.insertNonMember(nonMember);
	}
	
	public NonMember getNonMemberByOrderNumber(String orderNumber) {
		return nonMemberDAO.selectNonMemberByOrderNumber(orderNumber);
	}
	
	public List<Basket> generateNonMemberOrderByBasketNumber(String orderNumber) {
		NonMember nonMember = nonMemberDAO.selectNonMemberByOrderNumber(orderNumber);
		int basketNumber = nonMember.getBasketNumber();
		List<Basket> basketList = basketBO.getBasketListByBasketNumber(basketNumber);

		return basketList;
	}
	
}
