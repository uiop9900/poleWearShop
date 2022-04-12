package com.polewearshop.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.product.bo.ProductImagesBO;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/productImages")
public class ProductImagesRestController {

	@Autowired
	private ProductImagesBO productImagesBO;
   
	@ApiOperation(
            value = "사진 삭제"
            , notes = "사진을 삭제한다.")
	@DeleteMapping("/delete_productImages")
	public Map<String, Object> deleteProductImages(
			@RequestParam("productId") int productId,
			@RequestParam("imagePath") String productImagePath
			){
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		productImagesBO.deleteProductImageByimagePath(productId, productImagePath);
		
		return result;
	}
	
}
