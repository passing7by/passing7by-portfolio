package com.port.app.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProjectService {
	@Autowired
	private ProjectDAO projectDAO;
	
	public List<ProjectVO> listForAdmin(ProjectVO projectVO) throws Exception {
		return projectDAO.selectListForAdmin(projectVO);
	}
	
	public ProjectVO detail(ProjectVO projectVO) throws Exception {
		return projectDAO.selectDetailForAdmin(projectVO);
	}
	
	public int add(ProjectVO projectVO) throws Exception {
		int result = projectDAO.insertProject(projectVO);
		
		List<ProjectNoteVO> pnList = projectVO.getProjectNoteVOs();
		if (!pnList.isEmpty() && result > 0) {
			for (ProjectNoteVO pn : pnList) {
				result = projectDAO.insertProjectNote(pn);
			}
		}
		
		List<SectionVO> sList = projectVO.getSectionVOs();
		if (!sList.isEmpty() && result > 0) {
			for (SectionVO s : sList) {
				result = projectDAO.insertSection(s);
			}
		}
		
		// TODO 파일 정보는 멀티파트에서 가져와야 함
		
		return result;
	}
	
	public int update(ProjectVO projectVO) throws Exception {
		int result = projectDAO.updateProject(projectVO);
		
		List<ProjectNoteVO> pnList = projectVO.getProjectNoteVOs();
		if (!pnList.isEmpty() && result > 0) {
			for (ProjectNoteVO pn : pnList) {
				result = projectDAO.updateProjectNote(pn);
			}
		}
		
		List<SectionVO> sList = projectVO.getSectionVOs();
		if (!sList.isEmpty() && result > 0) {
			for (SectionVO s : sList) {
				result = projectDAO.updateSection(s);
			}
		}
		
		List<FileVO> fList = projectVO.getFileVOs();
		if (!fList.isEmpty() && result > 0) {
			for (FileVO f : fList) {
				result = projectDAO.updateFile(f);
			}
		}
		
		return result;
	}
	
	public int delete(ProjectVO projectVO) throws Exception {
		return projectDAO.delete(projectVO);
	}
}
