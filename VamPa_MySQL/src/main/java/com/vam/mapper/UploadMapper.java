package com.vam.mapper;

import java.util.List;

import com.vam.model.UploadVO;

public interface UploadMapper {

	//첨부파일 데이터 반환
	public List<UploadVO> getUploadList(int freeboard_seq);
	
}