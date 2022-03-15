package com.polewearshop.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

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
	
}
