package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.Criteria;
import com.vam.model.FreeboardVO;
import com.vam.model.UploadVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired
	private FreeboardMapper mapper;

	@Test 
	public void freeboardAddTest() throws Exception{ FreeboardVO freeboard = new FreeboardVO();
	
		freeboard.setTitle("첨부파일 테스트 Junit33"); 
		freeboard.setConts("첨부파일 테스트 Junit33");
		freeboard.setReg_id("admin"); 
		freeboard.setReg_nm("관리자");
		
		System.out.println("before FreeboardVO" + freeboard);
		mapper.freeboardAdd(freeboard); 
		System.out.println("after FreeboardVO" + freeboard);
	
	}
	

	/* 상품 리스트 & 상품 총 갯수 */
	/*
	 * @Test public void goodsGetListTest() {
	 * 
	 * Criteria cri = new Criteria();
	 * 
	 * 검색조건 //cri.setKeyword("테스트");
	 * 
	 * 검색 리스트 //List list = mapper.freeboardGetList(cri); //for(int i = 0; i <
	 * list.size(); i++) { // System.out.println("result......." + i + " : " +
	 * list.get(i)); //}
	 * 
	 * 상품 총 갯수 int result = mapper.freeboardGetTotal(cri);
	 * System.out.println("resutl.........." + result);
	 * 
	 * 
	 * }
	 */
	
	/*
	 * @Test public void freeboardGetDetailTest() { int freeboard_seq = 2;
	 * 
	 * FreeboardVO result = mapper.freeboardGetDetail(freeboard_seq);
	 * 
	 * System.out.println("조회 데이터 = " + result); }
	 */
	
	/*
	 * @Test public void freeboardModifyTest() { FreeboardVO freeboard = new
	 * FreeboardVO();
	 * 
	 * freeboard.setFreeboard_seq(1); freeboard.setTitle("수정테스트");
	 * freeboard.setConts("수정 테스트111");
	 * 
	 * mapper.freeboardModify(freeboard); }
	 */
	
	/*
	 * @Test public void uploadEnroll() { UploadVO vo = new UploadVO();
	 * 
	 * vo.setFreeboard_seq(1); vo.setFileName("TEST"); vo.setUploadPath("TEST");
	 * vo.setUuid("TEST2");
	 * 
	 * mapper.uploadEnroll(vo); }
	 */
}
