package com.ibreed_project.controller;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String login() {
        return "account/login";
    }


    @Autowired
    private LoginService loginService;


    @PostMapping("/login/check")
    public String login(@RequestParam("user_id") String id, @RequestParam("user_password") String password, HttpSession session, Model model) {
        AccountVO user_id = loginService.loginCheck(id, password);
        if (user_id != null) {
            session.setAttribute("user_id", user_id.getUser_id());
            session.setAttribute("user_nickname", user_id.getUser_nickname());
            session.setAttribute("user_rate", user_id.getUser_rate());
            model.addAttribute("loginSuccess", true);
            System.out.println("로그인 성공");
            System.out.println(session.getAttribute("user_id"));
            System.out.println(session.getAttribute("user_nickname"));
            System.out.println(session.getAttribute("user_rate"));
            return "account/loginResult";
        } else {
            model.addAttribute("loginSuccess", false);
            System.out.println("로그인 실패");
            return "account/loginResult";
        }
    }

}
