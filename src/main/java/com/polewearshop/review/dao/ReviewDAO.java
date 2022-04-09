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
	
	public List<Review> selectReviewList();
	
	public List<Review> selectReviewListByLoginId(String loginId);
	
	public Review selectReviewByProductIdAndLoginId(
			@Param("productId") int productId, 
			@Param("loginId") String loginId);

	public Review selectReviewById(int reviewId);
	
	public int selectReviewListNumber(int productId);
	
	public List<Review> selectReviewListByProductId(
			@Param("productId") int productId,
			@Param("first") int first,
			@Param("number") int number);
	
	public void deleteReviewById(int reviewId);
}
