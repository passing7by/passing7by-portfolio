package com.port.app.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

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
	
	@GetMapping("list") // TODO 매개변수로 ProjectVO 제거 & sesssion의 id, username, pass를 확인하는 interceptor를 만든 다음 session의 id를 ProjectVO에 넣어서 service에 전달
	public String list(ProjectVO projectVO, Model model) throws Exception {
		List<ProjectVO> list = projectService.listForAdmin(projectVO);
		
		model.addAttribute("list", list);
		
		return "admin/project/list";
	}
	
	@GetMapping("detail") // TODO session의 adminId 사용
	public String detail(ProjectVO projectVO, Model model) throws Exception {
		ProjectVO result = projectService.detail(projectVO);
		result.setAdminId(null);
		
		model.addAttribute("vo", result);
		
		return "admin/project/detail";
	}
	
	@GetMapping("add")
	public String add(Model model, HttpServletRequest req) throws Exception {
		String uri = req.getRequestURI().toString();
		model.addAttribute("uri", uri);
		
		return "admin/project/add";
	}
	
	@PostMapping("add") // TODO session의 adminId 사용
	public String add(ProjectVO projectVO) throws Exception {
		System.err.println(projectVO);
		
		int result = projectService.add(projectVO);
		
		return "redirect:./list?isDeleted=0"; // TODO 추후 방금 등록한 글의 detail로 경로 변경하기
	}
	
	@GetMapping("update") // TODO session의 adminId 사용
	public String update(ProjectVO projectVO, Model model, HttpServletRequest req) throws Exception {
		String uri = req.getRequestURI().toString();
		model.addAttribute("uri", uri);
		
		return "admin/project/add";
	}
	
	@PostMapping("update") // TODO session의 adminId 사용
	public String update(ProjectVO projectVO) throws Exception {
		int result = projectService.update(projectVO);
		
		return "redirect:./list"; // TODO 추후 방금 수정한 글의 detail로 경로 변경하기
	}
	
	@PostMapping("delete") // TODO session의 adminId 사용
	public String delete(ProjectVO projectVO) throws Exception {
		int result = projectService.delete(projectVO);
		
		return "redirect:./list";
	}
	
}
