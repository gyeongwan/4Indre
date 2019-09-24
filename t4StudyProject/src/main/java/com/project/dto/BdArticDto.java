package com.project.dto;

public class BdArticDto {
	
	String postNum;
	String mbrCode;
	String ctg;
	String writer;
	String title;
	String regDate;
	int readCnt;
	String articPath;
	String articImgPath;
	int likeCnt;
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPostNum() {
		return postNum;
	}
	public String getMbrCode() {
		return mbrCode;
	}
	public String getCtg() {
		return ctg;
	}
	public String getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public String getArticPath() {
		return articPath;
	}
	public String getArticImgPath() {
		return articImgPath;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public void setCtg(String ctg) {
		this.ctg = ctg;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setReadcnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public void setArticPath(String articPath) {
		this.articPath = articPath;
	}
	public void setArticImgPath(String articImgPath) {
		this.articImgPath = articImgPath;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
}
