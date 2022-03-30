package com.polewearshop.review.bo;

import java.util.List;

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
	
	public void addReview(int productId, String productName, String loginId, 
			String subject, String content, MultipartFile file) {
		
		String reviewImage = null;
		if (file != null) {
			reviewImage = managerService.savefile(loginId, file);
		}
		
		reviewDAO.insertReview(productId, productName, loginId, subject, content, reviewImage);
	}
	
	public List<Review> getReviewListByLoginId(String loginId) {
		return reviewDAO.selectReviewListByLoginId(loginId);
	}
	
}
