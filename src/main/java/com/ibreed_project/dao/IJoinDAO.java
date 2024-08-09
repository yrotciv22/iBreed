package com.ibreed_project.dao;

import com.ibreed_project.model.JoinVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IJoinDAO {

    public boolean joinCommit(JoinVO vo);

}
