package com.vam.model;

import java.util.Date;

public class NoticeAddVO {
	/* 순번 */
    private int notice_seq;
    
    /* 제목 */
    private String title;
    
    /* 내용 */
    private String conts;
    
    /*등록 아이디*/
    private String reg_id;
    
    /*등록 이름*/
    private String reg_nm;
    
    /*등록 날짜*/
    private Date reg_dt;
    
    /* 삭제 아이디 */
    private String del_id;
    
    /* 삭제 날짜 */
    private Date del_dt;
    
    /* 삭제 여부 */
    private String del_yn;

	public int getNotice_seq() {
		return notice_seq;
	}

	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
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
}
