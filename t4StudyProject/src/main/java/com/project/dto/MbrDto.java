package com.project.dto;

public class MbrDto {
	
	private String mbrCode;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String tel;
	private int point;
	private char mbrState;
	public String getMbrCode() {
		return mbrCode;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getNickname() {
		return nickname;
	}
	public String getEmail() {
		return email;
	}
	public String getTel() {
		return tel;
	}
	public int getPoint() {
		return point;
	}
	public char getMbrState() {
		return mbrState;
	}
	public void setMbrCode(String mbrCode) {
		this.mbrCode = mbrCode;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setMbrState(char mbrState) {
		this.mbrState = mbrState;
	}
	
	@Override
	public String toString() {
		return "MbrDto [mbrCode=" + mbrCode + ", id=" + id + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", email=" + email + ", tel=" + tel + ", point=" + point + ", mbrState=" + mbrState + "]";
	}
	
	
	
}
