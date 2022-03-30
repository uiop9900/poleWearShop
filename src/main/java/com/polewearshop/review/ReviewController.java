package com.polewearshop.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;

@Controller
@RequestMapping("/customer")
public class ReviewController {

	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("/review_list_view")
	public String reviewListView(Model model) {
		model.addAttribute("viewName", "customer/review_list");
		return "template/layout";
	}
	
	@RequestMapping("/review_create_view")
	public String reviewCreateView(
			Model model,
			@RequestParam("productId") int productId) {
		
		Product product = productBO.getProductById(productId);
		
		
		model.addAttribute("product", product);
		model.addAttribute("viewName", "customer/review_create");
		return "template/layout";
	}
}
