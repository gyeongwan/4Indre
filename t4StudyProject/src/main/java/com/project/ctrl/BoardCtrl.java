package com.project.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.BdArticDto;
import com.project.dto.BdReDto;
import com.project.svc.IBoardSvc;

@Controller
public class BoardCtrl {
   
   @Autowired
   private IBoardSvc bdSvc;
   @RequestMapping("noConts")
   public String noConts()
   {
      //등록된 게시글이 없습니다.
      return "noConts";
   }
   
   
   //리스트 조회 N:공지사항 U:유저강의 R:학습후기 S:건의사항
   @RequestMapping("sltListN.do")
   public String sltListN(Model model, String ctg, @RequestParam(defaultValue="1") int pageNum)
   {
//      HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
      
      //처음에 클릭했을 때 무조건 첫 페이지 보여주기
      bdSvc.sltList(model, "N", pageNum);
      return "sltListN";
   }
//   @RequestMapping("sltListU")
//   public String sltListU()
//   {
//      return "sltListU";
//   }
//   @RequestMapping("sltListR")
//   public String sltListR()
//   {
//      return "sltListR";
//   }
//   @RequestMapping("sltListS")
//   public String sltListS()
//   {
//      return "sltListS";
//   }
   
   @RequestMapping("insertArtic.do")
   public String insertArticDo()
   {
//      return "insertArtic";
      return "insertArticTest";
   }

   @RequestMapping("sltList")
   public String sltList(Model model, String ctg, int pageNum)
   {
      //리스트 조회.
      String view = bdSvc.sltList(model, ctg, pageNum);
      return view + ctg;
   }
   
   @RequestMapping("sltArtic.do")
   public String sltArtic(Model model, @ModelAttribute("postNum")String postNum, @RequestParam(defaultValue="1") int rePageNum)
   {
      String view = bdSvc.sltArticRe(model, postNum, rePageNum);
      return view;
   }
   
   @RequestMapping("sltArtic")
   public String sltArticDone()
   {
      return "sltArtic";
   }
   
   @RequestMapping("insertArtic")
   public String insertAtric(BdArticDto dto, @ModelAttribute("ctg")String ctg, HttpSession session)
   {
      String view = "ERR";
      System.out.println("카테고리>>" + ctg);
      try {
         view = bdSvc.insertArtic(dto, ctg, session);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return view;
   }
   
   
   @RequestMapping("insertRe")
   public String insertRe(BdReDto dto, @ModelAttribute("postNum")String postNum, @RequestParam(defaultValue="0") int reRef, HttpSession session)
   {
      dto.setPostNum(postNum);
      dto.setReRef(reRef);
      String view = "ERR";
      try {
         view = bdSvc.insertRe(dto, session);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return view;
   }
   
//   @RequestMapping("sltRe.do")
//   public String sltRe(Model model, @ModelAttribute("postNum")String postNum, @RequestParam(defaultValue="1") int pageNum)
//   {
//      //처음에 클릭했을 때 무조건 첫 페이지 보여주기
//      bdSvc.sltList(model, "N", pageNum);
//      return "sltListN";
//   }

}