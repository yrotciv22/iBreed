package com.ibreed_project.service;

import com.ibreed_project.model.AccountVO;

public interface IFindAccountService {
    AccountVO findByUsername(String username);
    AccountVO findByEmail(String email);
    void updateResetToken(String token, String email);
    AccountVO findByResetToken(String token);
    void updatePassword(String email, String password);
}
