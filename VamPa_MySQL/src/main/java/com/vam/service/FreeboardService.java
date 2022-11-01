package com.vam.service;

import java.util.List;

import com.vam.model.Criteria;
import com.vam.model.FreeboardVO;
import com.vam.model.UploadVO;

public interface FreeboardService {

	/* 자유게시판 등록 */
	public void freeboardAdd(FreeboardVO freeboard);
	
	/* 자유게시판 리스트 */
	public List<FreeboardVO> freeboardGetList(Criteria cri);
	
	/* 자유게시판 총 개수 */
	public int freeboardGetTotal(Criteria cri);
	
	/* 자유게시판 상세 페이지 */
	public FreeboardVO freeboardGetDetail(int freeboard_seq);
	
	/* 자유게시판 수정 */
	public int freeboardModify(FreeboardVO freeboard);
	
	/* 자유게시판 삭제 */
	public int freeboardDelete(FreeboardVO freeboard);
}
