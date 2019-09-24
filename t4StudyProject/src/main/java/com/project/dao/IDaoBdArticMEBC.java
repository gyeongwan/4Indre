package com.project.dao;

import com.project.dto.BdArticDto;
import com.project.dto.BdLikeDto;

public interface IDaoBdArticMEBC {

	BdArticDto sltOneArtic(String postNum);
	
	int maxPostNum();
	int insertArtic(BdArticDto articDto);
	int updateArtic(BdArticDto articDto);
	int deleteArtic(String postNum);
	
	BdLikeDto likeOne(BdLikeDto likeDto);
	int likeInsert(BdLikeDto likeDto);
}
