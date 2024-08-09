package com.ibreed_project.dao;

import com.ibreed_project.model.AccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ILoginDAO {

    AccountVO findById(String id);


}
