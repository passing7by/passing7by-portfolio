package com.port.app.content.about;

import com.port.app.content.ContentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AboutVO extends ContentVO {
	
	private String name;
	private String githubUrl;
	private String blogUrl;
	private String emailUrl;
	
}
