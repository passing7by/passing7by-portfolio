package com.port.app.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;



@Controller
@RequestMapping("/${url.admin}/project/*")
public class ProjectAdminController {
	@Autowired
	private ProjectService projectService;
	
	@Value("${cat.project}")
	private String cat;
	
	@Value("${url.admin}")
	private String adminUrl;
	
	@ModelAttribute("cat")
	public String getCat() {
		return cat;
	}
	
	@ModelAttribute("adminUrl")
	public String getAdminUrl() {
		return adminUrl;
	}
	
	@GetMapping("list")
	public String list(Model model) throws Exception {
		model.addAttribute("list", projectService.list());
		
		return "admin/project/list";
	}
	
	@GetMapping("detail")
	public String detail(ProjectVO projectVO, Model model) throws Exception {
		model.addAttribute("vo", projectService.detail(projectVO));
		
		return "admin/project/detail";
	}
	
	@GetMapping("add")
	public String add(Model model, HttpServletRequest req) throws Exception {
		String uri = req.getRequestURI().toString();
		model.addAttribute("uri", uri);
		
		return "admin/project/add";
	}
	
	@PostMapping("add")
	public String add(ProjectVO projectVO) throws Exception {
		int result = projectService.add(projectVO);
		
		return "redirect:./list"; // TODO 추후 방금 등록한 글의 detail로 경로 변경하기
	}
	
	@GetMapping("update")
	public String update(Model model, HttpServletRequest req) throws Exception {
		String uri = req.getRequestURI().toString();
		model.addAttribute("uri", uri);
		
		return "admin/project/add";
	}
	
	@PostMapping("update")
	public String update(ProjectVO projectVO) throws Exception {
		int result = projectService.update(projectVO);
		
		return "redirect:./list"; // TODO 추후 방금 수정한 글의 detail로 경로 변경하기
	}
	
	@PostMapping("delete")
	public String delete(ProjectVO projectVO) throws Exception {
		int result = projectService.delete(projectVO);
		
		return "redirect:./list";
	}
	
	
	
}
