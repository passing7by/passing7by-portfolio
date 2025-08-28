package com.port.app.project;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.port.app.common.SectionVO;

@SpringBootTest
class ProjectDAOTest {
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Test
	void test() {
		fail("Not yet implemented");
	}

	@Test
	void sectionUpdatetest() throws Exception {
		SectionVO s = new SectionVO();
		s.setAboutId(null);
		s.setContent("test content");
		s.setId(14);
		s.setProjectId(21);
		s.setTitle("test title");
		
		int result = projectDAO.updateSection(s);
		System.out.println(result);
		
		assertEquals(1, result);
	}
}
