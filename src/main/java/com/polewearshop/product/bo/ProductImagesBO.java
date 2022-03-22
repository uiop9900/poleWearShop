package com.polewearshop.product.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.common.FileManagerService;
import com.polewearshop.product.dao.ProductImagesDAO;

@Service
public class ProductImagesBO {
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private ProductImagesDAO productImagesDAO;
	
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
	

}
