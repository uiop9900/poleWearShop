package com.polewearshop.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	@RequestMapping("/sign_in_view")
	public String adminSignIn() {
		return "admin/sign_in";
	}
	
	@RequestMapping("/select_view")
	public String adminSelectView() {
		return "admin/select";
	}
	
	@RequestMapping("/product/product_list_view")
	public String adminProductView() {
		return "admin/product/product_list";
	}
	
	@RequestMapping("/product/product_create_view")
	public String admingCreateProduct() {
		return "/admin/product/product_create";
	}
}
