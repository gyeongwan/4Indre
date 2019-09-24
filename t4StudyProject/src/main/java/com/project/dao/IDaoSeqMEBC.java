package com.project.dao;

import org.apache.ibatis.annotations.Param;

import com.project.dto.MbrDto;
import com.project.dto.PtHistDto;

public interface IDaoSeqMEBC {
	
	public int ptSeqMax(@Param("mbrCode") String mbrCode);
	
	public void ptInsert(PtHistDto ptDto);
	
	public void stdInsert(MbrDto mbrDto);

	public String sltCtnName(@Param("ctnCode") String ctnCode);

	public int ptSeqMax2();
}
