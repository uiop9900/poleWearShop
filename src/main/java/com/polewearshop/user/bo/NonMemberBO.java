package com.polewearshop.user.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;
import com.polewearshop.order.model.OrderProductView;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.user.dao.NonMemberDAO;
import com.polewearshop.user.model.NonMember;

@Service
public class NonMemberBO {
	
	@Autowired
	private ProductBO productBO;
	
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
	
	public List<OrderProductView> generateNonMemberOrderByBasketNumber(String orderNumber) {
		//orderNumber로 nonMember가져옴
		NonMember nonMember = nonMemberDAO.selectNonMemberByOrderNumber(orderNumber);
		int basketNumber = nonMember.getBasketNumber();
		//basket에서 nonMember의 구매정보 가지고 옴
		List<Basket> basketList = basketBO.getBasketListByBasketNumber(basketNumber);
		
		List<OrderProductView> orderProductViewList = new ArrayList<>();
		
		for (Basket basket : basketList) {
			OrderProductView orderProductView = new OrderProductView();
			orderProductView.setBasket(basket);
			
			Product product = productBO.getProductById(basket.getProductId());
			orderProductView.setProduct(product);
			
			orderProductViewList.add(orderProductView);
		}
		return orderProductViewList;
	}
	
}
