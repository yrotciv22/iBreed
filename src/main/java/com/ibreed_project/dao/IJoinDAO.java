package com.ibreed_project.dao;

import com.ibreed_project.model.AccountVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IJoinDAO {

    public boolean joinCommit(AccountVO vo);
    boolean diaryCommit(AccountVO vo);
    int checkIdDuplicate(String id);
    int checkNicknameDuplicate(String nickname);
    int checkEmailDuplicate(String email);



}
