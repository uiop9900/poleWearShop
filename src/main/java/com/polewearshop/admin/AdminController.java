package com.polewearshop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("/sign_in_view")
	public String adminSignIn() {
		return "admin/sign_in";
	}
	
	@RequestMapping("/select_view")
	public String adminSelectView() {
		return "admin/select";
	}
	
	@RequestMapping("/product/product_list_view")
	public String adminProductView(
			@RequestParam(value="type", required=false) String type,
			Model model) {
		
		List<Product> productList = productBO.getProductListByType(type);
		
		
		if (type == null || type.equals("all")) {
			model.addAttribute("type", "All");
		} else if (type != null) {
			model.addAttribute("type", type);
		}
		model.addAttribute("productList", productList);
		return "admin/product/product_list";
	}
	
	@RequestMapping("/product/product_create_view")
	public String admingCreateProduct() {
		return "/admin/product/product_create";
	}
}
