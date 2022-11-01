package com.vam.service;

import java.util.List;

import com.vam.model.UploadVO;

public interface UploadService {
	
	//첨부파일 데이터 반환
	public List<UploadVO> getUploadList(int freeboard_seq);

}
