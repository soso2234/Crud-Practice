package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.NoticeMapper;
import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServicelmpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	/* 목록 */
	@Override
	public List<NoticeAddVO> noticeList(Criteria cri) {
		
		log.info("NoticeList == ");
		
		return noticeMapper.noticeList(cri);
	}
	
	/* 총 갯수 */
	@Override
	public int noticeTotal(Criteria cri) {
		
		log.info("noticeTotal == ");
		
		return noticeMapper.noticeTotal(cri);
	}
	
	/* 공지사항 상세 */
	@Override
	public NoticeAddVO noticeDetail(int notice_seq) {
		
		log.info("noticeDetail = " + notice_seq);
		
		return noticeMapper.noticeDetail(notice_seq);
		
	}
}
