package com.port.app.content.about;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.port.app.common.FileManager;
import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;
import com.port.app.content.ContentService;
import com.port.app.content.project.ProjectNoteVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class AboutService implements ContentService<AboutVO> {
	
	@Value("${app.upload}")
	private String upload;
	
	@Value("${cat.about}")
	private String about;
	
	@Autowired
	private AboutDAO aboutDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<AboutVO> listForAdmin(AboutVO aboutVO) throws Exception {
		return aboutDAO.selectListForAdmin(aboutVO);
	}

	@Override
	public AboutVO detail(AboutVO aboutVO) throws Exception {
		return aboutDAO.selectDetailForAdmin(aboutVO);
	}

	@Override
	public int add(AboutVO aboutVO, MultipartFile[] attaches) throws Exception {
		int result = aboutDAO.insertContent(aboutVO);
		
		// about 테이블에 데이터가 들어가지 않았다면 
		// skill, section, image 테이블에도 데이터가 들어갈 필요가 없기 때문에 바로 리턴
		if(result == 0) return result;
		
		List<SkillVO> skList = aboutVO.getSkillVOs();
		if (skList != null && result > 0) {
			for (SkillVO sk : skList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 insert하지 않음
				if(sk.getName() == null) continue;
				
				sk.setAboutId(aboutVO.getId());
				result = aboutDAO.insertSkill(sk);
			}
		}
		
		List<SectionVO> sList = aboutVO.getSectionVOs();
		if (sList != null && result > 0) {
			for (SectionVO s : sList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 insert하지 않음
				if (s.getTitle() == null) continue;
				
				s.setAboutId(aboutVO.getId());
				result = aboutDAO.insertSection(s);
			}
		}
		
		if (attaches != null && attaches.length > 0) {
			for (MultipartFile a : attaches) {
				log.warn("{}", a.getSize());
				// a에 실질적으로 파일이 들어있지 않다면 파일 저장 로직을 진행하지 않음
				if (a.getSize() <= 0) continue;
				
				// 1. file을 HDD에 저장하고 saveName을 받아옴
				FileVO fileVO = fileManager.saveFile(upload + about, a);
				fileVO.setAboutId(aboutVO.getId());
				
				// 2. DB에 데이터 저장
				result = aboutDAO.insertFile(fileVO);
			}
		}
		
		return result;
	}

	@Override
	public int update(AboutVO aboutVO, MultipartFile[] attaches) throws Exception {
		int result = aboutDAO.updateContent(aboutVO);
		
		// about 테이블에 데이터가 업데이트되지 않았다면 
		// 관련된 다른 테이블에도 데이터가 업데이트되지 않도록 하기 위해 바로 리턴
		if(result == 0) return result;

		// 존재하는 데이터에 있던 게 들어온 데이터에는 없다면 delete
		AboutVO existingAbout = aboutDAO.selectDetailForAdmin(aboutVO);

		for (SkillVO sk1 : existingAbout.getSkillVOs()) {
			boolean isDeleted = true;
			
			for (SkillVO sk2 : aboutVO.getSkillVOs()) {
				if (sk1.getId() == sk2.getId()) isDeleted = false;
			}
			
			if (isDeleted) result = aboutDAO.deleteSkill(sk1);
		}
		
		for (SectionVO s1 : existingAbout.getSectionVOs()) {
			boolean isDeleted = true;
			
			for (SectionVO s2 : aboutVO.getSectionVOs()) {
				if (s1.getId() == s2.getId()) isDeleted = false;
			}
			
			if (isDeleted) result = aboutDAO.deleteSection(s1);
		}
		
		// 관련된 다른 테이블의 데이터 update
		
		List<SkillVO> skList = aboutVO.getSkillVOs();
		if (skList != null && result > 0) {
			for (SkillVO sk : skList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 update하지 않음
				if(sk.getName() == null) continue;
				
				sk.setAboutId(aboutVO.getId());
				
				// id가 있으면(기존에 있던 데이터면) update / 없으면 insert
				if(sk.getId() != null) result = aboutDAO.updateSkill(sk);
				else result = aboutDAO.insertSkill(sk);
			}
		}
		
		List<SectionVO> sList = aboutVO.getSectionVOs();
		if (sList != null && result > 0) {
			for (SectionVO s : sList) {
				// 폼에 not null 값을 입력하지 않았다면 sqlException이 발생하므로 db에 update하지 않음
				if (s.getTitle() == null) continue;
				
				s.setAboutId(aboutVO.getId());

				// id가 있으면(기존에 있던 데이터면) update / 없으면 insert
				if(s.getId() != null) result = aboutDAO.updateSection(s);
				else result = aboutDAO.insertSection(s);
			}
		}
		
		if (attaches != null && attaches.length > 0) {
			for (MultipartFile a : attaches) {
				// 1. file을 HDD에 저장하고 saveName을 받아옴
				FileVO fileVO = fileManager.saveFile(upload + about, a);
				fileVO.setAboutId(aboutVO.getId());
				
				// 2. DB에 데이터 저장
				result = aboutDAO.insertFile(fileVO);
			}
		}
		
		return result;
	}

	@Override
	public int delete(AboutVO aboutVO) throws Exception {
		return aboutDAO.delete(aboutVO);
	}

	@Override
	public int deleteFile(FileVO fileVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/*
	@Override
	public List<ProjectVO> listForAdmin(ProjectVO projectVO) throws Exception {
		return projectDAO.selectListForAdmin(projectVO);
	}
	
	@Override
	public ProjectVO detail(ProjectVO projectVO) throws Exception {
		return projectDAO.selectDetailForAdmin(projectVO);
	}
	
	@Override
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
	
	@Override
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
	
	@Override
	public int delete(ProjectVO projectVO) throws Exception {
		return projectDAO.delete(projectVO);
	}
	
	@Override
	public int deleteFile(FileVO fileVO) throws Exception {
		// 1. 파일 정보 조회
		fileVO = projectDAO.selectFile(fileVO);
		
		// 1. HHD에서 삭제
		fileManager.deleteFile(upload  + project, fileVO);
		
		// 2. DB에서 삭제
		int result = projectDAO.deleteFile(fileVO);
		
		return result;
	}
	*/
}
