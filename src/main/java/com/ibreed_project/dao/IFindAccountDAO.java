package com.ibreed_project.dao;

import com.ibreed_project.model.AccountVO;
import org.apache.ibatis.annotations.Param;

public interface IFindAccountDAO {
    AccountVO findByUsername(String username);
    AccountVO findByEmail(String email);
    void updateResetToken(String token, String email);
    AccountVO findByResetToken(String token);
    void updatePassword(String email, String password);
}
