package com.project.svc.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.project.dao.IDaoBdArticMEBC;
import com.project.dao.IDaoBdReplyMEBC;
import com.project.dao.IDaoBoardQEBC;
import com.project.dto.BdArticDto;
import com.project.dto.BdLikeDto;
import com.project.dto.BdReDto;
import com.project.svc.IBoardSvc;

@Service("bdSvc")
public class BoardSvcImpl implements IBoardSvc {
   
   @Autowired
   private IDaoBdArticMEBC maDao;
   @Autowired
   private IDaoBdReplyMEBC mrDao;
   @Autowired
   private IDaoBoardQEBC qDao;
   
   final int PAGE_SIZE = 10;
   final int RE_PAGE_SIZE = 50;

   @Override
   public String sltList(Model model, String ctg, int pageNum) {
      
      int start = (pageNum - 1) * PAGE_SIZE + 1;
      int end = PAGE_SIZE + 1;
      boolean prev = false;
      boolean next = false;
      
      List<BdArticDto> list = qDao.sltList(start, end, ctg);
      if(list.size() == 0)
      {
         return "noConts"; //Ctrl
      }
      
      if(pageNum != 1)
      {
         prev = true;
      }
      
      if(list.size() > PAGE_SIZE)
      {
         list.remove(list.size()-1);
         next = true;
      }
      
      model.addAttribute("list", list);
      model.addAttribute("prev", prev);
      model.addAttribute("next", next);
      model.addAttribute("pageNum", pageNum);
      return "sltList"; //Ctrl
   }

   @Override
   public String sltArtic(Model model, String postNum) {
      
      BdArticDto aDto = qDao.sltArtic(postNum);
      model.addAttribute("dto", aDto);
      model.addAttribute("postNum", postNum);
      
      
      
      return "sltArtic";
   }

   @Override
   public String sltArticRe(Model model, String postNum, int rePageNum) {
      
      BdArticDto aDto = qDao.sltArtic(postNum);
      model.addAttribute("dto", aDto);
      model.addAttribute("postNum", postNum);
      
      int start = (rePageNum - 1) * RE_PAGE_SIZE + 1;
      int end = RE_PAGE_SIZE + 1;
      boolean prev = false;
      boolean next = false;
      
      List<BdReDto> list = qDao.sltRe(start, end, postNum);
      
      if(rePageNum != 1)
      {
         prev = true;
      }
      
      if(list.size() > PAGE_SIZE)
      {
         list.remove(list.size()-1);
         next = true;
      }
      
      model.addAttribute("reList", list);
      model.addAttribute("prev", prev);
      model.addAttribute("next", next);
      model.addAttribute("rePageNum", rePageNum);
      
      return "sltArtic";
   }

   @Override
   public String schTitle(Model model, String word, String ctg, int pageNum) {
      
      int start = (pageNum - 1) * PAGE_SIZE + 1;
      int end = PAGE_SIZE + 1;
      
      List<BdArticDto> list = qDao.schTitle(start, end, ctg, word);
      if(list.size() == 0)
      {
         return "noConts"; //Ctrl
      }
      
      model.addAttribute("list", list);
      return "schTitle"; //Ctrl
   }

   @Override
   public String schName(Model model, String nickName, String ctg, int pageNum) {
      
      int start = (pageNum - 1) * PAGE_SIZE + 1;
      int end = PAGE_SIZE + 1;
      
      List<BdArticDto> list = qDao.schName(start, end, ctg, nickName);
      if(list.size() == 0)
      {
         return "noConts"; //Ctrl
      }
      
      model.addAttribute("list", list);
      return "schName"; //Ctrl
   }

   @Override
   @Transactional
   public String insertArtic(BdArticDto dto, String ctg, HttpSession session) throws Exception {
      
      int maxPostNum = 0;
      int nextNum = 0;
      String postNum = "";
      
      maxPostNum = maDao.maxPostNum();
      nextNum = maxPostNum + 1 ;
      postNum = Integer.toString(nextNum);
      
      BdArticDto chkDto = maDao.sltOneArtic(postNum);
      if (chkDto == null) {
         dto.setPostNum(postNum);
         Object mbrCode = session.getAttribute("userCode");
         dto.setMbrCode(mbrCode.toString());
         Object writer = session.getAttribute("userNick");
         dto.setWriter(writer.toString());
         dto.setCtg(ctg);
         dto.setRegDate("2019");
         dto.setReadcnt(0);
         dto.setLikeCnt(0);
         dto.setArticImgPath("NOPE");
      }
      else
         return "insertArtic";
      
      maDao.insertArtic(dto);
      
      return "redirect:sltArtic.do?postNum="+postNum; //등록한 게시글을 띄워주자
//      return "redirect:sltListN.do";
   }

