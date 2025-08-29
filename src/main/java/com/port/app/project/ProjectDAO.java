package com.port.app.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;

@Mapper
public interface ProjectDAO {
	List<ProjectVO> selectListForAdmin(ProjectVO projectVO) throws Exception;
	ProjectVO selectDetailForAdmin(ProjectVO projectVO) throws Exception;
	
	int insertProject(ProjectVO projectVO) throws Exception;
	int insertProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	int insertSection(SectionVO sectionVO) throws Exception;
	int insertFile(FileVO fileVO) throws Exception;
	
	int updateProject(ProjectVO projectVO) throws Exception;
	int updateProjectNote(ProjectNoteVO projectNoteVO) throws Exception;
	int updateSection(SectionVO sectionVO) throws Exception;
	int updateFile(FileVO fileVO) throws Exception;
	
	int delete(ProjectVO projectVO) throws Exception;
	
	
	// ------------ File
	
	FileVO selectFile(FileVO fileVO) throws Exception;
	int deleteFile(FileVO fileVO) throws Exception;
	
	
}
