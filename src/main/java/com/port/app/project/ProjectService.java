package com.port.app.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {
	@Autowired
	private ProjectDAO projectDAO;
	
	public List<ProjectVO> list() throws Exception {
		return projectDAO.selectList();
	}
	
	public ProjectVO detail(ProjectVO projectVO) throws Exception {
		return projectDAO.selectDetail(projectVO);
	}
	
	public int add(ProjectVO projectVO) throws Exception {
		return projectDAO.insert(projectVO);
	}
	
	public int update(ProjectVO projectVO) throws Exception {
		return projectDAO.update(projectVO);
	}
	
	public int delete(ProjectVO projectVO) throws Exception {
		return projectDAO.delete(projectVO);
	}
}
