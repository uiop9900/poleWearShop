package com.polewearshop.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.comment.bo.CommentBO;
import com.polewearshop.comment.model.Comment;
import com.polewearshop.review.bo.ReviewBO;
import com.polewearshop.review.model.Review;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/customer")
public class ReviewController {

	@Autowired
	private CommentBO commentBO;

	@Autowired
	private ReviewBO reviewBO;

	// 리뷰 쓰기 화면
	@ApiOperation(
            value = "review 글쓰기 화면"
            , notes = "review 글쓰기 화면")
	@GetMapping("/review_create_view")
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
	@ApiOperation(
            value = "review 상세 화면"
            , notes = "review 목록에서 클릭 후 들어가는 review 상세 화면")
	@GetMapping("/review_detailed_view") public String reviewDetailedView(
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
