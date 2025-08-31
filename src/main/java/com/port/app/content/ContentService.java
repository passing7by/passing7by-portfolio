package com.port.app.content;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;
import com.port.app.content.project.ProjectVO;

public interface ContentService<T extends ContentVO> {
	
	List<T> listForAdmin(T contentVO) throws Exception;
	T detail(T contentVO) throws Exception;
	
	int add(T contentVO, MultipartFile[] attaches) throws Exception;
	
	int update(T contentVO, MultipartFile[] attaches) throws Exception;
	
	int delete(T contentVO) throws Exception;
	int deleteFile(FileVO fileVO) throws Exception;
	
}
