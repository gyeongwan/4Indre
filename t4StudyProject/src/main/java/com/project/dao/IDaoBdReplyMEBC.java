package com.project.dao;

import org.apache.ibatis.annotations.Param;

import com.project.dto.BdReDto;

public interface IDaoBdReplyMEBC {

	BdReDto sltOneRe(@Param("postNum") String postNum, @Param("reNum") String reNum);
	int maxReNum(String postNum);
	int insertRe(BdReDto reDto);
	int updateReOrder(@Param("reOrder")int reOrder);
	int updateRe(BdReDto reDto);
	int deleteRe(@Param("postNum") String postNum, @Param("reNum") String reNum);
}
