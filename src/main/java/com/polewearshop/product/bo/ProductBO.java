package com.polewearshop.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.product.dao.ProductDAO;
import com.polewearshop.product.model.Color;
import com.polewearshop.product.model.Product;
import com.polewearshop.product.model.ProductImages;
import com.polewearshop.product.model.ProductView;
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
