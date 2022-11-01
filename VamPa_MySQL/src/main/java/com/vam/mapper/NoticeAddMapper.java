package com.vam.mapper;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

public interface NoticeAddMapper {
	
	/* 작가 등록 */
    public void noticeAdd(NoticeAddVO noticeAdd);
    
    //공지사항 목록
    public List<NoticeAddVO> noticeAddGetList(Criteria cri);
    
    /* 공지사항 총 수 */
    public int noticeAddGetTotal(Criteria cri);
    
    /* 공지사항 상세 */
	public NoticeAddVO noticeAddGetDetail(int notice_seq);
	
	/* 공지사항 수정 */
	public int noticeModify(NoticeAddVO noticeAdd);
	
	/* 공지사항 삭제 */
	public int noticeDelete(NoticeAddVO noticeAdd);
	
}
