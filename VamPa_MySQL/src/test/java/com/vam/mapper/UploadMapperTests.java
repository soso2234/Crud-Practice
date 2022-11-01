package com.vam.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UploadMapperTests {

	@Autowired
	private UploadMapper uploadMapper;
	
	//첨부파일 정보 반환
	@Test
	public void getUploadListTests() {
		
		int freeboard_seq = 35;
		
		System.out.println("첨부파일 정보" + uploadMapper.getUploadList(freeboard_seq));
		
	}
}
