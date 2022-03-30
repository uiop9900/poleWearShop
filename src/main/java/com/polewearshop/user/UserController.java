package com.polewearshop.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.order.bo.OrderProcessBO;
import com.polewearshop.review.bo.ReviewBO;
import com.polewearshop.review.model.Review;
import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.Member;
import com.polewearshop.user.model.MemberOrderView;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderProcessBO orderProcessBO;
	
	// 로그인화면
	@RequestMapping("/sign_in_view")
	public String signInview(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
	
	// 회원가입 화면
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";
	}
	
	// 비회원 주문조회
	@RequestMapping("/nonMember/orderNumber_check_view")
	public String nonMemberOrderNumberCheck(Model model) {
		model.addAttribute("viewName", "user/orderNumber_check");
		return "template/layout";
	}
	
	//유저화면
	@RequestMapping("/member_page_view")
	public String memberPageView(
			Model model,
			@RequestParam("memberLoginId") String loginId) {
		
		Member user = userBO.getMember(loginId);
		List<MemberOrderView> memberPageViewList = orderProcessBO.getMemberPageViewById(user.getId());
		
		List<Review> reviewList = reviewBO.getReviewListByLoginId(loginId);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("memberPageViewList", memberPageViewList);
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/member_page");
		return "template/layout";
	}
	
	//유저info update 화면
	@RequestMapping("/member_update_page_view")
	public String memberUpdatePageView(
			Model model,
			@RequestParam("memberId") int memberId
			) {
		
		
		Member user = userBO.getMembetById(memberId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/member_update_page");
		return "template/layout";
	}
}
