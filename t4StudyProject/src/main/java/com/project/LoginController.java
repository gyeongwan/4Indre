package com.project;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    // 네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {

        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        // 1. 로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;

        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        String userId = (String) response_obj.get("id");
        String userNick = (String) response_obj.get("nickname");
        String userName = (String) response_obj.get("name");

        session.setAttribute("userId", userId);
		session.setAttribute("userNick", userNick);
		session.setAttribute("userName", userName);
		
		model.addAttribute("redirectMsg", userName + " 님 환영합니다!");
        model.addAttribute("result", apiResult);
        
        return "homeLogin";
    }

}