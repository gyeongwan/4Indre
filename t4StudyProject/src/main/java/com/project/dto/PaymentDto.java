package com.project.dto;

public class PaymentDto {

	private int dntNum;     //후원번호
	private String userCode;   //유저코드
	private String payDate;    // 결제일시
	private int dntMny;        // 금액
	private String payMTHD;    // 결제방식
	private String payLv;      // 결제상태
	public int getDntNum() {
		return dntNum;
	}
	public void setDntNum(int dntNum) {
		this.dntNum = dntNum;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getDntMny() {
		return dntMny;
	}
	public void setDntMny(int dntMny) {
		this.dntMny = dntMny;
	}
	public String getPayMTHD() {
		return payMTHD;
	}
	public void setPayMTHD(String payMTHD) {
		this.payMTHD = payMTHD;
	}
	public String getPayLv() {
		return payLv;
	}
	public void setPayLv(String payLv) {
		this.payLv = payLv;
	}
	@Override
	public String toString() {
		return "PaymentDto [dntNum=" + dntNum + ", userCode=" + userCode + ", payDate=" + payDate + ", dntMny=" + dntMny
				+ ", payMTHD=" + payMTHD + ", payLv=" + payLv + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
    
	
	
	
	
	
	
	
}
