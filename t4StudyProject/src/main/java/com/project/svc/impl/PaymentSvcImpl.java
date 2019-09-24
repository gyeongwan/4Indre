package com.project.svc.impl;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.project.dao.IDaoDonation;
import com.project.dao.IDaoMbrMEBC;
import com.project.dao.IDaoNMbrMEBC;
import com.project.dao.IDaoPaymentMEBC;
import com.project.dao.IDaoPaymentQEBC;
import com.project.dao.IDaoSeqMEBC;
import com.project.dto.DonationDto;
import com.project.dto.MbrDto;
import com.project.dto.NMbrDto;
import com.project.dto.PaymentDto;
import com.project.dto.PtHistDto;
import com.project.dto.UserCodeDto;
import com.project.svc.IPaymentSvc;

@Service("paySvc")
public class PaymentSvcImpl implements IPaymentSvc {

	@Autowired
	IDaoDonation dntDao;
	@Autowired
	IDaoPaymentMEBC payMEBC;
	@Autowired
	IDaoPaymentQEBC payQEBC;
	@Autowired
	IDaoMbrMEBC mbrMEBC;
	@Autowired
	private IDaoSeqMEBC sqDao;
	@Autowired	
	private IDaoNMbrMEBC nMbrSDao;	//single

	final int PAGE_SIZE = 5;
	final int RE_PAGE_SIZE = 50;

