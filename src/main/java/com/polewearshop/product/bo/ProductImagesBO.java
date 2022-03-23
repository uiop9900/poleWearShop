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
			} 
			productImagesDAO.insertProductImages(imagePath, productId);
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
