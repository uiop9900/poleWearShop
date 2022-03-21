package com.polewearshop.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.admin.bo.AdminBO;
import com.polewearshop.admin.model.Admin;
import com.polewearshop.common.CommonEncoder;

import io.swagger.annotations.ApiOperation;

@RestController	
@RequestMapping("/admin")
public class AdminRestController {

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
			@RequestParam("adminPassword") String password
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
		
		return result;
	}
	
	@ApiOperation(
            value = "새로운 상품 추가하기"
            , notes = "입력받은 상품명, 정보들을 확인 후 새로운 상품에 추가한다.")
	@PostMapping("/product_create")
	public Map<String, Object> productCreate(){
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}

}
