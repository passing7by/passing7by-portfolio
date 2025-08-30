package com.port.app.content.about;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.port.app.common.FileVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;


@Slf4j
@Controller
@RequestMapping("/${url.admin}/about/*")
public class AboutAdminController {
	
	@Autowired
	private AboutService aboutService;
	
	@Value("${cat.about}")
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
	public String list(AboutVO aboutVO, Model model) throws Exception {
		List<AboutVO> list = aboutService.listForAdmin(aboutVO);
		
		model.addAttribute("list", list);
		
		return "admin/about/list";
	}
	
//	@GetMapping("detail") // TODO session의 adminId 사용
//	public String detail(ProjectVO projectVO, Model model) throws Exception {
//		ProjectVO result = projectService.detail(projectVO); // id로 조회
//		System.err.println(result);
//		
//		String url = "redirect:./list?isDeleted=0"; // 조회된 데이터가 없으면 list 페이지로 redirect
//		if(result != null) {
//			result.setAdminId(null); // 데이터를 내보내기 전 adminId값 null로 설정
//			model.addAttribute("vo", result);
//			url = "admin/project/detail";
//		}
//		
//		return url;
//	}
//	
//	@GetMapping("add")
//	public String add(Model model, HttpServletRequest req) throws Exception {
//		String uri = req.getRequestURI().toString();
//		System.err.println(uri);
//		
//		model.addAttribute("uri", uri);
//		
//		return "admin/project/add";
//	}
//	
//	@PostMapping("add") // TODO session의 adminId 사용
//	public String add(ProjectVO projectVO, MultipartFile[] attaches) throws Exception {
//		log.warn("{}", projectVO);
//		log.warn("{}", attaches);
//		
//		int result = projectService.add(projectVO, attaches);
//		
//		return "redirect:./list?isDeleted=0"; // TODO 추후 방금 등록한 글의 detail로 경로 변경하기
//	}
//	
//	@GetMapping("update") // TODO session의 adminId 사용
//	public String update(ProjectVO projectVO, Model model, HttpServletRequest req) throws Exception {
//		System.err.println(projectVO);
//		
//		// 요청 uri에 따라 form의 action 경로가 update인지 add인지 나눔
//		String uri = req.getRequestURI().toString();
//		model.addAttribute("uri", uri);
//		
//		// 요청시 받아온 id로 detail 조회
//		projectVO = projectService.detail(projectVO);
//		model.addAttribute("vo", projectVO);
//		
//		return "admin/project/add";
//	}
//	
//	@PostMapping("update") // TODO session의 adminId 사용
//	public String update(ProjectVO projectVO, MultipartFile[] attaches) throws Exception {
//		log.warn("{}", projectVO);
//		log.warn("{}", attaches);
//		
//		int result = projectService.update(projectVO, attaches);
//		
//		return "redirect:./list?isDeleted=0"; // TODO 추후 방금 수정한 글의 detail로 경로 변경하기
//	}
//	
//	@PostMapping("delete") // TODO session의 adminId 사용
//	public String delete(ProjectVO projectVO) throws Exception {
//		int result = projectService.delete(projectVO);
//		
//		return "redirect:./list";
//	}
//	
//	
//	// -------------------- File
//	@ResponseBody
//	@PostMapping("deleteFile")
//	public Integer deleteFile(FileVO fileVO) throws Exception {
//		log.warn("{}", fileVO);
//		
//		int result = projectService.deleteFile(fileVO);
//		
//		return result;
//	}
	
	
}
