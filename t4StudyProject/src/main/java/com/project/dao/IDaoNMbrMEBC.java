package com.project.dao;

import com.project.dto.NMbrDto;
import com.project.dto.UserCodeDto;

public interface IDaoNMbrMEBC {

	public int nMbrSeqMax();
	
	public void userInsert(UserCodeDto ucDto);

	public int nMbrInsert(NMbrDto dto);

	
}
