package com.port.app.content.project;

import org.apache.ibatis.annotations.Mapper;

import com.port.app.content.ContentDAO;

@Mapper
public interface ProjectDAO extends ContentDAO<ProjectVO> {
	
	int insertProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	int updateProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	int deleteProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	
}
