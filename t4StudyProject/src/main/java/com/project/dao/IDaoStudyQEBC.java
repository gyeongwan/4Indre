package com.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.dto.CtnDto;

public interface IDaoStudyQEBC {

	public ArrayList<CtnDto> stdSltMulti(@Param("param") String param);
	
	public ArrayList<CtnDto> smSltMulti(@Param("param") String param);
	
}
