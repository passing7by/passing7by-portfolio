package com.port.app.content;

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
public class ContentVO implements FormatDate {
	
	private Integer id;
	private Integer adminId;
	private String title;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private Boolean isPublished;
	private Boolean isDeleted;
	
	private Integer rowNumber;
	
	private List<SectionVO> sectionVOs;
	private List<FileVO> fileVOs;
	
	@Override
	public String getFormattedRegDate() {
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	@Override
	public String getFormattedModDate() {
		return this.modDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
}
