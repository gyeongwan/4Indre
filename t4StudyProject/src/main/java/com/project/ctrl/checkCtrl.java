package com.project.ctrl;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MbrDto;
import com.project.svc.IMyPageSvc;

@Controller
public class checkCtrl {
	@Autowired
	private IMyPageSvc svc;
	
	@RequestMapping(value="IdChkCtrl.do", produces="application/text;charset=UTF-8",
					method=RequestMethod.GET)
	@ResponseBody
	public String idChkGet(@ModelAttribute MbrDto dto) {
		MbrDto nDto = svc.checkId(dto);
		
		boolean result = false;
		if (nDto == null) {
			result = true;
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
	
	@RequestMapping(value="NickChkCtrl.do", produces="application/text;charset=UTF-8",
			method=RequestMethod.GET)
	@ResponseBody
	public String nickChkGet(@ModelAttribute MbrDto dto) {
		MbrDto nDto = svc.checkNick(dto);
		
		boolean result = false;
		if (nDto == null) {
			result = true;
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		System.out.println("====" + jsonOut);
		
		return jsonOut;
	}
}