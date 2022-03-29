package com.polewearshop.order.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.Basket;
import com.polewearshop.order.model.Order;
import com.polewearshop.order.model.OrderProduct;
import com.polewearshop.order.model.OrderProductView;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.user.bo.NonMemberBO;
import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.Member;
import com.polewearshop.user.model.MemberOrderView;
import com.polewearshop.user.model.NonMember;

@Service
public class OrderProcessBO {
	
	@Autowired
	private NonMemberBO nonMemberBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private OrderProductBO orderProductBO;
	
	@Autowired
	private BasketBO basketBO;
	
	@Autowired
	private OrderBO orderBO;
	
	//회원의 order를 저장하고 orderProduct메소드를 부른다.
	public void addMemberOrderAndOrderProduct(Order order, int basketNumber) {
		//insert order - orderBO에서 order객체 자체 추가함
		orderBO.addOrder(order);
		
		//insert orderProduct
		int orderId = order.getId();
		addMemberOrderProductByBasketNumber(orderId, basketNumber);
	}
	
	
	//회원의 productOrder 
	public void addMemberOrderProductByBasketNumber(int orderId, int basketNumber) {
		//basket 리스트대로 Order를 추가하고 추가가 성공하면 basket에서 삭제한다.
		List<Basket> basketList = basketBO.getBasketListByBasketNumber(basketNumber);
		int mileage = 0;
		int memberId = 0;
		for (Basket basket : basketList) {
			orderProductBO.addOrderProductByBasketNumber(orderId, basket.getProductId(), basket.getCount(), 
					basket.getPrice(), basket.getColor(), basket.getSize());
			
			//stock, mileage update
			productBO.updateCountById(basket.getProductId(), basket.getCount());
			memberId = basket.getMemberId();
			mileage += basket.getPrice();
		}
		userBO.updateMileageById(memberId, mileage / 10);
		basketBO.deleteBasketByBasketNumber(basketNumber);
	}
	
	
	//비회원 order와 orderProduct를 저장한다.
	public void addNonMemberOrderProductByBasketNumber(NonMember nonMember, String type, int deliveryFee, String deliveredAddress, 
			String	deliveredPhoneNumber, String deliveredComment, String deliveredName, int basketNumber) {
		
		//비회원 정보 저장
		nonMemberBO.addNonMember(nonMember);
		
		//비회원의 order를 객체로 만들고 order에 저장한다.
		Order order = orderBO.makeNonMemberOrder(type, nonMember.getId(), deliveryFee, deliveredAddress, deliveredPhoneNumber, deliveredComment, deliveredName);
		orderBO.addOrder(order);
		
		//basketNumber대로 
		List<Basket> basketList = basketBO.getBasketListByBasketNumber(basketNumber);
		for (Basket basket : basketList) {
			orderProductBO.addOrderProductByBasketNumber(order.getId(), basket.getProductId(), basket.getCount(), 
					basket.getPrice(), basket.getColor(), basket.getSize());
			//stock update
			productBO.updateCountById(basket.getProductId(), basket.getCount());
			basketBO.deleteBasketByBasketNumber(basketNumber);
		}
	}
	
	//회원페이지 조회
	public List<MemberOrderView> getMemberPageViewById(int memberId) {
		List<MemberOrderView> memberPageViewList = new ArrayList<>();
		
		//order저장
		String type = "member";
		List<Order> orderList = orderBO.getOrderListByTypeOrderUserId(type, memberId);
		
		
		for (Order order : orderList) {
			//order 저장
			MemberOrderView memberOrderView = new MemberOrderView();
			memberOrderView.setOrder(order);
			
			//orderId로 orderProduct저장
			List<OrderProduct> orderProductList = orderProductBO.getOrderProductById(order.getId());
			memberOrderView.setOrderProduct(orderProductList);
			
			//orderProduct의 productId로 productList담기
			List<Product> productList = new ArrayList<>();
			for (OrderProduct orderProduct : orderProductList) {
				Product product = productBO.getProductById(orderProduct.getProductId());
				productList.add(product);
		}
			memberOrderView.setProduct(productList);
			memberPageViewList.add(memberOrderView);
		}
		return memberPageViewList;
	}
	
	
	//비회원 주문 조회(order:orderProduct:product = 1:n:m)
	public List<OrderProductView> getNonMemberOrderProductByOrderNumber(String orderNumber) {
		List<OrderProductView> orderProductViewList = new ArrayList<>();
		
		//orderNumber로 nonMember가져옴
		NonMember nonMember = nonMemberBO.getNonMemberByOrderNumber(orderNumber);
		String type = "nonMember";
		//select order
		List<Order> orderList = orderBO.getOrderListByTypeOrderUserId(type, nonMember.getId());
		for (Order order : orderList) {
			OrderProductView orderProductView = new OrderProductView();
			orderProductView.setOrder(order);
			
			List<OrderProduct> orderProductList = orderProductBO.getOrderProductById(order.getId());
			orderProductView.setOrderProduct(orderProductList);
			List<Product> productList = new ArrayList<>();
			for(OrderProduct orderProduct : orderProductList) {
				Product product = productBO.getProductById(orderProduct.getProductId());
				productList.add(product);
			}
			orderProductView.setProduct(productList);
			orderProductViewList.add(orderProductView);
		}
		return orderProductViewList;
		
	}
}
