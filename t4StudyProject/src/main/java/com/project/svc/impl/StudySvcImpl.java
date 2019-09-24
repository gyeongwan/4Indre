package com.project.svc.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.project.dao.IDaoSeqMEBC;
import com.project.dao.IDaoStudyMEBC;
import com.project.dao.IDaoStudyQEBC;
import com.project.dto.CtnDto;
import com.project.dto.MbrDto;
import com.project.dto.PtHistDto;
import com.project.dto.StdHistDto;
import com.project.svc.IStudySvc;

@Service("stdSvc")
public class StudySvcImpl implements IStudySvc {
	
	@Autowired
	private IDaoStudyQEBC stdMDao;	//multi
	@Autowired	
	private IDaoStudyMEBC stdSDao;	//single
	@Autowired
	private IDaoSeqMEBC sqDao;
	
	@Override
	public void stdSltMulti(Model model) throws ParseException {
		
		String param = "ST";

		ArrayList<CtnDto> list = stdMDao.stdSltMulti(param);
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/mm/dd");
	
		for(int i=0; i<list.size(); i++) {
			CtnDto dto = list.get(i);
			Date date = beforeFormat.parse(dto.getCtnDate());
			String transDate = afterFormat.format(date);
			dto.setCtnDate(transDate);
		}
		
		int cnt = list.size();
		
		model.addAttribute("LIST", list);
		model.addAttribute("CNT", cnt);
	}
	
	@Override
	public void smSltMulti(Model model) throws ParseException {
		
		String param = "KO";

		ArrayList<CtnDto> list = stdMDao.smSltMulti(param);
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/mm/dd");
	
		for(int i=0; i<list.size(); i++) {
			CtnDto dto = list.get(i);
			Date date = beforeFormat.parse(dto.getCtnDate());
			String transDate = afterFormat.format(date);
			dto.setCtnDate(transDate);
		}
		
		int cnt = list.size();
		
		model.addAttribute("LIST", list);
		model.addAttribute("CNT", cnt);
	}

	@Override
	@Transactional
	public String insertPt(Model model, HttpServletRequest request, HttpSession session) {

		try {
			
			String mbrCode = (String)session.getAttribute("userCode");

			int maxSeq = stdSDao.stdSeqMax(mbrCode) + 1;
			
			String ctnCode = request.getParameter("ctnCode");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        Calendar c1 = Calendar.getInstance();
	        String strToday = sdf.format(c1.getTime());
			
			int stdPoint = stdSDao.sltPoint(ctnCode);
			
			// 1. 학습 기록 insert
			StdHistDto dto = new StdHistDto();
			dto.setMbrCode(mbrCode);
			dto.setStdSeq(Integer.toString(maxSeq));
			dto.setCtnCode(ctnCode);
			dto.setStdDate(strToday);
			dto.setStdPoint(stdPoint);
			
			if (stdSDao.insStdHist(dto) == 1) {
				// 2. 포인트 기록 insert
				int pMaxSeq = sqDao.ptSeqMax(dto.getMbrCode()) + 1;
				
				PtHistDto ptDto = new PtHistDto();
				ptDto.setMbrCode(mbrCode);
				ptDto.setPtSeq(Integer.toString(pMaxSeq));
				ptDto.setPtDate(strToday);
				ptDto.setPtLog("학습 포인트 증정");
				ptDto.setUsePt(0);
				ptDto.setSavePt(stdPoint);
				
				if (stdSDao.insPtHist(ptDto) == 1) {
					// 3. 회원 정보 수정
					MbrDto mbrDto = new MbrDto();
					mbrDto.setMbrCode(mbrCode);
					mbrDto.setPoint(stdPoint);
					stdSDao.updateP(mbrDto);
				}
			}			
			
			return "endStudy";
			
		} catch (Exception e) {}
		
        return "ErrorM";
	}

}