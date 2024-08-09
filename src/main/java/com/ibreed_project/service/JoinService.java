package com.ibreed_project.service;

import com.ibreed_project.dao.IJoinDAO;
import com.ibreed_project.dao.ILoginDAO;
import com.ibreed_project.model.JoinVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class JoinService implements IJoinService{

    @Autowired
    @Qualifier("ILoginDAO")
    private IJoinDAO joinDAO;

    @Override
    public boolean joinCommit(JoinVO vo) {
        //여기에 실질적으로 작업 해야 하는 내용을 다 넣으면됩니다.
        return joinDAO.joinCommit(vo);
    }
}
