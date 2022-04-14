package com.polewearshop.qna;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("/qna_create")
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
	
	@ApiOperation(
            value = "QnA 삭제"
            , notes = "글을 쓴 당사자만 삭제할 수 있다.")
	@DeleteMapping("/qna_delete")
	public Map<String, Object> deleteQna(
			@RequestParam("qnaId") int qnaId
			) {
		
		 Map<String, Object> result = new HashMap<>();
		 result.put("result", "fail");
		 
		 qnaBO.deleteQnaById(qnaId);
		 result.put("result", "success");
		 return result;
	}
	
	@ApiOperation(
            value = "QnA의 비밀번호를 맞춰야지만 qna를 확인할 수 있다."
            , notes = "글을 쓴 당사자만 삭제할 수 있다.")
	@PostMapping("/qna_check_password")
	public Map<String, Object> checkQnaPassword(
			@RequestParam("qnaId") int qnaId,
			@RequestParam("password") String password
			){
		
		Map<String, Object> result = new HashMap<>();
		
		boolean passwordResult = qnaBO.checkQnaPassword(qnaId, password);
		if (passwordResult == true) {
			result.put("result", "success");
			result.put("qnaId", qnaId);
		} else if (passwordResult == false) {
			result.put("result", "fail");
		}
		 
		
		 return result;
	}
}
