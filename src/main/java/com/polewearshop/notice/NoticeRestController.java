package com.polewearshop.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.notice.bo.NoticeBO;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/customer")
public class NoticeRestController {
	
	@Autowired
	private NoticeBO noticeBO;
	
    @ApiOperation(
            value = "notice 만들기"
            , notes = "admin으로 로그인한 경우, notice를 생성할 수 있다.")
	@PostMapping("/notice_create")
	public Map<String, Object> noticeCreate(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session
			
			) {

		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		String loginId = (String)session.getAttribute("memberLoginId");
		
		noticeBO.addNotice(loginId, subject, content, file);
		result.put("result", "success");
		return result;
	}
	
    
    @ApiOperation(
            value = "notice 업데이트"
            , notes = "admin으로 로그인한 경우, notice를 업데이트할 수 있다.")
	@PostMapping("/notice_update")
	public Map<String, Object> noticeUpdate(
			@RequestParam("noticeId") int noticeId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		String loginId = (String)session.getAttribute("memberLoginId");
		
		noticeBO.updateNoticeById(noticeId, loginId, subject, content, file);
		
		result.put("result", "success");
		return result;
	}
	
    @ApiOperation(
            value = "notice 삭제"
            , notes = "admin으로 로그인한 경우, notice를 삭제할 수 있다.")
	@DeleteMapping("/notice_delete")
	public Map<String, Object> noticeDelete(
			@RequestParam("noticeId") int noticeId) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		noticeBO.deleteNoticeById(noticeId);
		result.put("result", "success");
		return result;
	}

}
