package com.project.svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.project.dto.NMbrDto;
import com.project.dto.PaymentDto;

public interface IPaymentSvc {

	String payInsert (PaymentDto dto, HttpSession session, Model model) throws Exception;
	int myPaySltQEBC(Model model, HttpSession session, int pageNum);
	int allPaySltQEBC(Model model);
	String nMbrInsert(NMbrDto dto, Model model, HttpServletRequest request, HttpSession session);

	
	
}
