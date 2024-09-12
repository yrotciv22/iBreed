package com.ibreed_project.dao;

import com.ibreed_project.model.AccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ILoginDAO {

    AccountVO findById(String id);
    
    // 마이페이지에 닉네임과 회원등급 출력
    public String getNickName(String user_id);
    public String getRating(String user_id);
}
