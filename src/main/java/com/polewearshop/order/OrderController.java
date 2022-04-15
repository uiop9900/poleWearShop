package com.polewearshop.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.basket.bo.BasketBO;
import com.polewearshop.basket.model.BasketView;
import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.Member;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private BasketBO basketBO;
	
	// 구매하기버튼 - 로그인
	@ApiOperation(
            value = "로그인 화면2"
            , notes = "비로그인상태에서 제품 상세페이지의 구매하기 버튼을 누르면 이동되는 로그인 화면")
	@GetMapping("/sign_in_view")
	public String orderSignInView(Model model) {
		model.addAttribute("viewName", "order/sign_in");
		return "template/layout";
	}
	
	//비회원-구매하기-로그인-멤버구매
	@ApiOperation(
            value = "회원의 구매 화면"
            , notes = "로그인화면에서 로그인 시 이동하는 회원의 구매 화면")
	@GetMapping("/order_member_view")
	public String orderMemberView(
			Model model,
			@RequestParam("basketNumber") int basketNumber,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int memberId = (int)session.getAttribute("memberId");
		
		basketBO.updateMemberIdByBasketNumber(memberId, basketNumber);
		int totalPrice = basketBO.getTotalPrice(basketNumber);

		List<BasketView> basketViewList = basketBO.getBasketViewListByBasketNumber(basketNumber);
		Member member = userBO.getMembetById(memberId);
		
		model.addAttribute("basketViewList", basketViewList);
		model.addAttribute("totalPrice", totalPrice);
		if (totalPrice > 30000) {
			model.addAttribute("deliveryFee", 0);
		} else {
			model.addAttribute("deliveryFee", 3000);
			
		}
		model.addAttribute("member", member);
		model.addAttribute("viewName", "order/order_member");
		model.addAttribute("basketNumber", basketNumber);
		
		return "template/layout";
	}
	
	
	// 비회원으로 구매하기
	@ApiOperation(
            value = "비회원으로 구매하기"
            , notes = "로그인하지 않고 비회원으로 구매하는 화면")
	@GetMapping("/order_nonMember_view")
	public String orderNonMemberView(
			Model model,
			HttpServletRequest request,
			@RequestParam("basketNumber") int basketNumber
			) {
		
		List<BasketView> basketViewList = basketBO.getBasketViewListByBasketNumber(basketNumber);
		int totalPrice = basketBO.getTotalPrice(basketNumber);
		
		if (totalPrice > 30000) {
			model.addAttribute("deliveryFee", 0);
		} else {
			model.addAttribute("deliveryFee", 3000);
			
		}
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("basketViewList", basketViewList);
		model.addAttribute("basketNumber", basketNumber);
		model.addAttribute("viewName", "order/order_nonMember");
		return "template/layout";
	}
}
