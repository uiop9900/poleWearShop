package com.polewearshop.basket.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.basket.dao.BasketDAO;
import com.polewearshop.basket.model.Basket;
import com.polewearshop.basket.model.BasketView;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.Member;

@Service
public class BasketBO {
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private BasketDAO basketDAO;
	
	public void addBasket(Basket basket) {
		basketDAO.addBasket(basket);
	}
	
	public List<Basket> getBasketListByBasketNumber(int basketNumber) {
		return basketDAO.selectBasketListByBasketNumber(basketNumber);
	}
	
	public List<Basket> getBasketListByMemberId(int memberId) {
		return basketDAO.selectBasketListByMemberId(memberId);
	}
	
	public List<BasketView> getBasketViewListByMemberId(int memberId) {
		List<BasketView> basketViewList = new ArrayList<>();
		
		List<Basket> basketList = getBasketListByMemberId(memberId);
		for (Basket basket : basketList) {
			BasketView basketView = new BasketView();
			basketView.setBasket(basket);
			
			Product product = productBO.getProductById(basket.getProductId());
			basketView.setProduct(product);

			basketViewList.add(basketView);
		}
		return basketViewList;
	}
	
	
	public List<BasketView> getBasketViewListByBasketNumber(int basketNumber) {
		List<BasketView> basketViewList = new ArrayList<>();
		
		List<Basket> basketList = getBasketListByBasketNumber(basketNumber);
		for (Basket basket : basketList) {
			BasketView basketView = new BasketView();
			basketView.setBasket(basket);
			
			Product product = productBO.getProductById(basket.getProductId());
			basketView.setProduct(product);

			basketViewList.add(basketView);
 		}
		return basketViewList;
	}
	
	public int getTotalPrice(int basketNumber) {
		int total = 0;
		List<Basket> basketList = getBasketListByBasketNumber(basketNumber);
		for (Basket basket : basketList) {
			int price = basket.getPrice() * basket.getCount();
			total += price;
		}
		return total;
	}
	public void updateBasketNumberById(int basketId, int basketNumber) {
		basketDAO.updateBasketNumberById(basketId, basketNumber);;
	}
	
	public void updateMemberIdByBasketNumber(int memberId, int basketNumber) {
		basketDAO.updateMemberIdByBasketNumber(memberId, basketNumber);
	}
	
	public int setSessionBasketNumberUptoTheFirstOrder(Integer basketNumber, int basketId) {

		if (basketNumber == null) {
			//basketNumber??? ????????? id??? basketNumber??? ?????? ??? ?????? ????????????.
			updateBasketNumberById(basketId, basketId);
			basketNumber = basketId;
		} else if (basketNumber != null) {
			//session??? baksetNumber??? ?????????, ??? ?????? basketNumber??? ????????????.
			updateBasketNumberById(basketId, basketNumber);
		}
		return basketNumber;
	}
	
	public void updateMemeberIdBybasketNumber(int memberId, int baksetId) {
		basketDAO.updateMemberIdByBasketNumber(memberId, baksetId);
	}
	
	public void deleteBasketByBasketNumber(int basketNumber) {
		basketDAO.deleteBasketByBasketNumber(basketNumber);
	}
	
	public void deleteBasketById(int basketId) {
		basketDAO.deleteBasketById(basketId);
	}
}
