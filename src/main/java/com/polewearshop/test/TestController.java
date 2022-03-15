package com.polewearshop.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@Autowired
	private UserBO userBO;
	
	@ResponseBody
	@RequestMapping("/test/test")
	public String test() {
		return "test입니다";
	}
	
	@RequestMapping("/test/data")
	public User testDate() {
	User user = userBO.getUser();
		return user;
	}
	
	@RequestMapping("/test/jsp")
	public String testJsp() {
		
		return "test/test";
	}
}
