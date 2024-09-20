package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.CommentVO;
import com.ibreed_project.service.ICommentService;

@Controller
@RequestMapping("/community/post")
public class CommentController {
    @Autowired
    private ICommentService commentService;
    

    // 댓글 추가

    @ResponseBody
    @PostMapping("/comment/add")
    public String addComment(@RequestParam HashMap<String, Object> map) {
        String commentSecret = (String) map.get("comment_secret");

        // comment_secret이 null이면 0으로 설정 (공개 댓글)
        if (commentSecret == null || commentSecret.trim().isEmpty()) {
            map.put("comment_secret", "0");
        }


    	   commentService.addComment(map);
        return "success"; // AJAX 요청에 대한 응답
    }



    // 특정 게시글의 댓글 목록 조회
    @GetMapping("/{postId}")
    public List<CommentVO> getCommentsByPostId(@PathVariable int postId) {
        return commentService.selectCommentsByPostId(postId);
    }

    // 댓글 수정
    @ResponseBody
    @RequestMapping("/comment/update")
    public String updateComment( CommentVO commentVO) {
        commentService.updateComment(commentVO);
        return "suceess";
    }

    // 댓글 삭제
    @ResponseBody
    @DeleteMapping("/comment/delete/{commentId}")
    public String deleteComment(@PathVariable("commentId") int commentId) {
    	System.out.println("Comment ID: " + commentId);
        commentService.deleteComment(commentId);
        return "suceess!";
    }
    
}
