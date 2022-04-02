package com.polewearshop.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.util.StringUtils;
import com.polewearshop.product.bo.ProductBO;
import com.polewearshop.product.model.Product;
import com.polewearshop.product.model.ProductView;
import com.polewearshop.studio.bo.StudioReserveBO;
import com.polewearshop.studio.model.StudioReserve;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private StudioReserveBO studioReserveBO;
	
	@Autowired
	private ProductBO productBO;
	
	//admin 로그인
	@RequestMapping("/sign_in_view")
	public String adminSignIn() {
		return "admin/sign_in";
	}
	
	// admin select창 - product, studio
	@RequestMapping("/select_view")
	public String adminSelectView() {
		return "admin/select";
	}
	
	// admin product - list
	@RequestMapping("/product/product_list_view")
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
	@RequestMapping("/product/product_create_view")
	public String admingCreateProduct() {
		return "admin/product/product_create";
	}
	
	// admin product - 상품 update, delete
	@RequestMapping("/product/product_detailed_view")
	public String adminProductDetailedView(
			@RequestParam("productId") int productId,
			Model model
			) {
		
		ProductView productView = productBO.generateProductViewById(productId);
		model.addAttribute("productView", productView);
		return "admin/product/product_detailed";
	}
	
	//admin studio_main화면
	@RequestMapping("/studio/main_view")
	public String adminStudioMainView(Model model,
			@RequestParam(value="visitorDate", required=false) String date,
			@RequestParam(value="btnType", required=false) String btnType
			) {
		
		List<StudioReserve> reserveList = new ArrayList<>();
		if (StringUtils.isNullOrEmpty(date) && (StringUtils.isNullOrEmpty(btnType) || btnType.equals("notFix"))) {
			//미확정예약
			date = null;
			reserveList = studioReserveBO.getNonFixStudioReserveList();
		} else if (StringUtils.isNullOrEmpty(date) && btnType.equals("fix")) {
			//확정예약
			date = null;
			reserveList = studioReserveBO.getFixStudioReserveListByDate(date);
 		} else if (date != null && btnType.equals("fixDate")) {
 			reserveList = studioReserveBO.getFixStudioReserveListByDate(date);
 		}
		
		
		
		model.addAttribute("reserveList", reserveList);
		return "admin/studio/main";
	}
	
	//admin-update-view
	@RequestMapping("/studio/update_reserve_list_view")
	public String adminStudioUpdateReserveListView(Model model,
			@RequestParam("reserveId") int reserveId ) {
		
		StudioReserve reserve = studioReserveBO.getStudioReserveById(reserveId);
		
		model.addAttribute("reserve", reserve);
		return "admin/studio/update_reserve_list";
	}
	
	
	//로그아웃
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("adminId");
		
		return "admin/sign_in";
	}
}
