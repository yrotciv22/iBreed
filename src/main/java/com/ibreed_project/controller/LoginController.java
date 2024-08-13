package com.ibreed_project.controller;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.service.FindAccountService;
import com.ibreed_project.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.UUID;

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
            session.setAttribute("user_timestamp", user_id.getUser_timestamp());
            model.addAttribute("loginSuccess", true);
            System.out.println("로그인 성공");
            System.out.println(session.getAttribute("user_id"));
            System.out.println(session.getAttribute("user_nickname"));
            System.out.println(session.getAttribute("user_rate"));
            System.out.println(session.getAttribute("user_timestamp"));
            return "account/loginResult";
        } else {
            model.addAttribute("loginSuccess", false);
            System.out.println("로그인 실패");
            return "account/loginResult";
        }
    }


    //아이디 비밀번호 찾기

    @Autowired
    private FindAccountService IFindAccountService;

    @Autowired
    private JavaMailSender mailSender;

    // 아이디 찾기 폼
    @GetMapping("/join/idcheck")
    public String showFindIdForm() {
        return "account/find-id";
    }

    // 아이디 찾기 처리
    @PostMapping("/find-id")
    public String findId(@RequestParam("email") String email, Model model) {
        AccountVO user = IFindAccountService.findByEmail(email);
        System.out.println("user : " + user.getUser_id());
        System.out.println("user : " + user.getUser_email());
        if (user == null) {
            model.addAttribute("error", "No account associated with this email.");
            return "account/find-id";
        }
        model.addAttribute("username", user.getUser_id());
        return "account/show-id";
    }

    // 비밀번호 재설정 링크 요청 폼
    @GetMapping("/join/nicknamecheck")
    public String showResetPasswordForm() {
        return "account/reset-password";
    }

    // 비밀번호 재설정 링크 요청 처리
    @PostMapping("/reset-password")
    public String resetPassword(HttpServletRequest request, @RequestParam("email") String email, Model model) {
        AccountVO user = IFindAccountService.findByEmail(email);
        if (user == null) {
            model.addAttribute("error", "No account associated with this email.");
            return "account/reset-password";
        }

        String token = UUID.randomUUID().toString();
        IFindAccountService.updateResetToken(token, email);

        String resetUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/reset-password-form?token=" + token;
        String subject = "Password Reset Request";
        String text = "Click the link to reset your password: " + resetUrl;

        sendEmail(email, subject, text);

        model.addAttribute("message", "A reset link has been sent to your email.");
        return "account/reset-password";
    }

    // 비밀번호 재설정 폼
    @GetMapping("/reset-password-form")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        System.out.println("컨트롤러 토큰값 진입 시작 : " + token);
        AccountVO user = IFindAccountService.findByResetToken(token);
        System.out.println("Token Expiration: " + user.getToken_Expiration());
        if (user == null || user.getToken_Expiration().isBefore(LocalDateTime.now())) {
            model.addAttribute("error", "Invalid or expired token.");
            return "account/reset-password";
        }
        model.addAttribute("token", token);
        return "account/reset-password-form";
    }

    // 비밀번호 재설정 처리
    @PostMapping("/reset-password-form")
    public String processResetPassword(@RequestParam("token") String token, @RequestParam("password") String password, Model model) {
        AccountVO user = IFindAccountService.findByResetToken(token);
        if (user == null) {
            model.addAttribute("error", "Invalid token.");
            return "account/reset-password";
        }

        IFindAccountService.updatePassword(user.getUser_email(), password);
        model.addAttribute("message", "Password successfully reset.");
        return "account/login";
    }

    // 이메일 전송 메서드
    private void sendEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        message.setFrom("ibreed003@gmail.com"); // 발신자 이메일 주소

        mailSender.send(message);
    }

}
