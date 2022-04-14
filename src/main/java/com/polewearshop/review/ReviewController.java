package com.polewearshop.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.comment.bo.CommentBO;
import com.polewearshop.comment.model.Comment;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.product.model.ProductViewCompact;
import com.polewearshop.review.bo.ReviewBO;
import com.polewearshop.review.model.Review;

import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("/customer")
@ApiIgnore 
public class ReviewController {

	@Autowired
	private CommentBO commentBO;

	@Autowired
	private ReviewBO reviewBO;

	// 리뷰 쓰기 화면
	@RequestMapping("/review_create_view")
	public String reviewCreateView(Model model, 
			@RequestParam("productId") int productId,
			@RequestParam("productName") String productName, 
			@RequestParam("productImage") String productImage,
			@RequestParam("productPrice") int productPrice) {

		model.addAttribute("productId", productId);
		model.addAttribute("productName", productName);
		model.addAttribute("productPrice", productImage);
		model.addAttribute("productPrice", productPrice);
		model.addAttribute("viewName", "customer/review_create");
		return "template/layout";
	}


	//리뷰 디테일 화면
	 @RequestMapping("/review_detailed_view") public String reviewDetailedView(
			 Model model,
			 @RequestParam("reviewId") int reviewId,
			 @RequestParam("productId") int productId,
			 @RequestParam("productName") String productName, 
			 @RequestParam("image") String productImage,
			 @RequestParam("price") int productPrice) {
	 
		 Review review = reviewBO.getReviewById(reviewId); 
		 //comment
		 String type = "review";
		 List<Comment> commentList = commentBO.getCommentListByTypeAndBoardId(type, reviewId);
	 
		 model.addAttribute("commentList", commentList);
		 model.addAttribute("productId", productId);
		 model.addAttribute("productName", productName);
		 model.addAttribute("productImage", productImage);
		 model.addAttribute("productPrice", productPrice);
		 model.addAttribute("review", review); 
		 model.addAttribute("viewName", "customer/review_detailed");
	 return	 "template/layout"; }
	
}
