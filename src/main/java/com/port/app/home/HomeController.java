package com.port.app.home;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class HomeController {
	@Value("${url.admin}")
	private String adminUrl;
	
	@ModelAttribute("adminUrl")
	public String getAdminUrl() {
		return adminUrl;
	}
	
	@GetMapping("/${url.admin}")
	public String home() {
		return "admin/index";
	}
	
}
