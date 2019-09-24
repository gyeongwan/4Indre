package com.project.dto;

public class StdHistDto {
	
	private String mbrCode;
	private String stdSeq;
	private String ctnCode;
	private String stdDate;
	private int stdPoint;
	
	public String getMbrCode() {
		return mbrCode;
	}
	public String getStdSeq() {
		return stdSeq;
	}
	public String getCtnCode() {
		return ctnCode;
	}
	public String getStdDate() {
		return stdDate;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public void setStdSeq(String stdSeq) {
		this.stdSeq = stdSeq;
	}
	public void setCtnCode(String ctnCode) {
		this.ctnCode = ctnCode;
	}
	public void setStdDate(String stdDate) {
		this.stdDate = stdDate;
	}
	public int getStdPoint() {
		return stdPoint;
	}
	public void setStdPoint(int stdPoint) {
		this.stdPoint = stdPoint;
	}
	
	@Override
	public String toString() {
		return "StdHistDto [mbrCode=" + mbrCode + ", stdSeq=" + stdSeq + ", ctnCode=" + ctnCode + ", stdDate=" + stdDate
				+ ", stdPoint=" + stdPoint + "]";
	}	
	
}
