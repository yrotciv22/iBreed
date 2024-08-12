package com.ibreed_project.service;

import com.ibreed_project.dao.IFindAccountDAO;
import com.ibreed_project.model.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class FindAccountService implements IFindAccountService {

    @Autowired
    private IFindAccountDAO IFindAccountDAO;

    @Override
    public AccountVO findByUsername(String username) {
        return IFindAccountDAO.findByUsername(username);
    }

    @Override
    public AccountVO findByEmail(String email) {
        System.out.println("email : " + email);
        return IFindAccountDAO.findByEmail(email);
    }

    @Override
    public void updateResetToken(String token, String email) {
        System.out.println("저장 토큰 값 : " + token);
        IFindAccountDAO.updateResetToken(token, email);
    }

    @Override
    public AccountVO findByResetToken(String token) {
        System.out.println("리셋 토큰 값 : " + token);
        return IFindAccountDAO.findByResetToken(token);
    }

    @Autowired
    private PasswordEncoder passwordEncoder; // BCryptPasswordEncoder가 주입됨

    @Override
    public void updatePassword(String email, String password) {
        String encodedPassword = passwordEncoder.encode(password); // 암호화
        IFindAccountDAO.updatePassword(email, encodedPassword); // 암호화된 비밀번호 저장
    }
}
