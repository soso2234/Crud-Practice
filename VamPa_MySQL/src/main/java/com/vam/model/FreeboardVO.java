package com.vam.model;

import java.util.Date;
import java.util.List;

public class FreeboardVO {

	/* 순번 */
	private int freeboard_seq;
	
	/* 제목 */
	private String title;
	
	/* 내용 */
	private String conts;
	
	/* 등록 아이디 */
	private String reg_id;
	
	/* 등록자 */
	private String reg_nm;
	
	/* 등록날짜 */
	private Date reg_dt;
	
	/* 삭제 아이디 */
	private String del_id;
	
	/* 삭제날짜 */
	private Date del_dt;
	
    /* 삭제 여부 */
    private String del_yn;
    
    /* 업데이트 날짜 */
	private Date update_dt;
	
	private List<UploadVO> uploadList;

	public int getFreeboard_seq() {
		return freeboard_seq;
	}

	public void setFreeboard_seq(int freeboard_seq) {
		this.freeboard_seq = freeboard_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getConts() {
		return conts;
	}

	public void setConts(String conts) {
		this.conts = conts;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_nm() {
		return reg_nm;
	}

	public void setReg_nm(String reg_nm) {
		this.reg_nm = reg_nm;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getDel_id() {
		return del_id;
	}

	public void setDel_id(String del_id) {
		this.del_id = del_id;
	}

	public Date getDel_dt() {
		return del_dt;
	}

	public void setDel_dt(Date del_dt) {
		this.del_dt = del_dt;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public Date getUpdate_dt() {
		return update_dt;
	}

	public void setUpdate_dt(Date update_dt) {
		this.update_dt = update_dt;
	}

	public List<UploadVO> getUploadList() {
		return uploadList;
	}

	public void setUploadList(List<UploadVO> uploadList) {
		this.uploadList = uploadList;
	}

	@Override
	public String toString() {
		return "FreeboardVO [freeboard_seq=" + freeboard_seq + ", title=" + title + ", conts=" + conts + ", reg_id="
				+ reg_id + ", reg_nm=" + reg_nm + ", reg_dt=" + reg_dt + ", del_id=" + del_id + ", del_dt=" + del_dt
				+ ", del_yn=" + del_yn + ", update_dt=" + update_dt + ", uploadList=" + uploadList + "]";
	}

}
