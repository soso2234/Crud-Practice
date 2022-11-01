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
public class NoticeMapperTests {

	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void noticeList() {
		
		Criteria cri = new Criteria();
		// 테스트 키워드
		cri.setKeyword("test");
		System.out.println("cri : " + cri);
		
		List<NoticeAddVO> list = mapper.noticeList(cri);
		System.out.println("list : " + list);
		
		System.out.println("==========");
		int noticeTotal = mapper.noticeTotal(cri);
		System.out.println("total : " + noticeTotal);
	}
}
