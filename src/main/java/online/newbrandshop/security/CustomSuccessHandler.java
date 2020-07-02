/*
	@author:Quang Truong
	@date: Jan 15, 2020
*/

package online.newbrandshop.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import online.newbrandshop.util.SecurityUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	private String determineTargetUrl(Authentication authentication) {
		String url = "";

		List<String> roles = SecurityUtils.getAuthorities();
		if (isCustomer(roles)) {
			url = "/home";
		}
		else if(isAdmin(roles))
		{
//			url="/admin/home";
			url = "/home";
		}
		else {
			url="/login";
		}
		return url;
	}
	private boolean isAdmin(List<String> roles) {
		if (roles.contains("admin")) {
			return true;
		}
		return false;
	}

	private boolean isCustomer(List<String> roles) {
		if (roles.contains("customer")) {
			return true;
		}
		return false;
	}
	
}
