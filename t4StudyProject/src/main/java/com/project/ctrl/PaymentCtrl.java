package com.project.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.NMbrDto;
import com.project.dto.PaymentDto;
import com.project.svc.IPaymentSvc;

@Controller
public class PaymentCtrl {

	@Autowired
	private IPaymentSvc paySvc;
	
    
	
        
	@RequestMapping("dntDetailsPage.do")
	public String paySltQEBC(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNum) {
		int cnt = paySvc.myPaySltQEBC(model, session , pageNum);
        
		if (cnt == 0) {

			return "donationPage";
		}

		return "dntDetailsPage";
	}
    
	@RequestMapping("donationPage")
	public String donationPage(Model model) {
		
		int cnt = paySvc.allPaySltQEBC(model);

		if (cnt == 0) {

			return "donationPage";
		}
		return "donationPage";
	}

	@RequestMapping("paymentInst.do")
	public String insert(PaymentDto dto, HttpSession session ,Model model) throws Exception {
		String view = paySvc.payInsert(dto, session, model);
        
		int cnt = paySvc.allPaySltQEBC(model);

		if (cnt == 0) {

			return "donationPage";
		}
		
		return view;
	}
	
	@RequestMapping("nSignUp.do")
	public String nSignUp(@ModelAttribute NMbrDto dto, Model model, HttpServletRequest request, HttpSession session) {	
		
		String viewPage = paySvc.nMbrInsert(dto, model, request, session);
		
		int cnt = paySvc.allPaySltQEBC(model);

		if (cnt == 0) {

			return "donationPage";
		}
		
		return viewPage;
	}

	@RequestMapping("dntDetailsPage")
	public String dntDetailsPage() {
		return "dntDetailsPage";
	}

	@RequestMapping("myPage")
	public String myPage() {
		return "myPage";
	}
	@RequestMapping("donationMain")
	public String donationMain() {
		return "donationMain";
	}


	@RequestMapping("singUp")
	public String singUp() {
		return "singUp";
	}
	@RequestMapping("nSignUp")
	public String nSignUp() {
		return "nSignUp";
	}

}
