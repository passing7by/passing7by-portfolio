package com.port.app.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.port.app.common.FileManager;
import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProjectService {
	
	@Value("${app.upload}")
	private String upload;
	
	@Value("${cat.project}")
	private String project;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<ProjectVO> listForAdmin(ProjectVO projectVO) throws Exception {
		return projectDAO.selectListForAdmin(projectVO);
	}
	
	public ProjectVO detail(ProjectVO projectVO) throws Exception {
		return projectDAO.selectDetailForAdmin(projectVO);
	}
	
	public int add(ProjectVO projectVO, MultipartFile[] attaches) throws Exception {
		int result = projectDAO.insertProject(projectVO);
		
		// project 테이블에 데이터가 들어가지 않았다면 
		// project_no, section 테이블에도 데이터가 들어갈 필요가 없기 때문에 바로 리턴
		if(result == 0) return result;
		
		List<ProjectNoteVO> pnList = projectVO.getProjectNoteVOs();
		if (pnList != null && result > 0) {
			for (ProjectNoteVO pn : pnList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 insert하지 않음
				if(pn.getTitle() == null) continue;
				
				pn.setProjectId(projectVO.getId());
				result = projectDAO.insertProjectNote(pn);
			}
		}
		
		List<SectionVO> sList = projectVO.getSectionVOs();
		if (sList != null && result > 0) {
			for (SectionVO s : sList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 insert하지 않음
				if (s.getTitle() == null) continue;
				
				s.setProjectId(projectVO.getId());
				result = projectDAO.insertSection(s);
			}
		}
		
		if (attaches != null && attaches.length > 0) {
			for (MultipartFile a : attaches) {
				// 1. file을 HDD에 저장하고 saveName을 받아옴
				FileVO fileVO = fileManager.saveFile(upload + project, a);
				fileVO.setProjectId(projectVO.getId());
				
				// 2. DB에 데이터 저장
				result = projectDAO.insertFile(fileVO);
			}
		}
		
		return result;
	}
	
	public int update(ProjectVO projectVO, MultipartFile[] attaches) throws Exception {
		int result = projectDAO.updateProject(projectVO);
		
		// project 테이블에 데이터가 업데이트되지 않았다면 
		// project_no, section 테이블에도 데이터가 업데이트되지 않도록 하기 위해 바로 리턴
		if(result == 0) return result;
		
		List<ProjectNoteVO> pnList = projectVO.getProjectNoteVOs();
		if (pnList != null && result > 0) {
			for (ProjectNoteVO pn : pnList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 update하지 않음
				if(pn.getTitle() == null) continue;
				
				pn.setProjectId(projectVO.getId());
				
				// id가 있으면(기존에 있던 데이터면) update / 없으면 insert
				if(pn.getId() != null) result = projectDAO.updateProjectNote(pn);
				else result = projectDAO.insertProjectNote(pn);
			}
		}
		
		List<SectionVO> sList = projectVO.getSectionVOs();
		if (sList != null && result > 0) {
			for (SectionVO s : sList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 update하지 않음
				if (s.getTitle() == null) continue;
				
				s.setProjectId(projectVO.getId());

				// id가 있으면(기존에 있던 데이터면) update / 없으면 insert
				if(s.getId() != null) result = projectDAO.updateSection(s);
				else result = projectDAO.insertSection(s);
			}
		}
		
		if (attaches != null && attaches.length > 0) {
			for (MultipartFile a : attaches) {
				// 1. file을 HDD에 저장하고 saveName을 받아옴
				FileVO fileVO = fileManager.saveFile(upload + project, a);
				fileVO.setProjectId(projectVO.getId());
				
				// 2. DB에 데이터 저장
				result = projectDAO.insertFile(fileVO);
			}
		}
		
		return result;
	}
	
	public int delete(ProjectVO projectVO) throws Exception {
		return projectDAO.delete(projectVO);
	}
	
	public int deleteFile(FileVO fileVO) throws Exception {
		// 1. 파일 정보 조회
		fileVO = projectDAO.selectFile(fileVO);
		
		// 1. HHD에서 삭제
		fileManager.deleteFile(upload  + project, fileVO);
		
		// 2. DB에서 삭제
		int result = projectDAO.deleteFile(fileVO);
		
		return result;
	}
}
