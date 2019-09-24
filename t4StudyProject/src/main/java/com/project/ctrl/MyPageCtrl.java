package com.project.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.NaverLoginBO;
import com.project.dto.MbrDto;
import com.project.svc.IMyPageSvc;

@Controller
public class MyPageCtrl {

	@Autowired
	private IMyPageSvc svc;
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	/*****************Main Ctrl*****************/	
	@RequestMapping("home")
	public String main() {
		return "redirect:/home.jsp";
	}
	
	@RequestMapping("homeLogin")
	public String homeLogin() {
		return "homeLogin";
	}
	
	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginPage(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        model.addAttribute("url", naverAuthUrl);
        
		return "login";
	}
	
	@RequestMapping("signUp")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping("myPageFirst")
	public String myPageFirst() {
		return "myPageFirst";
	}
	
	@RequestMapping("myPageLeave")
	public String myPageLeave() {
		return "myPageLeave";
	}
	
	@RequestMapping("myPagePoint")
	public String myPagePoint(Model model, HttpSession session) {
		
		svc.sltMyPoint(model, session);
		
		return "myPagePoint";
	}
	
	@RequestMapping("myPagePointTest")
	public String myPagePointTest(Model model) {
		return "myPagePointTest";
	}
	
	@RequestMapping("myPageStudy")
	public String myPageStudy() {
		return "myPageStudy";
	}	
	
	@RequestMapping("ErrorM")
	public String errorPage() {
		return "ErrorM";
	}
	
	@RequestMapping("ErrorN")
	public String errorNPage() {
		return "ErrorN";
	}
	
	@RequestMapping("ErrorNnot")
	public String ErrorNnot() {
		return "ErrorNnot";
	}
	
	@RequestMapping("searchPw")
	public String searchPwPage() {
		return "searchPw";
	}
	
	@RequestMapping("searchPwResult")
	public String searchPwResultPage() {
		return "searchPwResult";
	}

	/*****************login*****************/	
	@RequestMapping("loginCheck.do")
	public String logincheck(@ModelAttribute MbrDto dto, Model model, HttpSession session) {	

		String viewPage = svc.loginCheck(dto, model, session);

		return viewPage;
	}
	
	@RequestMapping("logout.do")
	public String logout(Model model, HttpSession session) {
	
		svc.logout(session);
		
		return "redirect:/home.jsp";
	}
	
	/*****************password search*****************/	
	@RequestMapping("searchPw.do")
	public String searchPw(@ModelAttribute MbrDto dto, Model model, HttpServletRequest request) {	

		String viewPage = svc.searchPw(dto, model, request);

		return viewPage;
	}
	
	/*****************signUp*****************/
	@RequestMapping("signUp.do")
	public String signUp(@ModelAttribute MbrDto dto, Model model, HttpServletRequest request) {	
		
		String viewPage = svc.mbrInsert(dto, model, request);
		
		return viewPage;
	}	
	
	
	/*****************MyPage*****************/
	@RequestMapping("pwCheck.do")
	public String pwCheck(@ModelAttribute MbrDto dto, Model model, HttpSession session) {	
		
		String viewPage = svc.pwCheck(dto, model, session);
		
		return viewPage;
	}
	
	@RequestMapping("myPageInfo.do")
	public String sltInfo(@ModelAttribute MbrDto dto, Model model, HttpSession session) {	
		
		String viewPage = svc.sltInfo(dto, model, session);
		
		return viewPage;
	}
	
	@RequestMapping("infoUpdate.do")
	public String infoUpdate(@ModelAttribute MbrDto dto, Model model, HttpServletRequest request, HttpSession session) {	
		
		String viewPage = svc.updateInfo(dto, model, request, session);
		
		return viewPage;
	}
	
	@RequestMapping("userLeave.do")
	public String userLeave(@ModelAttribute MbrDto dto, Model model, HttpSession session, RedirectAttributes redirectAttr) {	
		
		String viewPage = svc.userLeave(dto, model, session, redirectAttr);
		
		return viewPage;
	}
	
	@RequestMapping("redirect.do")
	public String redirect(@RequestParam(value = "msg", defaultValue = "defalutValue") String msg, Model model) {	
		
		model.addAttribute("redirectMsg", msg);
		
		return "forward:home.jsp";
	}
	
	/*****************MyPage*****************/
	@RequestMapping(value="pointList.do", produces="application/text;charset=UTF-8",
					method=RequestMethod.GET)
	@ResponseBody
	public String ptSltMulti(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
					@RequestParam("stdt") String stdt,  @RequestParam("eddt") String eddt, @RequestParam("selectedTab") String tab) throws Exception {
		
		String str = svc.ptSltMulti(session, stdt, eddt, tab).toString();

        return str;
	}
	
	/*****************MyStudy*****************/
	@RequestMapping(value="studyList.do", produces="application/text;charset=UTF-8",
					method=RequestMethod.GET)
	@ResponseBody
	public String stdSltMulti(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
					@RequestParam("stdt") String stdt,  @RequestParam("eddt") String eddt) throws Exception {

		String str = svc.stdSltMulti(session, stdt, eddt).toString();

        return str;
	}
	
}
