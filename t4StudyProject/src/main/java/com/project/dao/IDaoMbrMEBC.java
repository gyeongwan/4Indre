package com.project.dao;

import org.apache.ibatis.annotations.Param;

import com.project.dto.MbrDto;

public interface IDaoMbrMEBC {

	public MbrDto mbrCheck(MbrDto dto);
	
	public MbrDto mbrSltOne(MbrDto dto);

	public MbrDto checkId(MbrDto dto);
	
	public MbrDto checkNick(MbrDto dto);
	
	public int mbrSeqMax();
	
	public int userInsert(MbrDto dto);
	
	public int mbrInsert(MbrDto dto);

	public MbrDto pwCheck(MbrDto dto);

	public void updateInfo(MbrDto dto);

	public void userLeave(MbrDto dto);
	
	public String sltCode(@Param("id") String id);

	public int sltPoint(@Param("mbrCode") String mbrCode);

	public MbrDto searchMbr(MbrDto dto);

	public void updatePw(MbrDto newDto);
	
	public MbrDto mbrPaySltOne(String userCode);

	public void ptUpdate(MbrDto mbrDto);
	
}
