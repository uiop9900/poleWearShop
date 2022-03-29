package com.polewearshop.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.basket.model.Basket;
import com.polewearshop.user.bo.NonMemberBO;
import com.polewearshop.user.model.NonMember;

@RestController
@RequestMapping("/nonMember")
public class NonMemberRestController {

	@Autowired
	private NonMemberBO nonMemberBO;
	
	@PostMapping("/check_orderNumber")
	public Map<String, Object> checkOrderNumber(
			@RequestParam("name") String name,
			@RequestParam("orderNumber") String orderNumber
			) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		NonMember nonMember = nonMemberBO.getNonMemberByNameOrderNumber(name, orderNumber);
		
		if (nonMember != null) {
			result.put("result", "success");
			result.put("orderNumber", orderNumber);
		}
		return result;
	}
}
