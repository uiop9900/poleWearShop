package com.polewearshop.review.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.common.FileManagerService;
import com.polewearshop.review.dao.ReviewDAO;
import com.polewearshop.review.model.Review;

@Service
public class ReviewBO {

	@Autowired
	private FileManagerService managerService;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	private static final int REVIEW_MAX_SIZE = 5;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void addReview(int productId, String productName, String loginId, 
			String subject, String content, MultipartFile file) {
		
		String reviewImage = null;
		if (file != null) {
			reviewImage = managerService.savefile(loginId, file);
		}
		
		reviewDAO.insertReview(productId, productName, loginId, subject, content, reviewImage);
	}
	
	
	public Review getReviewByProductIdAndLoginId(int productId, String loginId) {
		return reviewDAO.selectReviewByProductIdAndLoginId(productId, loginId);
	}
	
	public Review getReviewById(int reviewId) {
		return reviewDAO.selectReviewById(reviewId);
	}
	
	public List<Review> getReviewList() {
		return reviewDAO.selectReviewList();
	}
	
	public List<Review> getReviewListByLoginId(String loginId) {
		return reviewDAO.selectReviewListByLoginId(loginId);
	}

	
	public int getReviewListNumber(int productId) {
		return reviewDAO.selectReviewListNumber(productId);
	}
	
	public List<Review> getReviewListByProductId(int productId, int page) {
		int first = (page - 1) * REVIEW_MAX_SIZE;
		return reviewDAO.selectReviewListByProductId(productId, first, REVIEW_MAX_SIZE);
	}
	
	
	public void deleteReviewById(int reviewId) {
		Review review = getReviewById(reviewId);
		String imagePath = review.getReviewImage();
		
		if (imagePath != null) {
			try {
				managerService.deleteFile(imagePath);
			} catch (IOException e) {
				logger.error("[delete review] 삭제할 review images가 없습니다. reviewId:" , reviewId);
			}
		}
		
		reviewDAO.deleteReviewById(reviewId);
	}
}
