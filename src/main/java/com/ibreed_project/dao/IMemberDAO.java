package com.ibreed_project.dao;

import com.ibreed_project.model.AccountVO;

public interface IMemberDAO {
    AccountVO getMemberData(String user_id);
    public boolean joinCommit(AccountVO vo);

}
