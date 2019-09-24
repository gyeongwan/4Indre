package com.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.dto.BdArticDto;
import com.project.dto.BdReDto;

public interface IDaoBoardQEBC {

//	List<BdArticDto> sltList(int start, int end, String ctg);
	List<BdArticDto> sltList(@Param("start") int start, @Param("end") int end, @Param("ctg") String ctg);
	
//	List<BdArticDto> schTitle(int start, int end, String ctg, String word);
	List<BdArticDto> schTitle(@Param("start") int start, @Param("end") int end, @Param("ctg") String ctg, @Param("word") String word);
	
//	String sltMbrCode(String nickName); //나중에 닉네임 클릭-작성글 검색은 할 수 있으면 만듦
	List<BdArticDto> schName(@Param("start") int start, @Param("end") int end, @Param("ctg") String ctg, @Param("word") String word);
	
	BdArticDto sltArtic(String postNum);
	
//	List<BdReDto> sltRe(int start, int end, String postNum);
	List<BdReDto>sltRe(@Param("start") int start, @Param("end") int end, @Param("postNum") String postNum);
	
//	int sltLike(String postNum); //BOARD TABLE에 추천수 항목이 들어가서 필요없어진 method
	
	int maxReOrder(@Param("postNum")String postNum);
	
	int maxRefOrder(@Param("postNum")String postNum, @Param("reRef")int reRef);
	
	int chkRef(@Param("postNum")String postNum, @Param("reRef") int reRef);
}
