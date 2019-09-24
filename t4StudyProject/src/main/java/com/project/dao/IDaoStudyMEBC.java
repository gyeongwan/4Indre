package com.project.dao;

import org.apache.ibatis.annotations.Param;

import com.project.dto.MbrDto;
import com.project.dto.PtHistDto;
import com.project.dto.StdHistDto;

public interface IDaoStudyMEBC {

	int sltPoint(@Param("ctnCode") String ctnCode);
	
	int stdSeqMax(@Param("mbrCode") String mbrCode);

	int insStdHist(StdHistDto dto);

	int insPtHist(PtHistDto ptDto);

	int updateP(MbrDto mbrDto);

}
