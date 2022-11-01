package com.vam.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.FreeboardVO;
import com.vam.model.UploadVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FreeboardServiceTests {

	/* AuthoreService 의존성 주입 */
	@Autowired
	private FreeboardService service;
	
	/*
	 * @Test public void noticeModifyTest() throws Exception { FreeboardVO freeboard
	 * = new FreeboardVO();
	 * 
	 * freeboard.setFreeboard_seq(14); System.out.println("(Service) 수정 전 = " +
	 * service.freeboardGetDetail(freeboard.getFreeboard_seq()));
	 * 
	 * freeboard.setTitle("(ServiceTests) 제목 수정");
	 * freeboard.setConts("(ServiceTests) 내용 수정");
	 * 
	 * service.freeboardModify(freeboard); System.out.println("(Service) 수정 후 = " +
	 * service.freeboardGetDetail(freeboard.getFreeboard_seq())); }
	 */
	
	@Test
	public void uploadEnrollTests() {
		FreeboardVO freeboard = new FreeboardVO();
		
		//자유게시판 정보
		freeboard.setTitle("테스트테스트");
		freeboard.setConts("test ing~");
		freeboard.setReg_id("admin");
		freeboard.setReg_nm("관리자");
		
		//파일 정보
		List<UploadVO> uploadList = new ArrayList<UploadVO>();
		
		UploadVO upload1 = new UploadVO();
		
		upload1.setFileName("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		upload1.setUuid("test222222222");
		
		uploadList.add(upload1);
		
		freeboard.setUploadList(uploadList);
		
		//등록 메소드 호출
		service.freeboardAdd(freeboard);
		
		System.out.println("등록된 VO = " + freeboard);
	}
}
