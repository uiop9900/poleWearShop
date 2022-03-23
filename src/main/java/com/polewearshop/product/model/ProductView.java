package com.polewearshop.product.model;

import java.util.List;

public class ProductView {
	private Product product;
	private List<Color> color;
	private List<Size> size;
	private List<ProductImages> productImages;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public List<Color> getColor() {
		return color;
	}
	public void setColor(List<Color> color) {
		this.color = color;
	}
	public List<Size> getSize() {
		return size;
	}
	public void setSize(List<Size> size) {
		this.size = size;
	}
	public List<ProductImages> getProductImages() {
		return productImages;
	}
	public void setProductImages(List<ProductImages> productImages) {
		this.productImages = productImages;
	}
	
	
	
}
