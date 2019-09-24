package com.project.svc;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface IStudySvc {

	void stdSltMulti(Model model) throws ParseException;

	void smSltMulti(Model model) throws ParseException;

	String insertPt(Model model, HttpServletRequest request, HttpSession session);

}
