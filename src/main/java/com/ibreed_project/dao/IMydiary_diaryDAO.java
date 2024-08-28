package com.ibreed_project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ibreed_project.model.Mydiary_diaryVO;

public interface IMydiary_diaryDAO {
    
    // 일기 등록
    void insertDiary(Mydiary_diaryVO diary);
    
    // 일기 업데이트
    void updateDiary(Mydiary_diaryVO diary);
    
    // diaryPostId로 일기 가져오기
    Mydiary_diaryVO getDiaryById(@Param("diaryPostId") int diaryPostId);
    
    // userId로 diaryId 가져오기
    @Select("SELECT diary_id FROM diary WHERE user_id = #{userId}")
    int findDiaryIdByUserId(@Param("userId") String userId);
    
    //일기리스트가져오기+페이지네이션
    List<Mydiary_diaryVO> getDiaryListByUserId(Map<String, Object> params);
    
    int getTotalDiaryCountByUserId(@Param("userId") String userId);
    
    //공개에따라 일기보여주는거 
    List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(Map<String, Object> params);
  //  List<Mydiary_diaryVO> getDiaryListByUserIdAndVisibility(@Param("userId") String userId, @Param("isOwner") boolean isOwner, @Param("isFriend") boolean isFriend, @Param("offset") int offset, @Param("size") int size);

//삭제
    void deleteDiary(int diaryPostId);

}
