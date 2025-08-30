package com.port.app.content.about;

import org.apache.ibatis.annotations.Mapper;

import com.port.app.content.ContentDAO;

@Mapper
public interface AboutDAO extends ContentDAO<AboutVO> {
	
//	int insertProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
//	int updateProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	
}
