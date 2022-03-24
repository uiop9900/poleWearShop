package com.polewearshop.product.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.common.FileManagerService;
import com.polewearshop.product.dao.ProductImagesDAO;
import com.polewearshop.product.model.ProductImages;

@Service
public class ProductImagesBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private ProductImagesDAO productImagesDAO;
	
	public List<ProductImages> getProductImagesListByProductId(int productId) {
		return productImagesDAO.selectProductImagesListByProductId(productId);
	}
	
	public void deleteProductImagesdbByProductId(int productId) {
		productImagesDAO.deleteProductImagesdbByProductId(productId);
	}
	
	public void updateProductImagestoNullByimagePath(int productId, String productImagePath) {
		//실제 이미지 삭제 후 db는 null로 변환
		try {
			fileManager.deleteFile(productImagePath);
		} catch (IOException e) {
			logger.error("[delete productImage] 삭제할 이미지가 없습니다. productId: {}, productImagePath: {}", productId, productImagePath);
		}
	
		productImagesDAO.updateProductImagestoNullByimagePath(productId, productImagePath);;
	}
	
	public void updateProductImagesByProductId (int productId, String loginId, MultipartFile file1, MultipartFile file2,
			MultipartFile file3, MultipartFile file4, MultipartFile file5) {
		
		String imagePath = null;
		// 삭제 -> 바로 삭제된다.
		// 사진이 들어오는 경우 update해주기
		// 아무것도 들어오지 않는 경우 -> 기존의 path 다시 저장
		List<MultipartFile> fileList = new ArrayList<>();
		fileList.add(file1);
		fileList.add(file2);
		fileList.add(file3);
		fileList.add(file4);
		fileList.add(file5);
		
		for (MultipartFile file : fileList) {
			if (file != null) { //파일을 받으면 파일저장 후 imagePath 저장
				imagePath = fileManager.savefile(loginId, file);
				productImagesDAO.insertProductImages(imagePath, productId);
			} 
			
			if (file == null) {  //파일이 없으면 기존의 imagePath 그대로
					return;
				}
		}
 	}
	
	
	public void addProductImages(int productId, MultipartFile file1, MultipartFile file2,
			MultipartFile file3, MultipartFile file4, MultipartFile file5, String loginId) {
		
		List<MultipartFile> fileList = new ArrayList<>();
		fileList.add(file1);
		fileList.add(file2);
		fileList.add(file3);
		fileList.add(file4);
		fileList.add(file5);

		for (MultipartFile file : fileList) {
			String imagePath = null;
			if (file != null) {
				imagePath = fileManager.savefile(loginId, file);
				productImagesDAO.insertProductImages(imagePath, productId);
			} 
			if (file == null) {
				return;
			}
		}
	}
	
	public void deleteProductImagesByProductId(int productId) {
		List<ProductImages> imageList = getProductImagesListByProductId(productId);
		
		for (ProductImages image : imageList) {
			if (image.getProductImagePath() != null) {
				try {
					fileManager.deleteFile(image.getProductImagePath());
				} catch (IOException e) {
					logger.error("[delete productImage] 삭제할 상품의 이미지가 없습니다. productId: {}", productId);
				}
			}
		}
	}
	

}