	/*****************전체 결제 내역 조회*****************/
	@Override
	public int allPaySltQEBC(Model model) {
		
		//DecimalFormat 클래스로 원단위 , 지정
		DecimalFormat formatter = new DecimalFormat("###,###,###,###");
		PaymentDto dto = new PaymentDto();
		int dntNum = dto.getDntNum();
		
        ArrayList<DonationDto> list = payQEBC.dntSltQEBC(dntNum);
		int cnt = list.size();

		if (cnt == 0) {
			return 0;
		}
		
		int tot = 0;
		
		for (DonationDto dntDto : list) {
			tot += dntDto.getDntMny();
		}
		
		model.addAttribute("LIST", list);
		model.addAttribute("CNT", formatter.format(cnt));
		model.addAttribute("TOT", formatter.format(tot)); //DecimalFormat으로 원단위에 , 입력하는 내용

		
		
		return cnt;
	
	}
	/*****************나의 결제 내역 조회*****************/
	@Override
	public int myPaySltQEBC(Model model,  HttpSession session, int pageNum) {
//		UserCodeDto codeDto = new UserCodeDto();
		String id   = (String) session.getAttribute("userId");
		String code = (String) session.getAttribute("code");
		
		int start = (pageNum - 1) * PAGE_SIZE + 1;
	    int end = PAGE_SIZE + 1;
	    boolean prev = false;
	    boolean next = false;
		
		String userCode = mbrMEBC.sltCode(id); 
		if(userCode == null) {
			userCode = code;
		}
		System.out.println("userCodeck"+ userCode);
		
		List<PaymentDto> list = payQEBC.dntSltMEBC(start, end, userCode);
		
		if(list == null) {
			model.addAttribute("msg", "결제내역이 없습니다. ");
			return 0;
		}
		
		if(pageNum != 1){
			prev = true;
		}
		
		if(list.size() > PAGE_SIZE){
			list.remove(list.size()-1);
			next = true;
		}
		
		
		int cnt = list.size();
	    
		
		if (cnt == 0) {
			return 0;
		}
		
		model.addAttribute("LIST", list);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		
		return cnt;
		
		
	}
	/*****************결제 insert*****************/
	@Transactional
	public String payInsert(PaymentDto dto, HttpSession session, Model model) throws Exception {
		int maxMberNo = 0;
		int dntNum = 1;
		PaymentDto prevDto = new PaymentDto();  
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar time = Calendar.getInstance();
        String format_time = format1.format(time.getTime());
        
        String id = (String)session.getAttribute("userId");
        //codeNum 여부를 확인하여 회원/비회원 확인
        String codeNum = mbrMEBC.sltCode(id);
        
        UserCodeDto ucDto = new UserCodeDto();
        NMbrDto nmDto = new NMbrDto();
        
        //비회원 결제일 경우 시작
        if(codeNum == null) {
            String name = (String) session.getAttribute("name");
            String tel  = (String) session.getAttribute("tel");
            
            int maxNum = nMbrSDao.nMbrSeqMax() + 1;
            nmDto.setnMbrCode("N" + maxNum);
            nmDto.setNmName(name);
            nmDto.setNmTel(tel);
    		
    		ucDto.setUserCode(nmDto.getnMbrCode());
    		ucDto.setUserChk("N");
    		
    		//usercode,nmbr insert수행
    		nMbrSDao.userInsert(ucDto);
    		nMbrSDao.nMbrInsert(nmDto);
    		
    		codeNum = nmDto.getnMbrCode();
        }
        
        //내 결제 내역에 사용하기 위해 setAttribute
        session.setAttribute("code", nmDto.getnMbrCode());
		
        //회원일경우 단건조회
		prevDto = payMEBC.paySltOne(dntNum);
		
		//조회한 nmb에 최대값 적용후 다시 단건조회 
		while (prevDto != null) { 
			maxMberNo = payQEBC.payNumberMax();
            dntNum = maxMberNo + 1;
			prevDto = payMEBC.paySltOne(dntNum);
		}
		
		dto.setDntNum(dntNum);
		dto.setUserCode(codeNum);
		dto.setPayDate(format_time);
		
		
		//회원=1 비회원=2 로 구분
		if ("M1".equals(codeNum)) {
			dto.setPayLv("1");
		} else {
			dto.setPayLv("2");
		}
		
		String payCk = dto.getPayMTHD();
		String userChk = ucDto.getUserChk();
	    
		
		if("2".equals(payCk) && "N".equals(userChk)) {
			model.addAttribute("msg", "비회원은 포인트 후원이 불가능합니다. ");
			return "donationPage";
		}
		/*****************가입전 포인트 확인 후 ptupdate*****************/
		if ("2".equals(payCk)) {

			int pt = 0;
			MbrDto mbrDto = new MbrDto();

			mbrDto = mbrMEBC.mbrPaySltOne(dto.getUserCode());

			int mbrPt = mbrDto.getPoint();
			int payPt = dto.getDntMny();

			//사용할 포인트가 현재포인트 보다 높을시 실행
			if (mbrPt == -1 || mbrPt < payPt) {
				model.addAttribute("msg", "포인트가 부족합니다.");
				return "donationPage";
			}
			//현재포인트 - 사용포인트 실행
			if (mbrDto != null) {
				pt = mbrPt - payPt;
			}

			mbrDto.setPoint(pt);
			
			//mbr Update 수행
			mbrMEBC.ptUpdate(mbrDto);
			
			/*****************포인트 이력 insert*****************/
			PtHistDto ptDto = new PtHistDto();
			ptDto.setMbrCode(codeNum);

			//db에 최대값 +1 조회
			int maxSeq = sqDao.ptSeqMax2() + 1;
			ptDto.setPtSeq(Integer.toString(maxSeq));

			//날짜 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar c1 = Calendar.getInstance();
			String strToday = sdf.format(c1.getTime());

			ptDto.setPtDate(strToday);
			ptDto.setPtLog("후원");
			ptDto.setUsePt(payPt);
			ptDto.setSavePt(0);

			System.out.println(ptDto.toString());

			//사용포인트 이력 insert
			sqDao.ptInsert(ptDto);
		}
//      ------------------------------------
		//결제 insert
        payMEBC.payInsert(dto);
        //결제 내역 insert
        DonationDto donDto = new DonationDto(); //후원 내역 시작
        donDto.setDntNum(dto.getDntNum());
        donDto.setDntMny(dto.getDntMny());
		donDto.setDntCode(dto.getPayMTHD());
		
		//결제내역 insert
		dntDao.dntInsertHist(donDto);
        return "redirect:dntDetailsPage.do";
		//insert 처리 후 다건조회 화면을 띄우려고 할 때, 다건조회 svc를 불러야 함.
		
	}
	/**************비회원 결제 전 정보를 session에 저장*****************/
	@Override
	public String nMbrInsert(NMbrDto dto, Model model, HttpServletRequest request, HttpSession session) {
		
		
		session.setAttribute("code", dto.getnMbrCode());
		session.setAttribute("name", dto.getNmName());
		session.setAttribute("tel",  dto.getNmTel());
		
		
		
		return "donationPage";
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
