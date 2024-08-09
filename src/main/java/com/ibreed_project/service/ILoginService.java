package com.ibreed_project.service;

import com.ibreed_project.model.AccountVO;

public interface ILoginService {
    AccountVO loginCheck(String id, String password);
}
