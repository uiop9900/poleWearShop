package com.polewearshop.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.bo.ProductImagesBO;
import com.polewearshop.product.model.ProductView;
import com.polewearshop.product.model.ProductViewCompact;
import com.polewearshop.review.bo.ReviewBO;
import com.polewearshop.review.model.Review;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductImagesBO productImagesBO;
	
	
	// 쇼핑몰 메인 화면
	@ApiOperation(
            value = "쇼핑몰 메인 화면"
            , notes = "쇼핑몰의 첫 화면")
	@GetMapping("/main_view")
	public String main(Model model) {
		model.addAttribute("viewName", "product/main");
		
		List<ProductViewCompact> productList = productBO.generateProductViewCompactList();
		model.addAttribute("productList", productList);
		return "template/layout";
	}
	
	// 쇼핑몰 세부화면
	@ApiOperation(
            value = "쇼핑몰 세부 화면"
            , notes = "쇼핑몰의 메뉴를 이용해 들어가는 쇼핑몰의 세부 화면")
	@GetMapping("/shop_view")
	public String shopPageView(
			@RequestParam("type") String type,
			Model model
			) {
		List<ProductViewCompact> productList = productBO.generateProductViewCompactListByType(type);
		
		model.addAttribute("type", type);
		model.addAttribute("productList", productList);
		model.addAttribute("viewName", "product/shop" );
		
		return "template/layout";
	}
	
	//상품세부화면
	@ApiOperation(
            value = "상품 세부 화면"
            , notes = "쇼핑몰안에서 상품 사진을 클릭해 들어가는 상품의 세부화면")
	@GetMapping("/shop_detailed_view")
	public String shopDetailedView(
			Model model,
			@RequestParam("type") String type,
			@RequestParam("productId") int productId,
			@RequestParam(value="vpage", required=false) Integer page
			) {

		//상품 화면
		ProductView product = productBO.generateProductViewById(productId);
		String mainImagePath = productImagesBO.getOneProductImagePathByProductId(productId);
		
		int reviewNumber = reviewBO.getReviewListNumber(productId);
		//페이징
		if (page == null) {
			page = 1;
		}
		
		List<Review> reviewList = reviewBO.getReviewListByProductId(productId, page);
		int first = (page - 1) * 5;
		
		model.addAttribute("first", first);
		model.addAttribute("reviewNumber", reviewNumber);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("mainImagePath", mainImagePath);
		model.addAttribute("product", product);
		model.addAttribute("type", type);
		model.addAttribute("productId", productId);
		
		model.addAttribute("viewName", "product/shop_detailed");
		return "template/layout";
	}
	
	// 쇼핑몰 베스트화면
	@ApiOperation(
            value = "쇼핑몰 best 상품 화면"
            , notes = "쇼핑몰의 재고가 없는 순으로 나열한 Best 상품 화면")
	@GetMapping("/best_list_view")
	public String bestView(Model model) {
		
		List<ProductViewCompact> productList = productBO.generateProductViewCompactListforBest();
		
		
		model.addAttribute("productList", productList);
		model.addAttribute("viewName", "product/best_list");
		return "template/layout";
	}
}
