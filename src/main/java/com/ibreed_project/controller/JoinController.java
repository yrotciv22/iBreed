package com.ibreed_project.controller;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.service.IJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class JoinController {

    @Autowired
    private IJoinService joinService;

    //페이지 진입
    @RequestMapping("/join")
    public String join() {
        return "account/join";
    }

    //회원가입 commit
    @RequestMapping("/join/commit")
    @ResponseBody
    public String joinCommit(@ModelAttribute AccountVO vo) {
        try {
            vo.setUser_email(vo.getUser_email() + "@" + vo.getEmailDomain());
            System.out.println("이메일 머지 : " + vo.getUser_email());
            if(vo.isUser_gender()){
                vo.setUser_profile_image("/image/icon-man.png");
            }
            else{
                vo.setUser_profile_image("/image/profile_woman.png");
            }
            boolean result = joinService.joinCommit(vo);
            boolean diaryResult = joinService.diaryCommit(vo);

            if(result && diaryResult) {
                System.out.println("성공");
                return "<script>alert('회원 가입이 완료되었습니다.'); location.href='/';</script>";
            } else {
                System.out.println("실패");
                return "<script>alert('회원 가입에 실패하였습니다. 다시 시도해 주십시오.'); history.back();</script>";
            }
        } catch (Exception e) {
            System.err.println("회원 가입 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return "<script>alert('회원 가입 중 오류가 발생하였습니다. 다시 시도해 주십시오.'); history.back();</script>";
        }
    }



    @GetMapping("/checkId")
    @ResponseBody
    public String checkIdDuplicate(@RequestParam String id) {
        System.out.println("컨트롤러 id 값 : " + id);
        if (joinService.isIdDuplicate(id)) {
            return "duplicate";
        } else {
            return "ok";
        }
    }

    @GetMapping("/checkNick")
    @ResponseBody
    public String checkNicknameDuplicate(@RequestParam String nickname) {
        System.out.println("컨트롤러 닉네임 값 : " + nickname);
        if (joinService.isNicknameDuplicate(nickname)) {
            return "duplicate";
        } else {
            return "ok";
        }
    }

    @GetMapping("/checkEmail")
    @ResponseBody
    public String checkEmailDuplicate(@RequestParam String email) {
        System.out.println("컨트롤러 닉네임 값 : " + email);
        if (joinService.isEmailDuplicate(email)) {
            return "duplicate";
        } else {
            return "ok";
        }
    }


}
