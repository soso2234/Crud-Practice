package com.vam.service;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

public interface NoticeAddService {

	/* 공지사항 등록 */
    public void noticeAdd(NoticeAddVO notice) throws Exception;
    
    /* 공지사항 목록 */
    public List<NoticeAddVO> noticeAddGetList(Criteria cri) throws Exception;
    
    /* 공지사항 총 수 */
    public int noticeAddGetTotal(Criteria cri) throws Exception;   
    
    /* 공지사항 상세 페이지 */
	public NoticeAddVO noticeAddGetDetail(int notice_seq) throws Exception;
	
	/* 공지사항 정보 수정 */
	public int noticeModify(NoticeAddVO notice) throws Exception;
	
	/* 공지사항 삭제 */
	public int noticeDelete(NoticeAddVO notice) throws Exception;
}
