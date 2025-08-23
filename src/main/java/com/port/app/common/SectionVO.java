package com.port.app.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SectionVO {
	private Integer id;
	private Integer projectId;
	private Integer aboutId;
	private String title;
	private String content;
}
