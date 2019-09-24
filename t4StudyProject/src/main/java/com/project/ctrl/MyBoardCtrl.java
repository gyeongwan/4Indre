package com.project.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MyBoardDto;
import com.project.svc.MyBoardSvc;

@Controller
public class MyBoardCtrl {
   
	@Autowired
    private MyBoardSvc mybdSvc;
    
	
	
	
	@RequestMapping("boardList")
	public String boardList() {
		return "boardList";
	}
	
    /**
     * 게시판 조회
     * @param bdDto
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("boardList.do")
    public String boardList(@ModelAttribute("MyBoardDto") MyBoardDto bdDto, Model model) throws Exception{
                
        List<MyBoardDto> list = mybdSvc.selectBoardList(bdDto);
        
        model.addAttribute("list", list);
        
        return "boardList";
    }
    
    /**
     * 글쓰기 폼
     * @return
     * @throws Exception
     */
    @RequestMapping("writeForm.do")
    public String writeBoardForm() throws Exception{
        
        return "/writeForm";
    }
    
    /**
     * 게시글 등록
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("write.do")
    public String write(@ModelAttribute("MyBoardDto") MyBoardDto bdDto, Model model) throws Exception{
        
        mybdSvc.insertBoard(bdDto);
        
        return "redirect:/boardList.do";
    }
    
    /**
     * 게시글 조회
     * @param boardVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("viewContent.do")
    public String viewForm(@ModelAttribute("MyBoardDto") MyBoardDto bdDto, Model model, HttpServletRequest request) throws Exception{
        
        int code = Integer.parseInt(request.getParameter("code"));
        bdDto.setCode(code);
        
        MyBoardDto resultVO = mybdSvc.selectBoardByCode(bdDto);
        
        model.addAttribute("result", resultVO);
        
        return "viewForm";
    }
    
    /**
     * 게시글 수정
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("updateboard.do")
    public String updateBoard(@ModelAttribute("MyBoardDto") MyBoardDto bdDto, Model model) throws Exception{
        
        try{
            
            mybdSvc.updateBoard(bdDto);
            
        } catch (Exception e){
            e.printStackTrace();
        }        
        
        return "redirect:/boardList.do";
        
    }

}