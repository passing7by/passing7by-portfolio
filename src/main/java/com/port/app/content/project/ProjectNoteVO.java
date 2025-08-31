package com.port.app.content.project;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectNoteVO {
	private Integer id;
	private Integer projectId;
	private String title;
	private String url;
}
