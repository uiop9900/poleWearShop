package com.polewearshop.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.admin.bo.AdminBO;
import com.polewearshop.admin.model.Admin;
import com.polewearshop.common.CommonEncoder;
import com.polewearshop.product.bo.ColorBO;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.bo.ProductImagesBO;
import com.polewearshop.product.bo.SizeBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.studio.bo.StudioImagesBO;
import com.polewearshop.studio.bo.StudioReserveBO;

import io.swagger.annotations.ApiOperation;

@RestController	
@RequestMapping("/admin")
public class AdminRestController {

	@Autowired
	private StudioImagesBO studioImagesBO;
	
	@Autowired
	private StudioReserveBO studioReserveBO;
	
	@Autowired
	private ProductImagesBO productImagesBO;
	
	@Autowired
	private SizeBO sizeBO;
	
	@Autowired 
	private ColorBO colorBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private AdminBO adminBO;
	
	@Autowired
	private CommonEncoder encoder;

	@ApiOperation(
            value = "어드민 로그인"
            , notes = "입력받은 아이디, 비밀번호 확인 후 로그인을 한다.")
	@PostMapping("/sign_in")
	public Map<String, Object> adminSignIn(
			@RequestParam("adminId") String adminId,
			@RequestParam("adminPassword") String password,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		Admin admin = adminBO.getAdmin(adminId);
		
		if (admin == null) {
			result.put("result", "fail");
			return result;
		}
		
		//비밀번호 확인
		boolean match = encoder.matches(password, admin.getAdminPassword());
		
		if (match == false) {
			result.put("result", "fail");
			return result;
		}

		result.put("result", "success");
		HttpSession session = request.getSession();
		session.setAttribute("adminId", admin.getAdminId());
		
		return result;
	}
	
	@ApiOperation(
            value = "새로운 상품 추가하기"
            , notes = "입력받은 상품명, 정보들을 확인 후 새로운 상품에 추가한다.")
	@PostMapping("/product/product_create")
	public Map<String, Object> productCreate(
			@ModelAttribute Product product,
			@RequestParam("colorArr") String colorArr,
			@RequestParam("sizeArr") String sizeArr,
			@RequestParam(value="file1", required=false) MultipartFile file1 ,
			@RequestParam(value="file2", required=false) MultipartFile file2 ,
			@RequestParam(value="file3", required=false) MultipartFile file3 ,
			@RequestParam(value="file4", required=false) MultipartFile file4 ,
			@RequestParam(value="file5", required=false) MultipartFile file5 ,
			HttpServletRequest request
			){
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		//product 추가 
		productBO.addProduct(product);

		//color 추가
		colorBO.generateColorByColorArr(product.getId(), colorArr);

		//size 추가
		sizeBO.generateColorBySizeArr(product.getId(), sizeArr);
		
		//사진 추가
		HttpSession session = request.getSession();
		String adminLoginId = (String)session.getAttribute("adminId");
		productImagesBO.addProductImages(product.getId(), file1, file2, file3, file4, file5, adminLoginId);
		
		result.put("result", "success");
		return result;
	}

	
	@ApiOperation(
            value = "상품 업데이트하기"
            , notes = "입력받은 상품id를 기반으로 변경된 정보를 저장한다.,")
	@PutMapping("/product/product_update")
	public Map<String, Object> productUpdate(
			@RequestParam("productNumber") String productNumber,
			@RequestParam("type") String type,
			@RequestParam("productName") String productName,
			@RequestParam("content") String content,
			@RequestParam("price") int price,
			@RequestParam("stock") int stock,
			@RequestParam("productId") int productId,
			@RequestParam("colorArr") String colorArr,
			@RequestParam("sizeArr") String sizeArr,
			@RequestParam(value="file1", required=false) MultipartFile file1 ,
			@RequestParam(value="file2", required=false) MultipartFile file2 ,
			@RequestParam(value="file3", required=false) MultipartFile file3 ,
			@RequestParam(value="file4", required=false) MultipartFile file4 ,
			@RequestParam(value="file5", required=false) MultipartFile file5 ,
			HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		String adminLogindId = (String)session.getAttribute("adminId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		//기존의 product 정보 update
		productBO.updateProductById(productId, productNumber, type, productName, content, price, stock);
		colorBO.generateUpdateColorByProductId(productId, colorArr);
		sizeBO.generateUpdateColorBtProductId(productId, sizeArr);
		
		//사진 삭제는 화면에서 바로 가능, 추가시 새롭게 저장
		productImagesBO.updateProductImagesByProductId(productId, adminLogindId, file1, file2, file3, file4, file5);
		
		result.put("result", "success");
		return result;
	}
	
	
	@ApiOperation(
            value = "상품삭제하기"
            , notes = "productId를 받아서 상품을 삭제한다.")
	@DeleteMapping("/product/delete_product")
	public Map<String, Object> deleteProduct(@RequestParam("productId") int productId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result","fail");
		
		productBO.generateDeleteProductById(productId);
		result.put("result","success");
		
		return result;
	}
	
    @ApiOperation(
            value = "스튜디오 예약 확정하기"
            , notes = "유저가 남긴 예약사항을 보고 udate해서 확정시킨다." )
    @PutMapping("/studio/update_studio_reserve")
    public Map<String, Object> updateSturioReserve(
    		@RequestParam("studioReserveId") int id,
			@RequestParam("studioId") int studioId,
			@RequestParam("visitorName") String visitorName,
			@RequestParam("visitorPhoneNumber") String visitorPhoneNumber,
			@RequestParam("visitorDate") String visitorDate,
			@RequestParam("visitorTime") String visitorTime,
			@RequestParam("price") int price
    		) {
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	
    	studioReserveBO.updateNonFixReserve(id, studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime, price);
    	
    	result.put("result", "success");
    	return result;
    }
    
    @ApiOperation(
            value = "스튜디오 예약 삭제"
            , notes = "스튜디오의 예약을 삭제한다." )
    @DeleteMapping("/studio/delete_studio_reserve")
    public Map<String, Object> deleteStuidioReserve(
    		@RequestParam("reserveId") int reserveId ) {
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	
    	//예약을 삭제한다.
    	studioReserveBO.deleteStudioReserveById(reserveId);
    	result.put("result", "success");
    	return result;
    }
    
    
    @ApiOperation(
            value = "스튜디오 시설 사진 저장"
            , notes = "admin에서 스튜디오의 시설 사진을 저장한다." )
    @PostMapping("/studio/studio_images_list")
    public Map<String, Object> stuidioImagesList(
    		@RequestParam("studioId") int studioId,
    		@RequestParam("type") String type,
    		@RequestParam("file") MultipartFile file,
    		HttpSession session
    		) {
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	
    	String admin = (String)session.getAttribute("adminId");
    	
    	//사진을 저장한다.
    	studioImagesBO.addStudioImages(admin, studioId, type, file);
    	
    	result.put("result", "success");
    	return result;
    }
    
    @ApiOperation(
            value = "스튜디오 시설 사진 삭제"
            , notes = "스튜디오의 시설 사진을 삭제한다." )
    @DeleteMapping("/studio/delete_studio_image")
    public Map<String, Object> deleteStuidioImages(
    		@RequestParam("imagePath") String imagePath ) {
    	Map<String, Object> result = new HashMap<>();
    	result.put("result", "fail");
    	
    	//사진을 삭제한다.
    	studioImagesBO.deleteStudioImage(imagePath);
    	result.put("result", "success");
    	return result;
    }
    

}
