package com.polewearshop.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
	// 로그아웃
	@RequestMapping("/sign_out")
	public String signOut(Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		session.removeAttribute("basketNumber");
		
		model.addAttribute("viewName", "product/main");
		return "template/layout";
	}
	
	
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
		
		User user = userBO.getUser(loginId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/member_page");
		return "template/layout";
	}
}
