package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vam.mapper.FreeboardMapper;
import com.vam.model.Criteria;
import com.vam.model.FreeboardVO;
import com.vam.model.UploadVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FreeboardServicelmpl implements FreeboardService {

	@Autowired
	private FreeboardMapper freeboardMapper;
	
	/* 자유게시판 등록 */
	@Transactional
	@Override
	public void freeboardAdd(FreeboardVO freeboard) {
		
		log.info("(service)_freeboardAdd ===");
		
		freeboardMapper.freeboardAdd(freeboard);
		
		if(freeboard.getUploadList() == null || freeboard.getUploadList().size() <= 0) {
			
			return;
			
		}
		
		freeboard.getUploadList().forEach(attach ->{
			
			attach.setFreeboard_seq(freeboard.getFreeboard_seq());
			freeboardMapper.uploadEnroll(attach);
			
		});
		
	}
	
	/* 자유게시판 리스트 */
	@Override
	public List<FreeboardVO> freeboardGetList(Criteria cri) {
		
		log.info("freeboardGetList()..........");
		
		return freeboardMapper.freeboardGetList(cri);
	}

	/* 자유게시판 총 갯수 */
	public int freeboardGetTotal(Criteria cri) {
		
		log.info("freeboardGetTotal().........");
		
		return freeboardMapper.freeboardGetTotal(cri);
	}
	
	/* 자유게시판 상세 페이지 */
	@Override
	public FreeboardVO freeboardGetDetail(int freeboard_seq) {
		
		log.info("(service)freeboardGetDetail ==" + freeboard_seq);
		
		return freeboardMapper.freeboardGetDetail(freeboard_seq);
	}
	
	/* 자유게시판 수정 */
	@Override
	public int freeboardModify(FreeboardVO freeboard) {
		
		log.info("freeboardModify ==");
		
		return freeboardMapper.freeboardModify(freeboard);
	}
	
	/* 자유게시판 삭제 */
	@Override
	public int freeboardDelete(FreeboardVO freeboard) {

		log.info("freeboardDelete == " + freeboard);
		
		return freeboardMapper.freeboardDelete(freeboard);
	}
	
}
