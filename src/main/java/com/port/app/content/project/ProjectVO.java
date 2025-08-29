package com.port.app.content.project;

import java.time.LocalDate;
import java.util.List;

import com.port.app.common.FileVO;
import com.port.app.common.SectionVO;
import com.port.app.content.ContentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectVO extends ContentVO {
	
	private String title;
	private String summary;
	private Integer teamSize;
	private String keyFeatures;
	private String techStack;
	private LocalDate startDate;
	private LocalDate endDate;
	private String githubUrl;
	private String demoUrl;
	private String pptUrl;
	
	private Integer rowNumber;

	private List<ProjectNoteVO> projectNoteVOs;
	private List<SectionVO> sectionVOs;
	private List<FileVO> fileVOs;
	
}
