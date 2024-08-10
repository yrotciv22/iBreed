package com.ibreed_project.service;

import com.ibreed_project.model.AccountVO;

public interface IJoinService {
    public boolean joinCommit(AccountVO vo);
    boolean isIdDuplicate(String id);
    boolean isNicknameDuplicate(String nickname);
    boolean isEmailDuplicate(String email);



}
