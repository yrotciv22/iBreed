package com.ibreed_project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ibreed_project.model.Mydiary_diaryVO;

@Mapper
public interface IMydiary_diaryDAO {
	void insertDiary(Mydiary_diaryVO diary);
    void updateDiary(Mydiary_diaryVO diary);
    Mydiary_diaryVO getDiaryById(@Param("diaryPostId") int diaryPostId);
    @Select("SELECT diary_id FROM diary WHERE user_id = #{userId}")
    int findDiaryIdByUserId(String userId);
}