   @Override
   @Transactional
   public String updateArtic(BdArticDto dto) throws Exception {
      
      BdArticDto chkDto = maDao.sltOneArtic(dto.getPostNum());
      
      if (chkDto == null) {
         return "updateArtic"; //수정할 글이 없습니다
      }
      
      maDao.updateArtic(dto);
      
      return "redirect:sltArtic.do"; //수정한 게시글을 띄워주자
   }

   @Transactional
   @Override
   public String insertRe(BdReDto dto, HttpSession session) throws Exception {
      int maxReNum = 0;
      int nextReNum = 0;
      String reNum = "";
      String oPostNum = dto.getPostNum();
      maxReNum = mrDao.maxReNum(oPostNum);
      nextReNum = maxReNum + 1 ;
      reNum = Integer.toString(nextReNum);
      
      BdReDto chkDto = mrDao.sltOneRe(oPostNum, reNum);
      if (chkDto == null) {
         dto.setReNum(reNum);
         Object mbrCode = session.getAttribute("userCode");
         dto.setMbrCode(mbrCode.toString()); 
         Object writer = session.getAttribute("userNick");
         dto.setReWriter(writer.toString());
         
         //첫번째 댓글
         if(maxReNum == 0)
         {
            dto.setReRef(0);
            dto.setReDept(0);
            dto.setReOrder(1);
         }
         //부모 댓글이 있는지, 어디인지 판별
         else if(dto.getReRef() == 0)
         {
            dto.setReDept(0);
            int nextOrder = qDao.maxReOrder(oPostNum) + 1;
            dto.setReOrder(nextOrder);
         }
         else
         {
            int maxOrder = qDao.maxRefOrder(oPostNum, dto.getReRef());
            if(maxOrder == 0)
            {
               //부모 댓글의 순서에 +1
               maxOrder = dto.getReOrder();
               mrDao.updateReOrder(maxOrder);
               dto.setReOrder(dto.getReOrder()+1);
            }
            else
            {
               mrDao.updateReOrder(maxOrder);
               dto.setReOrder(maxOrder+1);
            }
            dto.setReDept(dto.getReDept()+1);
         }
      }
      else
         return "sltArtic.do?postNum="+oPostNum; //해당 게시글 불러오기
      
      mrDao.insertRe(dto);
      
      return "redirect:sltArtic.do?postNum="+dto.getPostNum(); //등록한 덧글의 게시글을 띄워주자
   }

   @Transactional
   @Override
   public String updateRe(BdReDto dto) {
      
      BdReDto chkDto = mrDao.sltOneRe(dto.getPostNum(), dto.getReNum());
      
      if (chkDto == null) {
         return "updateRe"; //수정할 댓글이 없습니다
      }
      
      mrDao.updateRe(dto);
      
      return "redirect:sltArtic.do"; //수정한 게시글을 띄워주자
   }

   @Transactional
   @Override
   public String deleteRe(BdReDto dto) {
      BdReDto chkDto = mrDao.sltOneRe(dto.getPostNum(), dto.getReNum());
      System.out.println("DOOR 1");
      if ( chkDto == null ) {
         return "noRep"; //삭제할 댓글이 없습니다
      }
      
      //이 댓글번호가 참조에 사용되고 있는지 check
      System.out.println("DOOR 2");
      int cnt = qDao.chkRef(dto.getPostNum(), Integer.parseInt(dto.getReNum()));
      System.out.println("DOOR 3");
      if(cnt == 0)
      {
         System.out.println("DOOR 4");
         //최하위 댓글
         mrDao.deleteRe(dto.getPostNum(), dto.getReNum());
      }
      else
      {
         dto.setRePath("삭제된 댓글입니다.");
         dto.setReImgPath("DELETE");
         mrDao.updateRe(dto);
      }
      
      return "deleteReply";
   }

   @Override
   public String insertLike(BdLikeDto lDto, BdArticDto aDto) {
      
      BdLikeDto chkDto = maDao.likeOne(lDto);
      if(chkDto != null)
      {
         return "ALERT"; //이미 추천하셨습니다
      }

      int res = maDao.likeInsert(lDto);
      if(res == 1)
      {
         aDto.setLikeCnt(aDto.getLikeCnt()+1);
         maDao.updateArtic(aDto);
      }
      else
      {
         return "ERR";
      }
         
      return "IMSI"; //ajax
   }

}