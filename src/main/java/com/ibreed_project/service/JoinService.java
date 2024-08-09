package com.ibreed_project.service;

import com.ibreed_project.dao.IJoinDAO;
import com.ibreed_project.model.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class JoinService implements IJoinService{

    @Autowired
    @Qualifier("IJoinDAO")
    private IJoinDAO joinDAO;

    //패스워드 인코더
    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public boolean joinCommit(AccountVO vo) {
        //여기에 실질적으로 작업 해야 하는 내용을 다 넣으면됩니다.
        System.out.println("조인 커밋 진입 성공");
        vo.setUser_password(passwordEncoder.encode(vo.getUser_password()));
        vo.setUser_timestamp(new Date());
        return joinDAO.joinCommit(vo);
    }
}
