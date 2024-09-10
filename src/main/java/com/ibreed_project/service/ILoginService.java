package com.ibreed_project.service;

import com.ibreed_project.model.AccountVO;

public interface ILoginService {
    AccountVO loginCheck(String id, String password);
    
    public String getNickName(String user_id);
    public String getRating(String user_id);
}
