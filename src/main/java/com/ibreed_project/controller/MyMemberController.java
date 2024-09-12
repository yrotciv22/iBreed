package com.ibreed_project.controller;

import com.ibreed_project.model.AccountVO;
import com.ibreed_project.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

@Controller
public class MyMemberController {


    @Autowired
    MemberService memberService;

    @RequestMapping("/mypage/member")
    public String myMember(HttpSession session, Model model) {
        System.out.println("유저 id 값 : " );
        AccountVO vo = memberService.getMemberData((String) session.getAttribute("user_id"));

        // 생년월일을 String 형식으로 변환 (LocalDate 사용 시)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = sdf.format(vo.getUser_birth());
        model.addAttribute("userBirth", formattedDate);


        // 이메일을 @ 기준으로 분리
        String[] emailParts = vo.getUser_email().split("@");
        String emailBeforeAt = emailParts[0];  // @ 앞부분
        String emailDomain = emailParts[1];    // @ 뒷부분

        System.out.println(vo.toString());
        model.addAttribute("member", vo);
        model.addAttribute("emailBeforeAt", emailBeforeAt);
        model.addAttribute("emailDomain", emailDomain);
        return "mypage/mypage_member";
    }



    //이미지 저장

    // 상대 경로 설정 (기본 이미지 저장 경로)
    private static final String BASE_IMAGE_PATH = "/var/lib/jenkins/workspace/ibreed/src/main/resources/static/image";
    @ResponseBody
    @PostMapping("/upload/profile")
    public String uploadProfileImage(@RequestParam("file") MultipartFile file, HttpSession session) {
        if (file.isEmpty()) {
            return "파일을 선택해주세요.";
        }

        // 세션에서 user_id를 가져옴
        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            return "로그인이 필요합니다.";
        }

        // 사용자 폴더 경로: /image/{user_id}/
        String userFolderPath = BASE_IMAGE_PATH + "/";
        File userFolder = new File(userFolderPath);

        // 사용자 폴더가 없으면 생성
        if (!userFolder.exists()) {
            userFolder.mkdirs();
        }

        // 저장할 파일 경로 설정: profile.png
        String filePath = userFolderPath + "userId.png";
        filePath = filePath.replace("\\", "/"); // 백슬래시를 슬래시로 변경
        System.out.println("파일 저장 경로: " + filePath);
        File dest = new File(filePath);

        try {
            // 파일을 지정된 경로에 저장 (덮어쓰기)
            file.transferTo(dest);

            // 웹에서 접근 가능한 URL 경로 반환
            String fileUrl = "/image/userId.png";
            System.out.println("리턴 될 경로 : " +fileUrl );
            return fileUrl;

        } catch (IOException e) {
            e.printStackTrace();
            return "파일 업로드 실패: " + e.getMessage();
        }
    }



    //회원가입 commit
    @RequestMapping("/member/commit")
    @ResponseBody
    public String joinCommit(@ModelAttribute AccountVO vo) {
        try {
            vo.setUser_email(vo.getUser_email() + "@" + vo.getEmailDomain());
            System.out.println("이메일 머지 : " + vo.getUser_email());
            System.out.println("이거 값이 안바뀌었나?? "+ vo.getUser_profile_image());
            boolean result = memberService.joinCommit(vo);

            if (result) {
                System.out.println("성공");
                return "<script>alert('회원 정보 수정이 완료되었습니다.'); location.href='/';</script>";
            } else {
                System.out.println("실패");
                return "<script>alert('회원 정보 수정에 실패하였습니다. 다시 시도해 주십시오.'); history.back();</script>";
            }
        } catch (Exception e) {
            System.err.println("정보 수정 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return "<script>alert('회원 정보 수정 중 오류가 발생하였습니다. 다시 시도해 주십시오.'); history.back();</script>";
        }

    }
}
