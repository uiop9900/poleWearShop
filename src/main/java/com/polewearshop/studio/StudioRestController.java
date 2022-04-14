package com.polewearshop.studio;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.studio.bo.StudioReserveBO;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/studio")
public class StudioRestController {

	@Autowired
	private StudioReserveBO studioReserveBO;
	
    @ApiOperation(
            value = "스튜디오 예약"
            , notes = "유저가 홈페이지에서 예약을 남긴다.")
    @GetMapping("/studio_reserve")
	public Map<String, Object> studioReserve(
			@RequestParam("studioId") int studioId,
			@RequestParam("visitorName") String visitorName,
			@RequestParam("visitorPhoneNumber") String visitorPhoneNumber,
			@RequestParam("visitorDate") String visitorDate,
			@RequestParam("visitorTime") String visitorTime) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		
		studioReserveBO.addStudioReserve(studioId, visitorName, visitorPhoneNumber, visitorDate, visitorTime);
		
		result.put("result", "success");
		return result;
	}
    
}
