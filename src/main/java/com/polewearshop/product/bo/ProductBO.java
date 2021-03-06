package com.polewearshop.product.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<Product> getProductList() {
		return productDAO.selectProductList();
	}
	
	public List<Product> getProductListForBest() {
		return productDAO.selectProductListForBest();
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
	
	
	//main화면의 최신 상품 6개의 정보만
	public List<ProductViewCompact> generateProductViewCompactList() {
		List<ProductViewCompact> productViewCompactList = new ArrayList<>();
		
		List<Product> productList = getProductList();
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
	

	
	//best화면의 stock정렬로
	public List<ProductViewCompact> generateProductViewCompactListforBest() {
		List<ProductViewCompact> productViewCompactList = new ArrayList<>();
		
		List<Product> productList = getProductListForBest();
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
	
	@Transactional
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

	@Transactional
	public ProductViewCompact getProductViewCompactById(int productId) {
		ProductViewCompact productCompact = new ProductViewCompact();
		
		Product product = getProductById(productId);
		productCompact.setProduct(product);
		
		List<ProductImages> productImgaesList = productImagesBO.getProductImagesListByProductId(product.getId());
		productCompact.setProductImagePath(productImgaesList.get(0).getProductImagePath());
		
		return productCompact;
	}
	
	
	public void updateProductById(int productId, String productNumber, String type, String productName,
			String content, int price, int stock) {
		productDAO.updateProductById(productId, productNumber, type, productName, content, price, stock);
	}

	public void deleteProductById(int productId) {
		productDAO.deleteProductById(productId);
	}
	
	@Transactional
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
	

	//stock수 반영
	@Transactional
	public void updateCountById(int productId, int count) {
		Product product = getProductById(productId);
		int stock = product.getStock() - count;
		productDAO.updateCountById(productId, stock);
	}
}
