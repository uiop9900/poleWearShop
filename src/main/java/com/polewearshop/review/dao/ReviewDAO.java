package com.polewearshop.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.review.model.Review;

@Repository
public interface ReviewDAO {

	public void insertReview(
			@Param("productId") int productId,
			@Param("productName") String productName, 
			@Param("loginId") String loginId, 
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("reviewImage") String reviewImage);
	
	public List<Review> selectReviewListByLoginId(String loginId);
}
