package com.polewearshop.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.polewearshop.common.CommonEncoder;
import com.polewearshop.user.bo.UserBO;
import com.polewearshop.user.model.Member;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/user")
public class UserRestContoller {

	@Autowired
	private CommonEncoder encoder;
	
	@Autowired
	private UserBO userBO;
	
    @ApiOperation(
            value = "중복 아이디 조회"
            , notes = "입력받은 ID를 통해 member 테이블에서 중복이 있는지 조회한다.")
	@PostMapping("/is_duplicated_id")
	public Map<String, Object> isDuplidatedId(
			@RequestParam("loginId") String loginId){
		
		Map<String, Object> result = new HashMap<>();
		
		Member user = userBO.getMember(loginId);
		if (user == null) {
			result.put("result", 0);
		} else {
			result.put("result", 1);
		}
		
		return result;
	}

    
    @ApiOperation(
            value = "회원가입"
            , notes = "입력받은 정보들을 통해 member로 회원가입한다.")
    @PostMapping("/sign_up")
    public Map<String, Object> signUp(
    		@RequestParam("loginId") String loginId,
    		@RequestParam("password") String password,
    		@RequestParam("name") String name,
    		@RequestParam("phoneNumber") String phoneNumber,
    		@RequestParam("email") String email,
    		@RequestParam("sex") String sex,
    		@RequestParam(value="address", required=false) String address,
    		@RequestParam(value="birth", required=false) String birth
    		
    		){
    
    	String encodingPassword = encoder.encode(password);
    	
    	Map<String, Object> result = new HashMap<>();
    	int count = userBO.addMember(loginId, encodingPassword, name, phoneNumber, email, sex, address, birth);
    	if(count > 0 ) {
    		result.put("result", "success");
    	} else {
    		result.put("result", "fail");
    	}
    	
    	return result;
    }
    
    @ApiOperation(
            value = "로그인"
            , notes = "입력받은 id를 통해 가입했던 아이디인지 확인후 가지고 온다.")
    @PostMapping("/sign_in")
    public Map<String, Object> signIn(
    		@RequestParam("loginId") String loginId,
    		@RequestParam("password") String password,
    		HttpServletRequest request
    		) {

    	Member user = userBO.getMember(loginId);
    	Boolean checkPassword = encoder.matches(password, user.getPassword());
    	
    	
    	Map<String, Object> result = new HashMap<>();
    	
    	if (user != null && checkPassword == true) {
    		result.put("result", "success");
    		result.put("successMessage", user.getName() +"님 반갑습니다. 모두다폴웨어에서 즐거운 쇼핑 바랍니다.");
    		HttpSession session = request.getSession();
    		session.setAttribute("memberLoginId", user.getLoginId());
    		session.setAttribute("memberId", user.getId());
    		session.setAttribute("memberName", user.getName());
    		if (session.getAttribute("basketNumber") != null) {
    			int basketNumber = (int)session.getAttribute("basketNumber");
    			result.put("basketNumber", basketNumber);
    		}
    		result.put("memberId", user.getId());
    		
    	} else if (user != null && checkPassword == false) {
    		result.put("result", "errorPassword");
    		result.put("errorPasswordMessage", "비밀번호를 다시 확인해주세요");
    	}
    	
    	return result;
    }
    
}
