package com.project.dto;

public class NMbrDto {
	
	private String nMbrCode;
	private String nmName;
	private String nmTel;
	
	
	public String getnMbrCode() {
		return nMbrCode;
	}
	public void setnMbrCode(String nMbrCode) {
		this.nMbrCode = nMbrCode;
	}
	public String getNmName() {
		return nmName;
	}
	public void setNmName(String nmName) {
		this.nmName = nmName;
	}
	public String getNmTel() {
		return nmTel;
	}
	public void setNmTel(String nmTel) {
		this.nmTel = nmTel;
	}
	@Override
	public String toString() {
		return "NMbrDto [nMbrCode=" + nMbrCode + ", nmName=" + nmName + ", nmTel=" + nmTel + "]";
	}
	
	
	
	
	
	
}
