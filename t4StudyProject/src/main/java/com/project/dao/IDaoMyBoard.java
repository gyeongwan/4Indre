package com.project.dao;

import java.util.List;

import com.project.dto.MyBoardDto;

public interface IDaoMyBoard {

	// 게시물 리스트 조회
	public List<MyBoardDto> selectBoardList(MyBoardDto bdDto) throws Exception;

	// 게시물 등록
	public void insertBoard(MyBoardDto bdDto) throws Exception;

	// 게시물 수정
	public void updateBoard(MyBoardDto bdDto) throws Exception;

	// 게시물 삭제
	public void deleteBoard(MyBoardDto bdDto) throws Exception;

	// 게시물 조회
	public MyBoardDto selectBoardByCode(MyBoardDto bdDto) throws Exception;

	public List<MyBoardDto> selectBoardList(int boardNum);

}
