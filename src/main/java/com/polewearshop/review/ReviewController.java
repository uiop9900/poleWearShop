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

@Controller
@RequestMapping("/customer")
public class ReviewController {

	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	
	//리뷰 리스트 화면
	@RequestMapping("/review_list_view")
	public String reviewListView(Model model) {
		
		List<Review> reviewList = reviewBO.getReviewList();
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("viewName", "customer/review_list");
		return "template/layout";
	}
	
	//리뷰 쓰기 화면
	@RequestMapping("/review_create_view")
	public String reviewCreateView(
			Model model,
			@RequestParam("productId") int productId) {
		
		Product product = productBO.getProductById(productId);
		
		
		model.addAttribute("product", product);
		model.addAttribute("viewName", "customer/review_create");
		return "template/layout";
	}
	
	//리뷰 디테일 화면
	@RequestMapping("/review_detailed_view")
	public String reviewDetailedView(
			Model model,
			@RequestParam("reviewId") int reviewId) {
		
		Review review = reviewBO.getReviewById(reviewId);
		ProductViewCompact product = productBO.getProductViewCompactById(review.getProductId());
		String type = "review";
		List<Comment> commentList = commentBO.getCommentListByTypeAndBoardId(type, reviewId);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("review", review);
		model.addAttribute("product", product);
		model.addAttribute("viewName", "customer/review_detailed");
		return "template/layout";
	}
}
