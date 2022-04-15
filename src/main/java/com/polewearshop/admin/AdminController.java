package com.polewearshop.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.product.model.ProductView;
import com.polewearshop.studio.bo.StudioImagesBO;
import com.polewearshop.studio.bo.StudioReserveBO;
import com.polewearshop.studio.model.StudioImages;
import com.polewearshop.studio.model.StudioReserve;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudioImagesBO studioImagesBO;
	
	@Autowired
	private StudioReserveBO studioReserveBO;
	
	@Autowired
	private ProductBO productBO;
	
	//admin 로그인
	@ApiOperation(
            value = "어드민 로그인"
            , notes = "어드민 로그인 화면")
	@GetMapping("/sign_in_view")
	public String adminSignIn() {
		return "admin/sign_in";
	}
	
	// admin select창 - product, studio
	@ApiOperation(
            value = "어드민 select"
            , notes = "어드민 로그인후, product와 studio 선택 화면")
	@GetMapping("/select_view")
	public String adminSelectView() {
		return "admin/select";
	}
	
	// admin product - list
	@ApiOperation(
            value = "어드민 product"
            , notes = "어드민 상품 리스트 화면")
	@GetMapping("/product/product_list_view")
	public String adminProductView(
			@RequestParam(value="type", required=false) String type,
			Model model) {
		
		List<Product> productList = productBO.getProductListByType(type);
		
		
		if (type == null || type.equals("all")) {
			model.addAttribute("type", "All");
		} else if (type != null) {
			model.addAttribute("type", type);
		}
		model.addAttribute("productList", productList);
		return "admin/product/product_list";
	}
	
	
	// admin product - 새로운 상품 추가
	@ApiOperation(
            value = "어드민 product create"
            , notes = "어드민 상품 추가화면")
	@GetMapping("/product/product_create_view")
	public String admingCreateProduct() {
		return "admin/product/product_create";
	}
	
	// admin product - 상품 update, delete
	@ApiOperation(
            value = "어드민 product detailed"
            , notes = "어드민 상품 리스트에서 상품클릭으로 상품 세부 화면")
	@GetMapping("/product/product_detailed_view")
	public String adminProductDetailedView(
			@RequestParam("productId") int productId,
			Model model
			) {
		
		ProductView productView = productBO.generateProductViewById(productId);
		model.addAttribute("productView", productView);
		return "admin/product/product_detailed";
	}
	
	//admin studio_main화면
	@ApiOperation(
            value = "어드민 studio"
            , notes = "어드민 스튜디오의 메인 화면")
	@GetMapping("/studio/main_view")
	public String adminStudioMainView(Model model,
			@RequestParam(value="studioId", required=false) Integer studioId,
			@RequestParam(value="visitorDate", required=false) String date,
			@RequestParam(value="btnType", required=false) String btnType
			) {
		
		List<StudioReserve> reserveList = studioReserveBO.generateStudioReserveList(btnType, date);
		List<StudioImages> studioImages = studioImagesBO.getStudioImagesByStudioId(studioId);
		
		model.addAttribute("studioId", studioId);
		model.addAttribute("studioImages", studioImages);
		model.addAttribute("reserveList", reserveList);
		return "admin/studio/main";
	}
	
	//admin-update-view
	@ApiOperation(
            value = "어드민 studio의 예약을 update하기 위한 화면"
            , notes = "어드민 스튜디오에서 예약 목록을 눌러 보는 세부화면 ")
	@GetMapping("/studio/update_reserve_list_view")
	public String adminStudioUpdateReserveListView(Model model,
			@RequestParam("reserveId") int reserveId ) {
		
		StudioReserve reserve = studioReserveBO.getStudioReserveById(reserveId);
		
		model.addAttribute("reserve", reserve);
		return "admin/studio/update_reserve_list";
	}
	
	
	//로그아웃
	@ApiOperation(
            value = "어드민 로그아웃"
            , notes = "어드민 로그아웃 화면")
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("adminId");
		
		return "admin/sign_in";
	}
}
