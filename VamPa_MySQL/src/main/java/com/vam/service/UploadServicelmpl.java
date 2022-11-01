package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.UploadMapper;
import com.vam.model.UploadVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UploadServicelmpl implements UploadService {

	@Autowired
	private UploadMapper uploadMapper;
	
	//첨부파일 데이터 반환
	@Override
	public List<UploadVO> getUploadList(int freeboard_seq) {
		
		System.out.println("getUploadList Service =====================");
		
		return uploadMapper.getUploadList(freeboard_seq);
	}
}
