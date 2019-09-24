package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.project.dto.MbrDto;
import com.project.dto.PtHistDto;
import com.project.dto.StdHistDto;

public interface IDaoMyPageQEBC {

	ArrayList<MbrDto> mbrSltMulti();
	
	ArrayList<PtHistDto> ptSltMulti(HashMap<String, String> map);
	
	ArrayList<StdHistDto> stdSltMulti(HashMap<String, String> map);

	ArrayList<PtHistDto> allPtList(@Param("code") String code);

	ArrayList<StdHistDto> allStdList(@Param("code") String code);

}
