package com.polewearshop.qna;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.qna.bo.QnaBO;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/customer")
public class QnaRestController {
  
	@Autowired
	private QnaBO qnaBO;
	
	@ApiOperation(
            value = "QnA 작성"
            , notes = "QnA를 작성하면 DB에 insert됩니다.")
	@RequestMapping("/qna_create")
	public Map<String, Object> qnaCreate(
			@RequestParam("category") String category, 
			@RequestParam("subject") String subject, 
			@RequestParam("name") String name, 
			@RequestParam("type") String type, 
			@RequestParam("userNumber") String userNumber, 
			@RequestParam("productName") String productName,
			@RequestParam("content") String content,
			@RequestParam("password") String password
			
			) {
		 Map<String, Object> result = new HashMap<>();
		 result.put("result", "fail");
		 
		 qnaBO.addQna(category, subject, name, type, userNumber, productName, content, password);
		 
		 result.put("result", "success");
		 return result;
	}
}
