package com.polewearshop.studio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.polewearshop.studio.bo.StudioBO;
import com.polewearshop.studio.bo.StudioImagesBO;
import com.polewearshop.studio.model.Studio;
import com.polewearshop.studio.model.StudioImages;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/studio")
public class StudioController {

	@Autowired
	private StudioImagesBO studioImagesBO;
	
	@Autowired
	private StudioBO studioBO;
	
	//studio main
	@ApiOperation(
            value = "studio 메인 화면"
            , notes = "studio 메인화면으로 지점을 선택할 수 있는 화면")
	@GetMapping("/main_view")
	public String studioMainView(Model model) {
		model.addAttribute("viewName", "studio/main");
		return "template/layout";
	}
	
	//시설안내
	@ApiOperation(
            value = "studio 시설 안내 화면"
            , notes = "studio 시설 안내 화면")
	@GetMapping("/facility_info_view")
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
	@ApiOperation(
            value = "studio 이용 안내 화면"
            , notes = "studio 이용 안내 화면")
	@GetMapping("/use_info_view")
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
	@ApiOperation(
            value = "studio 예약 현황 화면"
            , notes = "studio 예약 현황 화면")
	@GetMapping("/reserve_status_view")
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
	@ApiOperation(
            value = "studio 오시는 길 화면"
            , notes = "studio 오시는 길 화면")
	@GetMapping("/directions_view")
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
