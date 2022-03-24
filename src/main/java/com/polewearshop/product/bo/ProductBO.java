package com.polewearshop.product.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.product.dao.ProductDAO;
import com.polewearshop.product.model.Color;
import com.polewearshop.product.model.Product;
import com.polewearshop.product.model.ProductImages;
import com.polewearshop.product.model.ProductView;
import com.polewearshop.product.model.ProductViewCompact;
import com.polewearshop.product.model.Size;

@Service
public class ProductBO {

	@Autowired
	private ProductImagesBO productImagesBO;
	
	@Autowired
	private ColorBO colorBO;
	
	@Autowired
	private SizeBO sizeBO;
	
	@Autowired
	private ProductDAO productDAO;
	
	
	
	public void addProduct(Product product) {
		productDAO.insertProduct(product);
	}
	
	public Product getProductById(int productId) {
		return productDAO.selectProductById(productId);
	}
	
	
	public List<Product> getProductListByType(String type) {
		if (type == null || type.equals("all")) {
			type = null;
		}
		return productDAO.selectProductListByType(type);
	}
	
	
	public List<ProductViewCompact> generateProductViewCompactListByType(String type) {
		List<ProductViewCompact> productViewCompactList = new ArrayList<>();
		
		
		List<Product> productList = getProductListByType(type);
		for (Product product: productList) {
			// 반복마다 새롭게 new로 객체 생성
			ProductViewCompact productViewCompact = new ProductViewCompact();
			// 하나의 상품 정보 저장
			productViewCompact.setProduct(product);
			// 사진리스트 중 하나만 메인 사진으로 저장
			List<ProductImages> productImgaesList = productImagesBO.getProductImagesListByProductId(product.getId());
			productViewCompact.setProductImagePath(productImgaesList.get(0).getProductImagePath());
			//list에 append
			productViewCompactList.add(productViewCompact);
		}
		return productViewCompactList;
	}
	
	public void deleteProductById(int productId) {
		productDAO.deleteProductById(productId);
	}
	
	public ProductView generateProductViewById(int productId) {
		ProductView productView = new ProductView();
		
		//product담기
		Product product = getProductById(productId);
		productView.setProduct(product);
		
		//color List담기
		List<Color> colorList = colorBO.getColorListByProductId(productId);
		productView.setColor(colorList);
			
		//size List담기
		List<Size> sizeList = sizeBO.getSizeListByProductId(productId);
		productView.setSize(sizeList);
			
			
		// productImages 담기
		List<ProductImages> productImagesList = productImagesBO.getProductImagesListByProductId(productId);
		productView.setProductImages(productImagesList);
				
		return productView;
		}

	
	public void updateProductById(int productId, String productNumber, String type, String productName,
			String content, int price, int stock) {
		productDAO.updateProductById(productId, productNumber, type, productName, content, price, stock);
	}

	
	public void generateDeleteProductById(int productId) {
		//product
		deleteProductById(productId);
		
		//color
		colorBO.deleteColorByProductId(productId);
		
		//size
		sizeBO.deleteSizeByProductId(productId);
		
		//productImages
		productImagesBO.deleteProductImagesByProductId(productId);
		productImagesBO.deleteProductImagesdbByProductId(productId);
		
	}
		
}
