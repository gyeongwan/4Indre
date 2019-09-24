package com.project.svc;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.MbrDto;

public interface IMyPageSvc {

	String loginCheck(MbrDto dto, Model model, HttpSession session);

	void logout(HttpSession session);
	
	String searchPw(MbrDto dto, Model model, HttpServletRequest request);

	MbrDto checkId(MbrDto dto);	
	
	MbrDto checkNick(MbrDto dto);
	
	String mbrInsert(MbrDto dto, Model model, HttpServletRequest request);

	String pwCheck(MbrDto dto, Model model, HttpSession session);

	String sltInfo(MbrDto dto, Model model, HttpSession session);

	String updateInfo(MbrDto dto, Model model, HttpServletRequest request, HttpSession session);

	String userLeave(MbrDto dto, Model model, HttpSession session, RedirectAttributes redirectAttr);
	
	void sltMyPoint(Model model, HttpSession session);
	
	String ptSltMulti(HttpSession session, String stdt, String eddt, String tab) throws ParseException;

	String stdSltMulti(HttpSession session, String stdt, String eddt) throws ParseException;


	





}
