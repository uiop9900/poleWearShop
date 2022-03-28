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
			int price = basket.getPrice();
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
			//basketNumber가 없으면 id를 basketNumber에 넣고 그 값을 반환한다.
			updateBasketNumberById(basketId, basketId);
			basketNumber = basketId;
		} else if (basketNumber != null) {
			//session에 baksetNumber가 있으면, 그 값을 basketNumber에 저장한다.
			updateBasketNumberById(basketId, basketNumber);
		}
		return basketNumber;
	}
	
	public void updateMemeberIdBybasketNumber(int memberId, int baksetId) {
		basketDAO.updateMemberIdByBasketNumber(memberId, baksetId);
	}
}
