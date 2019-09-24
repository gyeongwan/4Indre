package com.project.svc;

import java.util.List;

import com.project.dto.MyBoardDto;

public interface MyBoardSvc {

   List<MyBoardDto> selectBoardList(MyBoardDto bdDto ) throws Exception; 
   
   void insertBoard(MyBoardDto bdDto) throws Exception;
   
   void updateBoard(MyBoardDto bdDto) throws Exception;
   
   void deleteBoard(MyBoardDto bdDto) throws Exception;
   
   MyBoardDto selectBoardByCode(MyBoardDto bdDto) throws Exception;
   
   
}