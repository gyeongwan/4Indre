package com.project.dto;

public class DonationDto {

	private int dntNum;
	private int    dntMny;
	private String dntCode;
	
	public int getDntNum() {
		return dntNum;
	}
	public void setDntNum(int dntNum) {
		this.dntNum = dntNum;
	}
	public int getDntMny() {
		return dntMny;
	}
	public void setDntMny(int dntMny) {
		this.dntMny = dntMny;
	}
	public String getDntCode() {
		return dntCode;
	}
	public void setDntCode(String dntCode) {
		this.dntCode = dntCode;
	}
	
	@Override
	public String toString() {
		return "DonationDto [dntNum=" + dntNum + ", dntMny=" + dntMny + ", dntCode=" + dntCode + "]";
	}
	
	
	
}
