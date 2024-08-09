package com.ibreed_project.controller;

import com.ibreed_project.model.JoinVO;
import com.ibreed_project.service.IJoinService;
import com.ibreed_project.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JoinController {

    @Autowired
    private IJoinService joinService;

    @RequestMapping("/join")
    public String join() {
        return "account/join";
    }

    @RequestMapping("/join/commit")
    public String joinCommit(@ModelAttribute JoinVO vo) {
        boolean result = joinService.joinCommit(vo);
        return "<script>alert('회원 가입이 완료되었습니다.')</script>";
    }


    @RequestMapping("/join/idCheck")
    public String idCheck(@RequestParam String account) {
        //서비스 연결 오네가이 시마수ㅡ

        //if로 제대로 처리하면 안내
        return "account/join";
    }

    @RequestMapping("/join/nicknameCheck")
    public String nicknameCheck(@RequestParam String account) {
        //서비스 연결 오네가이 시마수ㅡ

        //if로 제대로 처리하면 안내
        return "account/join";
    }
}
