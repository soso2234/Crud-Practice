package com.vam.service;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

public interface NoticeService {

	/* 공지사항 목록 */
	public List<NoticeAddVO> noticeList(Criteria cri);
	
	/* 공지사항 총 갯수 */
	public int noticeTotal(Criteria cri);
	
	/* 공지사항 상세 */
	public NoticeAddVO noticeDetail(int notice_seq);
}
