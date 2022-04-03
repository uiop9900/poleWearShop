package com.polewearshop.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.notice.bo.NoticeBO;

@RestController
@RequestMapping("/customer")
public class NoticeRestController {
	
	@Autowired
	private NoticeBO noticeBO;
	
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

}
