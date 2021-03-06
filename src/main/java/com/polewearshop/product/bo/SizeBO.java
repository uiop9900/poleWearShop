package com.polewearshop.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.polewearshop.product.dao.SizeDAO;
import com.polewearshop.product.model.Size;

@Service
public class SizeBO {

	@Autowired
	private SizeDAO sizeDAO;
	
	public void generateColorBySizeArr(int productId, String sizeArr) {
		String[] sizeList = sizeArr.split(",");
		for (int i = 0; i < sizeList.length; i++) { //size에 값이 있을경우에만 값을 넣는다.
			String size = sizeList[i];
			addSize(productId, size);
		}
	}
	
	public void generateUpdateColorBtProductId(int productId, String sizeArr) {
		String[] sizeList = sizeArr.split(",");
		
		if (sizeList == null) {
			return;
		}
		
		if (sizeList != null) {
			deleteSizeByProductId(productId);
			for (int i = 0; i < sizeList.length; i++) {
				String size = sizeList[i];
				addSize(productId, size);
			}
		}
	}
	
	public void addSize(int productId, String size) {
		sizeDAO.insertSize(productId, size);
	}
	
	public void updateSizeByProductId(int productId, String size) {
		
	}
	
	public List<Size> getSizeListByProductId(int productId) {
		return sizeDAO.selectSizeListByProductId(productId);
	}
	
	public void deleteSizeByProductId(int productId) {
		sizeDAO.deleteSizeByProductId(productId);
	}
}
