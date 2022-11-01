package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeAddMapperTests {

	@Autowired
	private NoticeAddMapper mapper;

	/*
	 * 공지 등록 테스트
	 * 
	 * @Test public void noticeAdd() throws Exception{
	 * 
	 * NoticeAddVO notice = new NoticeAddVO();
	 * 
	 * notice.setTitle("공지 테스트"); notice.setConts("공지 테스트");
	 * notice.setReg_id("admin"); notice.setReg_nm("관리자");
	 * 
	 * mapper.noticeAdd(notice);
	 * 
	 * }
	 */

	/*
	 * 작가 목록 테스트
	 * 
	 * @Test public void noticeAddGetListTest() throws Exception {
	 * 
	 * //Criteria cri = new Criteria(3, 10); // 3페이지 & 10개 행 표시 Criteria cri = new
	 * Criteria(1, 10); // 1페이지 & 5개 행 표시
	 * 
	 * List<NoticeAddVO> list = mapper.noticeAddGetList(cri);
	 * 
	 * for (int i = 0; i < list.size(); i++) { System.out.println("list" + i +
	 * ".........." + list.get(i)); }
	 * 
	 * }
	 */

	/*
	 * @Test public void noticeAddGetTotalTest() throws Exception {
	 * 
	 * //Criteria cri = new Criteria(3, 10); // 3페이지 & 10개 행 표시 Criteria cri = new
	 * Criteria(); // 1페이지 & 5개 행 표시
	 * 
	 * int total = mapper.noticeAddGetTotal(cri);
	 * 
	 * System.out.println("total = " + total);
	 * 
	 * }
	 */

	/*
	 * 작가 상세 페이지
	 * 
	 * @Test public void noticeAddGetDetailTest() {
	 * 
	 * int notice_seq = 1;
	 * 
	 * NoticeAddVO notice = mapper.noticeAddGetDetail(notice_seq);
	 * 
	 * System.out.println("notice = " + notice);
	 * 
	 * }
	 */
	
	/* 작가 정보 수정 */
	@Test
	public void noticeModifyTest() {
		
		NoticeAddVO notice = new NoticeAddVO();
				
		notice.setNotice_seq(1);
		System.out.println("수정 전...................." + mapper.noticeAddGetDetail(notice.getNotice_seq()));
		
		notice.setTitle("수정");
		notice.setConts("01");
		
		mapper.noticeModify(notice);
		System.out.println("수정 후...................." + mapper.noticeAddGetDetail(notice.getNotice_seq()));
		
	}

}
