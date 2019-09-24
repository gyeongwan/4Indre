package com.project.dto;

public class MyBoardDto {

	private int code;
	private String title;
	private String content;
	private String writer;
	private String reg_datatime;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReg_datatime() {
		return reg_datatime;
	}
	public void setReg_datatime(String reg_datatime) {
		this.reg_datatime = reg_datatime;
	}
	@Override
	public String toString() {
		return "myBoardDto [code=" + code + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", reg_datatime=" + reg_datatime + "]";
	}
	
	
}
