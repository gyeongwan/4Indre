package com.project.dto;

public class CtnDto {
	private String ctnCode;
	private String ctnName;
	private String ctnDate;
	private String ctnPath;
	private int ctnPoint;
	public String getCtnCode() {
		return ctnCode;
	}
	public String getCtnName() {
		return ctnName;
	}
	public String getCtnDate() {
		return ctnDate;
	}
	public String getCtnPath() {
		return ctnPath;
	}
	public int getCtnPoint() {
		return ctnPoint;
	}
	public void setCtnCode(String ctnCode) {
		this.ctnCode = ctnCode;
	}
	public void setCtnName(String ctnName) {
		this.ctnName = ctnName;
	}
	public void setCtnDate(String ctnDate) {
		this.ctnDate = ctnDate;
	}
	public void setCtnPath(String ctnPath) {
		this.ctnPath = ctnPath;
	}
	public void setCtnPoint(int ctnPoint) {
		this.ctnPoint = ctnPoint;
	}
	
	@Override
	public String toString() {
		return "StdDto [ctnCode=" + ctnCode + ", ctnName=" + ctnName + ", ctnDate=" + ctnDate + ", ctnPath=" + ctnPath
				+ ", ctnPoint=" + ctnPoint + "]";
	}
	
	
}
