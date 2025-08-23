package com.port.app.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {
	private Integer id;
	private Integer projectId;
	private Integer aboutId;
	private String oriName;
	private String savedName;
	private String extension;
}
