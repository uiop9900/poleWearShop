package com.polewearshop.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.product.dao.ColorDAO;
import com.polewearshop.product.model.Color;

@Service
public class ColorBO {
	
	@Autowired
	private ColorDAO colorDAO;
	
	public void generateColorByColorArr(int productId, String colorArr) {
		String[] colorList = colorArr.split(",");
		for (int i = 0; i < colorList.length; i++) { //color에 값이 있을경우에만 값을 넣는다.
			String color = colorList[i];
			addColor(productId, color);
		}
	}
	
	public void addColor(int productId, String color) {
		colorDAO.insertColor(productId, color);
	}
	
	public void updateColorByProductId(int productId, String color) {
		colorDAO.updateColorByProductId(productId, color);
	}
	
	public void generateUpdateColorByProductId(int productId, String colorArr) {
		String[] colorList = colorArr.split(",");
		for (int i = 0; i < colorList.length; i++) {
			String color = colorList[i];
			updateColorByProductId(productId, color);
		}
	}
	
	public List<Color> getColorListByProductId(int productId) {
		return colorDAO.selectColorListByProductId(productId);
	}
	
	public void deleteColorByProductId(int productId) {
		colorDAO.deleteColorByProductId(productId);
	}
}
