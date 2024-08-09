package com.ibreed_project.controller;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.service.IJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {

    @Autowired
    private IJoinService joinService;

    @RequestMapping("/join")
    public String join() {
        return "account/join";
    }

    @RequestMapping("/join/commit")
    @ResponseBody
    public String joinCommit(@ModelAttribute AccountVO vo) {
        try {
            boolean result = joinService.joinCommit(vo);
            if(result) {
                System.out.println("성공");
                return "<script>alert('회원 가입이 완료되었습니다.')</script>";
            } else {
                System.out.println("실패");
                return "<script>alert('회원 가입에 실패하였습니다. 다시 시도해 주십시오.')</script>";
            }
        } catch (Exception e) {
            System.err.println("회원 가입 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return "<script>alert('회원 가입 중 오류가 발생하였습니다. 다시 시도해 주십시오.')</script>";
        }
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
