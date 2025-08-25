package com.port.app.project;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.port.app.common.FileVO;
import com.port.app.common.FormatDate;
import com.port.app.common.SectionVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectVO implements FormatDate {
	private Integer id;
	private Integer adminId;
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
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private Boolean isPublished;
	private Boolean isDeleted;
	
	private Integer rowNumber;

	private List<ProjectNoteVO> projectNoteVOs;
	private List<SectionVO> sectionVOs;
	private List<FileVO> fileVOs;
	
	@Override
	public String getFormatedRegDate() {
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	@Override
	public String getFormatedModDate() {
		
		return this.modDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
}
