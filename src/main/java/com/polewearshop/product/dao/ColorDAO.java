package com.polewearshop.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.product.model.Color;

@Repository
public interface ColorDAO {

	public void insertColor(
			@Param("productId") int productId, 
			@Param("color") String color);
	
	public List<Color> selectColorListByProductId(int productId);
}
