package com.polewearshop.studio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.studio.bo.StudioBO;
import com.polewearshop.studio.bo.StudioImagesBO;
import com.polewearshop.studio.model.Studio;
import com.polewearshop.studio.model.StudioImages;

import springfox.documentation.annotations.ApiIgnore;

@Controller
@RequestMapping("/studio")
@ApiIgnore 
public class StudioController {

	@Autowired
	private StudioImagesBO studioImagesBO;
	
	@Autowired
	private StudioBO studioBO;
	
	//studio main
	@RequestMapping("/main_view")
	public String studioMainView(Model model) {
		model.addAttribute("viewName", "studio/main");
		return "template/layout";
	}
	
	//시설안내
	@RequestMapping("/facility_info_view")
	public String studioBranchView(
			Model model,
			@RequestParam("studioId") int studioId)
					{
		Studio studio = studioBO.getStudioById(studioId);
		List<StudioImages> studioImages =  studioImagesBO.getStudioImagesByStudioId(studio.getId());
		
		model.addAttribute("studioImages", studioImages);
		model.addAttribute("studio", studio);
		model.addAttribute("viewName", "studio/facility_info");
		return "template/layout";
	}
	
	//이용안내
	@RequestMapping("/use_info_view")
	public String userInfoView(
			Model model,
			@RequestParam("studioId") int studioId)
					{
		
		Studio studio = studioBO.getStudioById(studioId);
		
		model.addAttribute("studio", studio);
		model.addAttribute("viewName", "studio/use_info");
		return "template/layout";
	}
	
	//예약현황
	@RequestMapping("/reserve_status_view")
	public String reserveStatusView(
			Model model,
			@RequestParam("studioId") int studioId)
					{
		
		Studio studio = studioBO.getStudioById(studioId);
		
		model.addAttribute("studio", studio);
		model.addAttribute("viewName", "studio/reserve_status");
		return "template/layout";
	}
	
	//오시는길
	@RequestMapping("/directions_view")
	public String directionView(
			Model model,
			@RequestParam("studioId") int studioId)
					{
		
		//지점별 페이지가 다르다 - map API때문
		if (studioId == 1) {
			Studio studio = studioBO.getStudioById(studioId);
			model.addAttribute("studio", studio);
			model.addAttribute("viewName", "studio/directions_1");
		} else if (studioId == 2) {
			Studio studio = studioBO.getStudioById(studioId);
			model.addAttribute("studio", studio);
			model.addAttribute("viewName", "studio/directions_2");
		} else if (studioId == 3) {
			Studio studio = studioBO.getStudioById(studioId);
			model.addAttribute("studio", studio);
			model.addAttribute("viewName", "studio/directions_3");
		}
		
		return "template/layout";
	}
}
