package com.project.svc.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dao.IDaoMbrMEBC;
import com.project.dao.IDaoMyPageQEBC;
import com.project.dao.IDaoSeqMEBC;
import com.project.dto.MbrDto;
import com.project.dto.PtHistDto;
import com.project.dto.StdHistDto;
import com.project.svc.IMyPageSvc;

@Service("svc")
public class MyPageSvcImpl implements IMyPageSvc {
	
	@Autowired
	private IDaoMyPageQEBC mbrMDao;	//multi
	@Autowired	
	private IDaoMbrMEBC mbrSDao;	//single
	@Autowired
	private IDaoSeqMEBC sqDao;
	
	/**************login***************/
	@Override
	public String loginCheck(MbrDto dto, Model model, HttpSession session) {
		
		String viewPage = null;
		
		dto.setMbrState('Y');
		
		// 해당 아이디와 비밀번호가 있는지, 그리고 회원상태가 'Y'인지 check
		MbrDto dbDto = mbrSDao.mbrCheck(dto);
		
		if (dbDto != null) {

			session.setAttribute("userId", dbDto.getId());
			session.setAttribute("userCode", dbDto.getMbrCode());
			session.setAttribute("userName", dbDto.getName());
			session.setAttribute("userNick", dbDto.getNickname());
			
			Object obj = session.getAttribute("userName");
			String userName = (String)obj;
			model.addAttribute("redirectMsg", userName + " 님 환영합니다!");
			viewPage = "homeLogin";
			
		}
		else {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해 주세요.");
			viewPage = "login";
			return viewPage;
		}	
		return viewPage;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public String searchPw(MbrDto dto, Model model, HttpServletRequest request) {
		String viewPage = null;
		
		String email = dto.getEmail() + "@" + request.getParameter("url");
		dto.setEmail(email);
		
		// 1. 해당 아이디와 이메일 or 전화번호가 회원목록에 존재하는지 검색
		MbrDto dbDto = mbrSDao.searchMbr(dto);
		
		if (dbDto != null) {
			
			// 2. 임시 비밀번호를 생성
			int cnt = 8;
			StringBuffer strPwd = new StringBuffer();			
			Random rnd = new Random();
			for (int i = 0; i < cnt; i++) {
				if (rnd.nextBoolean()) {
					strPwd.append((char)((int)(rnd.nextInt(26)) + 97));
				} 
				else {
					strPwd.append((rnd.nextInt(10)));
				}
			}
			
			// 3. 임시 비밀번호를 회원정보에 저장
			MbrDto newDto = new MbrDto();
			newDto.setMbrCode(dbDto.getMbrCode());
			newDto.setPassword(strPwd.toString());
			
			mbrSDao.updatePw(newDto);
			
			// 4. view에 나타낼 정보 (임시 비밀번호, 변경한 시간)
			Date date = Calendar.getInstance().getTime();
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			
			model.addAttribute("name", dbDto.getName());
			model.addAttribute("strPwd", strPwd);
			model.addAttribute("now", format.format(date));
			
			viewPage = "searchPwResult";
		}
		else {
			model.addAttribute("msg", "등록된 회원정보가 없습니다.");
			viewPage = "searchPw";
		}
		
		return viewPage;
	}

/*	@Override
	public MbrDto mbrSltOne(MbrDto dto) {
		return mbrSDao.mbrSltOne(dto);
	}*/
	
	// id, 별명 중복확인
	@Override
	public MbrDto checkId(MbrDto dto) {
		return mbrSDao.checkId(dto);
	}

	@Override
	public MbrDto checkNick(MbrDto dto) {
		return mbrSDao.checkNick(dto);
	}

	/**************signUp***************/
	@Override
	@Transactional
	public String mbrInsert(MbrDto dto, Model model, HttpServletRequest request) {
		
		String viewPage = null;
		
		// 1. 회원코드를 신규 발급하기 위해 순번 구하기
		int maxNum = mbrSDao.mbrSeqMax() + 1;
		
		// * 일반회원: M, 비회원: N, 소셜회원: S, 관리자: G
		dto.setMbrCode("M" + maxNum);
		
		System.out.println(dto.toString());
		
		// 2. insert 전 단건조회
		if (mbrSDao.mbrSltOne(dto) == null) {
			
			String email = dto.getEmail() + "@" + request.getParameter("url");
			dto.setEmail(email);
			
			dto.setPoint(1000);		// 회원가입 시 기본 증정
			dto.setMbrState('Y');
			
			// 3. 유저 테이블에 먼저 insert
			mbrSDao.userInsert(dto);
			
			// 4. 회원 테이블에  insert
			mbrSDao.mbrInsert(dto);
			
			// 5-1. 포인트 이력 테이블에 저장하기 위해 dto 생성
			PtHistDto ptDto = new PtHistDto();
			ptDto.setMbrCode(dto.getMbrCode());
			
			int maxSeq = sqDao.ptSeqMax(dto.getMbrCode()) + 1;	// 이력 순번 구하기			
			ptDto.setPtSeq(Integer.toString(maxSeq));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        Calendar c1 = Calendar.getInstance();
	        String strToday = sdf.format(c1.getTime());
			
			ptDto.setPtDate(strToday);				
			ptDto.setPtLog("회원가입 증정");				
			ptDto.setUsePt(0);
			ptDto.setSavePt(1000);

			System.out.println(ptDto.toString());
			
			// 5-2. 포인트 이력 테이블에 insert
			sqDao.ptInsert(ptDto);
			
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			return viewPage = "login";
		}
		else {
			// * 실패했을 경우의 msg 저장
			model.addAttribute("msg", "정보를 다시 확인해 주세요.");
			viewPage = "redirect:/home.jsp";
		}
		
		return viewPage;
	}
	
	/**************myPage First***************/
	@Override
	public String pwCheck(MbrDto dto, Model model, HttpSession session) {
		
		String viewPage = null;
		
		String userId = (String)session.getAttribute("userId");
		dto.setId(userId);
		if (mbrSDao.pwCheck(dto) != null) {
			viewPage = "redirect:myPageInfo.do";
		}
		else {
			model.addAttribute("msg", "비밀번호를 확인해 주세요.");
			viewPage = "myPageFirst";
		}
		return viewPage;
	}
	
	/**************Info***************/
	@Override
	public String sltInfo(MbrDto dto, Model model, HttpSession session) {

		// 1. 회원정보를 읽어오기 위해 회원 code(Pkey) 검색
		String mbrCode = (String)session.getAttribute("userCode");
		dto.setMbrCode(mbrCode);
		
		// 2. 읽어온 회원정보를 dto에 저장
		MbrDto infoDto = mbrSDao.mbrSltOne(dto);
		
		// 3. 해당 dto가 존재한다면 정보를 보여 줌
		if (infoDto != null) {
			
			// 3-1. 전화번호와 이메일은 선택값이므로 존재할 때 저장
			String tel   = infoDto.getTel();
			String email = infoDto.getEmail();
			
			if (tel != null) {
				String phone1 = tel.substring(0, tel.length()-8);
				String phone2 = tel.substring(tel.length()-8, tel.length()-4);
				String phone3 = tel.substring(tel.length()-4, tel.length());
				
				model.addAttribute("phone1", phone1);
				model.addAttribute("phone2", phone2);
				model.addAttribute("phone3", phone3);
			}			
			
			if (email != null) {				
				int idx = email.indexOf("@");
				String mail1 = email.substring(0, idx);
				String mail2 = email.substring(idx+1);
				
				model.addAttribute("mail1", mail1);
				model.addAttribute("mail2", mail2);
			}			
			
			model.addAttribute("DTO", infoDto);			
			
			return "myPageInfo";
		}
		else {			
			return "ErrorN";
		}		
	}

	@Override
	public String updateInfo(MbrDto dto, Model model, HttpServletRequest request, HttpSession session) {
		
		String viewPage = null;
		
		String code = (String)session.getAttribute("userCode");
		dto.setMbrCode(code);
		
		MbrDto dbDto = mbrSDao.mbrSltOne(dto);
		
		if (dbDto != null) {
			// 1. 해당 회원정보가 있을 때(단건조회 성공) 수정내역들
			
			// 1-1. 제출한 비밀번호가 맞을 시 정보를 수정할 수 있음
			if (!dbDto.getPassword().equals(dto.getPassword())) {
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				viewPage = "myPageFirst";
				return viewPage;
			}
			
			dto.setMbrCode(dbDto.getMbrCode());
			
			// 1-2. 새 비밀번호 수정
			if (request.getParameter("newPw") != "") {
				String newPw = request.getParameter("newPw");
				dto.setPassword(newPw);
			}			
			// 1-3. 일반전화 수정
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String tel = dto.getTel() + phone2 + phone3;
			dto.setTel(tel);
			
			// 1-4. 이메일 수정
			String email = dto.getEmail() + "@" + request.getParameter("url");
			dto.setEmail(email);
			
			if (request.getParameter("newPw") == null) {
				dto.setPassword(dbDto.getPassword());
			}
			
			// 2. 정보 업데이트
			mbrSDao.updateInfo(dto);
			
			model.addAttribute("msg", "정보가 수정되었습니다.");
			viewPage = "myPageFirst";
		}
		else {
			model.addAttribute("msg", "정보를 다시 확인해 주세요.");
			viewPage = "myPageFirst";
		}
		
		return viewPage;
	}

	@Override
	public String userLeave(MbrDto dto, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		// * 회원 탈퇴는 회원 정보 delete가 아닌 상태를 update
		String viewPage = null;
		
		String userId = (String)session.getAttribute("userId");	//로그인되어 있는 아이디 가져오기
		dto.setId(userId);
		
		// 1. 아이디와 비밀번호 체크
		MbrDto dbDto = mbrSDao.pwCheck(dto);

		// * update전 단건조회
		if (mbrSDao.mbrSltOne(dbDto) != null) {
			
			dto.setMbrCode(dbDto.getMbrCode());
			dto.setMbrState('N');
			
			// 2. 회원상태를 'N'으로 업데이트
			mbrSDao.userLeave(dto);
			logout(session);
			
			redirectAttr.addAttribute("msg", "정상적으로 탈퇴되었습니다.");
			viewPage = "redirect:redirect.do";
		}
		else {
			model.addAttribute("msg", "비밀번호를 다시 확인해 주세요.");
			viewPage = "myPageLeave";
		}
		return viewPage;
	}
	
	/**************MyPoint***************/
	@Override
	public void sltMyPoint(Model model, HttpSession session) {
		
		String mbrCode = (String)session.getAttribute("userCode");
		int intPoint = mbrSDao.sltPoint(mbrCode);
		String strPoint = String.valueOf(intPoint) + "P";
		
		model.addAttribute("strPoint", strPoint);
	}

	@SuppressWarnings("unchecked")
	@Override
	public String ptSltMulti(HttpSession session, String stdt, String eddt, String tab) throws ParseException {

		int usePt = 0;
		int savePt = 0;

		String code = (String)session.getAttribute("userCode");
		
		ArrayList<PtHistDto> list = new ArrayList<PtHistDto>();
		
		// 1. 날짜 검색이 없다면 List를 모두 출력
		if (StringUtils.isEmpty(stdt)) {
			list = mbrMDao.allPtList(code);
		}
		
		// 2. 날짜로 List 검색
		else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("stdt", stdt);
			map.put("eddt", eddt);
			map.put("code", code);
			
			list = mbrMDao.ptSltMulti(map);
		}
		
		String jsonSt = "";		
		JSONArray jArray = new JSONArray();
	
		for (int i=0; i < list.size(); i++) {
			PtHistDto dto = list.get(i);
			JSONObject jsonObject = new JSONObject();
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/mm/dd");
			Date date = beforeFormat.parse(dto.getPtDate());
			String transDate = afterFormat.format(date);
			
			if ("all".equals(tab) || tab == "") {
				jsonObject.put("PtDate", transDate);
				jsonObject.put("PtLog", dto.getPtLog());
				jsonObject.put("UsePt", dto.getUsePt() + "P");
				jsonObject.put("SavePt", dto.getSavePt() + "P");
			}
			else if ("use".equals(tab)) {
				if (dto.getUsePt() == 0) continue;
				jsonObject.put("PtDate", transDate);
				jsonObject.put("PtLog", dto.getPtLog());
				jsonObject.put("UsePt", dto.getUsePt() + "P");
			}
			else if ("save".equals(tab)) {
				if (dto.getSavePt() == 0) continue;
				jsonObject.put("PtDate", transDate);
				jsonObject.put("PtLog", dto.getPtLog());
				jsonObject.put("SavePt", dto.getSavePt() + "P");
			}
			
			jArray.add(jsonObject);
			
			usePt += (int)list.get(i).getUsePt();
			savePt += (int)list.get(i).getSavePt();
		}
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("TotUPt", usePt + "P");
		jsonObject.put("TotSPt", savePt + "P");
		jArray.add(jsonObject);
		
		jsonSt = jArray.toJSONString();
		
		System.out.println(jsonSt);
		
		return jsonSt;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String stdSltMulti(HttpSession session, String stdt, String eddt) throws ParseException {

		int totCnt = 0;
		int totSPt = 0;
		
		String code = (String)session.getAttribute("userCode");
		
		ArrayList<StdHistDto> list = new ArrayList<StdHistDto>();

		if (StringUtils.isEmpty(stdt)) {
			list = mbrMDao.allStdList(code);
		}
		else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("stdt", stdt);
			map.put("eddt", eddt);
			map.put("code", code);
			
			list = mbrMDao.stdSltMulti(map);
		}
		
		String jsonSt = "";		
		JSONArray jArray = new JSONArray();
	
		for (int i=0; i < list.size(); i++) {
			StdHistDto dto = list.get(i);
			JSONObject jsonObject = new JSONObject();
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy/mm/dd");
			Date date = beforeFormat.parse(dto.getStdDate());
			String transDate = afterFormat.format(date);
			
			// 컨텐츠 코드로 컨텐츠명 찾기
			String ctnName = sqDao.sltCtnName(dto.getCtnCode());
			
			jsonObject.put("StdDate", transDate);
			jsonObject.put("StdLog", ctnName);
			jsonObject.put("StdPt", dto.getStdPoint());
			
			jArray.add(jsonObject);
			
			totSPt += (int)list.get(i).getStdPoint();
		}
		
		totCnt = list.size();
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("TotCnt", totCnt + "건");
		jsonObject.put("TotSPt", totSPt + "P");
		jArray.add(jsonObject);
		
		jsonSt = jArray.toJSONString();
		
		System.out.println(jsonSt);
		
		return jsonSt;
	}
	

}