package com.project.dto;

public class UserCodeDto {

	private String userCode;
	private String userChk;
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserChk() {
		return userChk;
	}
	public void setUserChk(String userChk) {
		this.userChk = userChk;
	}
	@Override
	public String toString() {
		return "UserCodeDto [userCode=" + userCode + ", userChk=" + userChk + "]";
	}
	
	
	
	
	
}
