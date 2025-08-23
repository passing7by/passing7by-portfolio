package com.port.app.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	@Autowired
	//
	
	@Value("${cat.project}")
	private String cat;
	
	@ModelAttribute("cat")
	public String getCat() {
		return cat;
	}
	
	@GetMapping("list")
	public String list() throws Exception {
		//
		
		return "project/list";
	}
	
}
