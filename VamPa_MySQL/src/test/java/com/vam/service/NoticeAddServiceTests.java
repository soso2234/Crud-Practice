package com.vam.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.NoticeAddVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeAddServiceTests {

	/* AuthoreService 의존성 주입 */
	@Autowired
	private NoticeAddService service;

	/*
	 * @Test public void noticeAddTest() throws Exception {
	 * 
	 * NoticeAddVO notice = new NoticeAddVO();
	 * 
	 * notice.setTitle("공지 테스트11"); notice.setConts("공지 테스트11");
	 * notice.setReg_id("admin"); notice.setReg_nm("관리자");
	 * 
	 * service.noticeAdd(notice);
	 * 
	 * }
	 */

	/*
	 * 작가 상세 페이지
	 * 
	 * @Test public void noticeAddGetDetailTest() throws Exception {
	 * 
	 * int notice_seq = 1;
	 * 
	 * System.out.println("notice === " + service.noticeAddGetDetail(notice_seq));
	 * 
	 * }
	 */
	
	@Test
	public void noticeModifyTest() throws Exception {
		NoticeAddVO notice = new NoticeAddVO();
		
		notice.setNotice_seq(1);
		System.out.println("(Service) 수정 전 = " + service.noticeAddGetDetail(notice.getNotice_seq()));
		
		notice.setTitle("(Service) 수정");
		notice.setConts("(Service) 내용 수정");
		
		service.noticeModify(notice);
		System.out.println("(Service) 수정 후 = " + service.noticeAddGetDetail(notice.getNotice_seq()));
	}

}
