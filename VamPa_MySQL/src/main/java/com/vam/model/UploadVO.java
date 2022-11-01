package com.vam.model;

import java.io.File;

import lombok.Data;

@Data
public class UploadVO {

	//uuid
	private String uuid;
	
	//파일 이름
	private String fileName;
	
	//게시물 번호
	private int freeboard_seq;
	

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFreeboard_seq() {
		return freeboard_seq;
	}

	public void setFreeboard_seq(int freeboard_seq) {
		this.freeboard_seq = freeboard_seq;
	}

	@Override
	public String toString() {
		return "UploadVO [uuid=" + uuid + ", fileName=" + fileName + ", freeboard_seq="
				+ freeboard_seq + "]";
	}

}
