package com.port.app.content;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.port.app.common.FormatDate;

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
	
	@Override
	public String getFormattedRegDate() {
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	@Override
	public String getFormattedModDate() {
		return this.modDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
}
