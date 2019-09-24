package com.project.ctrl;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.svc.IStudySvc;

@Controller
public class StudyCtrl {
	
	@Autowired
	private IStudySvc stdSvc;

	@RequestMapping("studyPageM")
	public String studyPageM(Model model) throws ParseException {
		
		stdSvc.stdSltMulti(model);
		
		return "studyPageM";
	}
	
	@RequestMapping("studyPageN")
	public String studyPageN(Model model) throws ParseException {
		
		stdSvc.stdSltMulti(model);
		
		return "studyPageN";
	}
	
	@RequestMapping("studySimulM")
	public String studySimulM(Model model) throws ParseException {
		
		stdSvc.smSltMulti(model);
		
		return "studySimulM";
	}
	
	@RequestMapping("studySimulN")
	public String studySimulN(Model model) throws ParseException {
		
		stdSvc.smSltMulti(model);
		
		return "studySimulN";
	}
	
	@RequestMapping("popUpStudy")
	public String popUpStudy() {
		return "popUpStudy";
	}
	
	@RequestMapping("popUp")
	public String popUp() {
		return "popUp";
	}	
	
	@RequestMapping("popUpEnd")
	public String popUpEnd() {
		return "popUpEnd";
	}
	
	
	@RequestMapping("endStudy.do")
	public String endStudy(Model model, HttpServletRequest request, HttpSession session){

		String viewPage = stdSvc.insertPt(model, request, session);
		
		return viewPage;
	}
	
}
