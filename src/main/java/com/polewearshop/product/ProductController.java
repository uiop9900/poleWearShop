package com.polewearshop.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	// 쇼핑몰 메인 화면
	@RequestMapping("/main_view")
	public String main(Model model) {
		model.addAttribute("viewName", "product/main");
		return "template/layout";
	}
}
