package com.polewearshop.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws IOException {
		HttpSession session = request.getSession();
		String adminId = (String)session.getAttribute("adminId");
		
		//로그인이 되어있지 않는 상태에서 admin들어오면 admin으로 내보낸다.
		String uri = request.getRequestURI();
		if (adminId == null && (uri.startsWith("/admin/select") || uri.startsWith("/admin/product") || uri.startsWith("/admin/studio")) ) {
			
			response.sendRedirect("/admin/sign_in_view");
			return false;
		}
		return true;
	}
	
}
