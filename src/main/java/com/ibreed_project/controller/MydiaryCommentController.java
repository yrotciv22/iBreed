package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.DiaryCommentVO;
import com.ibreed_project.service.IMydiaryCommentService;

@Controller
//@RequestMapping("/mydiary/{user_id}/comments")
public class MydiaryCommentController {
		
	
	@Autowired
    private IMydiaryCommentService mydiaryCommentService;

    // 댓글 추가
	@ResponseBody
    @RequestMapping("/mydiary/comments/add")
    public String addComment(
    											@RequestParam HashMap<String,Object> map) {

   //   System.out.println(map.get("diaryCommentContent"));
    //  System.out.println(map.get("diaryPostId"));
    //  System.out.println(map.get("diaryCommentUserIdWrite"));
			
      mydiaryCommentService.addComment(map);
      
       //return "redirect:/diarydetail/"+diaryPostId;
      return "success";
    }

    // 특정 게시글의 댓글 조회
    @GetMapping("/{diaryPostId}")
    public ResponseEntity<List<DiaryCommentVO>> getCommentsByDiaryPostId(@PathVariable("user_id") String userId, @PathVariable int diaryPostId) {
        List<DiaryCommentVO> comments = mydiaryCommentService.getCommentsByDiaryPostId(diaryPostId);
        return ResponseEntity.ok(comments);
    }

    // 댓글 수정
    @ResponseBody
    @RequestMapping("/mydiary/comments/update")
    public String updateComment(@RequestParam("user_id") String userId, 
											    		@RequestParam("id") int id,
														@RequestParam("diaryCommentContent") String diaryCommentContent) {
    	 
    	
    	 System.out.println("user_id: " + userId);
    	    System.out.println("id: " + id);
    	    System.out.println("diaryCommentContent: " + diaryCommentContent);
    	    
    	DiaryCommentVO comment = new DiaryCommentVO();
        comment.setDiaryCommentUserIdWrite(userId); // 댓글 작성자 ID 설정
        comment.setId(id);          // 댓글 ID 설정
        comment.setDiaryCommentContent(diaryCommentContent); // 새로운 댓글 내용 설정
        mydiaryCommentService.updateComment(comment);
        return "success";
    }

    // 댓글 삭제
    @ResponseBody
    @DeleteMapping("/mydiary/comments/delete/{id}")
    public String deleteComment(//@PathVariable("user_id") String userId, 
    																				@PathVariable ("id")int id) {
//    	 System.out.println("User ID: " + userId);
//    	    System.out.println("Comment ID: " + id);
        mydiaryCommentService.deleteComment(id);
        return "success";
    }
}
