package com.port.app.content;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;

@Mapper
public interface ContentDAO<T extends ContentVO> {
	
	List<T> selectListForAdmin(T contentVO) throws Exception;
	T selectDetailForAdmin(T contentVO) throws Exception;
	
	int insertContent(T contentVO) throws Exception;
	int insertSection(SectionVO sectionVO) throws Exception;
	int insertFile(FileVO fileVO) throws Exception;
	
	int updateContent(T contentVO) throws Exception;
	int updateSection(SectionVO sectionVO) throws Exception;
	int updateFile(FileVO fileVO) throws Exception;
	
	int delete(T contentVO) throws Exception;
	int deleteSection(SectionVO sectionVO) throws Exception;
	
	// ------------ File
	
	FileVO selectFile(FileVO fileVO) throws Exception;
	int deleteFile(FileVO fileVO) throws Exception;
	
}
