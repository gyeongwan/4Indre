package com.project.dto;

public class PtHistDto {
	
	private String mbrCode;
	private String ptSeq;
	private String ptDate;
	private String ptLog;
	private int usePt;
	private int savePt;
	public String getMbrCode() {
		return mbrCode;
	}
	public String getPtSeq() {
		return ptSeq;
	}
	public String getPtDate() {
		return ptDate;
	}
	public String getPtLog() {
		return ptLog;
	}
	public int getUsePt() {
		return usePt;
	}
	public int getSavePt() {
		return savePt;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public void setPtSeq(String ptSeq) {
		this.ptSeq = ptSeq;
	}
	public void setPtDate(String ptDate) {
		this.ptDate = ptDate;
	}
	public void setPtLog(String ptLog) {
		this.ptLog = ptLog;
	}
	public void setUsePt(int usePt) {
		this.usePt = usePt;
	}
	public void setSavePt(int savePt) {
		this.savePt = savePt;
	}
	@Override
	public String toString() {
		return "PtHistDto [mbrCode=" + mbrCode + ", ptSeq=" + ptSeq + ", ptDate=" + ptDate + ", ptLog=" + ptLog
				+ ", usePt=" + usePt + ", savePt=" + savePt + "]";
	}
	

}
