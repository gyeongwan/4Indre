package com.project.svc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.dto.BdArticDto;
import com.project.dto.BdLikeDto;
import com.project.dto.BdReDto;
import com.project.dto.MyBoardDto;

public interface IBoardSvc {

   String sltList(Model model, String ctg, int pageNum);
   String sltArtic(Model model, String postNum);
   String sltArticRe(Model model, String postNum, int rePageNum);
   String schTitle(Model model, String word, String ctg, int pageNum);
   String schName(Model model, String nickName, String ctg, int pageNum);
   String insertArtic(BdArticDto dto, String ctg, HttpSession session) throws Exception;
   String updateArtic(BdArticDto dto) throws Exception;
   //String deleteArtic(BdArticDto dto);
   String insertRe(BdReDto dto, HttpSession session) throws Exception;
   String updateRe(BdReDto dto);
   String deleteRe(BdReDto dto);
   String insertLike(BdLikeDto lDto, BdArticDto aDto);
   
   
   
}