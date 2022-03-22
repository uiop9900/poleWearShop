package com.polewearshop.product.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.product.dao.ColorDAO;

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
}
