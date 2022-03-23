package com.polewearshop.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.product.model.Size;

@Repository
public interface SizeDAO {

	public void insertSize(
			@Param("productId") int productId, 
			@Param("size") String size);
	
	public List<Size> selectSizeListByProductId(int productId);
	
	public void deleteSizeByProductId(int productId);
}
