package com.polewearshop.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.notice.bo.NoticeBO;
import com.polewearshop.notice.model.Notice;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/customer")
public class NoticeController {

	@Autowired
	private NoticeBO noticeBO;
	
	@ApiOperation(
            value = "notice 목록 화면"
            , notes = "notice 목록 화면")
	@GetMapping("/notice_list_view")
	public String noticeListView(Model model) {
		
		List<Notice> noticeList =  noticeBO.getNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("viewName", "customer/notice_list");
		return "template/layout";
	}
	
	@ApiOperation(
            value = "notice 생성 화면"
            , notes = "notice 생성 화면")
	@GetMapping("/notice_create_view")
	public String noticeCreateView(Model model) {
		
		model.addAttribute("viewName", "customer/notice_create");
		return "template/layout";
	}
	
	@ApiOperation(
            value = "notice 세부 화면"
            , notes = "notice 리스트에서 클릭 후 상세 notice 화면")
	@GetMapping("/notice_detailed_view")
	public String noticeDetailedView(
			@RequestParam("noticeId") int noticeId,
			Model model) {
		
		Notice notice = noticeBO.getNoticeById(noticeId);
		
		model.addAttribute("notice", notice);
		model.addAttribute("viewName", "customer/notice_detailed");
		return "template/layout";
	}
	
}
