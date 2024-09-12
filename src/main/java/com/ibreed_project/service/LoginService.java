package com.ibreed_project.service;

import com.ibreed_project.dao.IJoinDAO;
import com.ibreed_project.dao.ILoginDAO;
import com.ibreed_project.model.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService implements  ILoginService{

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    @Qualifier("ILoginDAO")
    private ILoginDAO loginDAO;


    @Override
    public AccountVO loginCheck(String id, String rawPassword) {
        AccountVO user_id = loginDAO.findById(id);
        System.out.println("user_id : " +user_id);
        if (user_id != null && passwordEncoder.matches(rawPassword, user_id.getUser_password())) {
            return user_id;
        } else {
            return null;
        }
    }
    
    @Override
    public String getNickName(String user_id) {
    	return loginDAO.getNickName(user_id);
    }
    @Override
    public String getRating(String user_id) {
    	return loginDAO.getRating(user_id);
    }
}
