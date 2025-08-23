package com.port.app.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectDAO {
	List<ProjectVO> selectList() throws Exception;
	ProjectVO selectDetail(ProjectVO projectVO) throws Exception;
	int insert(ProjectVO projectVO) throws Exception;
	int update(ProjectVO projectVO) throws Exception;
	int delete(ProjectVO projectVO) throws Exception;
}
