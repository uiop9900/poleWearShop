package com.polewearshop.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.review.bo.ReviewBO;
import com.polewearshop.review.model.Review;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/customer")
public class ReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
    @ApiOperation(
            value = "리뷰 작성"
            , notes = "회원만 리뷰를 작성가능하다.")
	@PostMapping("/review_create")
	public Map<String, Object> reviewCreate(
			@RequestParam("productId") int productId,
			@RequestParam("productName") String productName,
			@RequestParam("memberLoginId") String memberLoginId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file
			
			) {
		
		 Map<String, Object> result = new HashMap<>();
		 result.put("result", "fail");
		 
		 reviewBO.addReview(productId, productName, memberLoginId, subject, content, file);
		 
		 result.put("loginId", memberLoginId);
		 result.put("result", "success");
		 return result;
	}
	
    @ApiOperation(
            value = "리뷰 업데이트"
            , notes = "이미 작성된 리뷰는 업데이트되고 작성하지 않은 리뷰는 새롭게 쓴다.")
    @GetMapping("/review_is_duplicate")
    Map<String, Object> reviewIsDuplicate(
    		@RequestParam("productId") int productId,
    		@RequestParam("logindId") String memberLoginId
    		){
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	result.put("productId", productId);
    	Review review = reviewBO.getReviewByProductIdAndLoginId(productId, memberLoginId);
    	
    	if (review != null) {
    		result.put("result", "fail");
    		result.put("result", "success");
    	}
    	
    	return result;
    }
    
    @ApiOperation(
            value = "리뷰 삭제"
            , notes = "본인이 쓴 리뷰만이 삭제 가능하다.")
	@DeleteMapping("/review_delete")
    Map<String, Object> reviewDelete(
    		@RequestParam("reviewId") int reviewId) {
    	
    	 Map<String, Object> result = new HashMap<>();
    	 result.put("result", "fail");
    	 
    	 reviewBO.deleteReviewById(reviewId);
    	 result.put("result", "success");
    	 
    	 return result;
    }
    
}
