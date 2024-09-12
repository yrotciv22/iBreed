package com.ibreed_project.service;

import com.ibreed_project.model.AccountVO;

public interface IMemberService {
    AccountVO getMemberData(String user_id);
    public boolean joinCommit(AccountVO vo);

}
