package com.vam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.NoticeAddMapper;
import com.vam.model.Criteria;
import com.vam.model.NoticeAddVO;

@Service
public class NoticeAddServicelmpl implements NoticeAddService{
	
	private static final Logger log = LoggerFactory.getLogger(NoticeAddServicelmpl.class);
	
	@Autowired
    NoticeAddMapper noticeAddMapper;
	
	/* 공지 사항 등록 */
	@Override
    public void noticeAdd(NoticeAddVO notice) throws Exception {
        
		noticeAddMapper.noticeAdd(notice);
        
    }
	
	/* 공지 사항 목록 */
    @Override
    public List<NoticeAddVO> noticeAddGetList(Criteria cri) throws Exception {
    	
    	log.info("(Service)noticeAddGetList() = " + cri);
        
        return noticeAddMapper.noticeAddGetList(cri);
    }
    
    /* 공지 사항 총 수 */
    @Override
    public int noticeAddGetTotal(Criteria cri) throws Exception {
    	
        log.info("(service)noticeAddGetTotal() = " + cri);
        
        return noticeAddMapper.noticeAddGetTotal(cri);
    }
    
    /* 공지사항 상세 페이지 */
	@Override
	public NoticeAddVO noticeAddGetDetail(int notice_seq) throws Exception {
		log.info("noticeAddGetDetail =" + notice_seq);
		return noticeAddMapper.noticeAddGetDetail(notice_seq);
	}
	
	/* 공지사항 정보 수정 */
	@Override
	public int noticeModify(NoticeAddVO notice) throws Exception {
		log.info("(service) noticeModify........." + notice);
		return noticeAddMapper.noticeModify(notice);
	}
	
	/* 공지사항 삭제 */
	@Override
	public int noticeDelete(NoticeAddVO notice) throws Exception {
		log.info("(service) noticeDelete........." + notice);
		return noticeAddMapper.noticeDelete(notice);
	}
}
