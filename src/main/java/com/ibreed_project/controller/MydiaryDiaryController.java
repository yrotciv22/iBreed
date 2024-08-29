package com.ibreed_project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibreed_project.model.Mydiary_diaryVO;
import com.ibreed_project.service.FriendService;
import com.ibreed_project.service.Mydiary_diaryService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mydiary/{user_id}")
public class MydiaryDiaryController {

    @Autowired
    private Mydiary_diaryService mydiary_diaryService;
    @Autowired
    private FriendService friendService;
    

    // 다이어리 작성 페이지로 이동 (GET 요청)
    @GetMapping("/diarywrite")
    public String view_mydiary_diarywrite(@PathVariable("user_id") String userId, Model model) {
        model.addAttribute("user_id", userId);
        return "diary/mydiary_diarywrite";
    }

//     //일기 리스트 페이지를 조회 (GET 요청)
//    @GetMapping("/diary")
//    public String getDiaryList(@PathVariable("user_id") String userId,
//				                               @RequestParam(value = "page", defaultValue = "1") int page,
//				                               @RequestParam(value = "size", defaultValue = "7") int size,
//				                               Model model,HttpSession session) {
//        
//    	String currentUserId = (String) session.getAttribute("user_id");
//    	System.out.println("getDiaryList method called");
//        System.out.println("User ID: " + userId);
//        System.out.println("Current User ID: " + currentUserId);
//
//
//        // 사용자가 다이어리의 주인인지 여부를 확인
//    //    boolean isOwner = userId.equals(currentUserId);
//
//        // 사용자가 다이어리 주인의 친구인지 여부를 확인 (이 로직은 구현에 따라 다름)
//       // boolean isFriend = /* 여기에 친구 여부를 확인하는 로직을 추가하세요 */;
//
//    	
//    	
//        int offset = (page - 1) * size;
//        Map<String, Object> params = new HashMap<>();
//        params.put("userId", userId);
//        params.put("offset", offset);
//        params.put("size", size);
//
//        // 공개 여부에 따른 일기 목록 가져오기
//   //     List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserIdAndVisibility(userId, currentUserId, (page - 1) * size, size);
//    //    model.addAttribute("diaryList", diaryList);
//        // 일기 목록을 가져옴
//      List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(params);
//      model.addAttribute("diaryList", diaryList);
//      model.addAttribute("user_id", userId);      
//      for(Mydiary_diaryVO diary : diaryList) {
//          System.out.println("Diary User ID: " + diary.getUserId());
//      }//0828null값 나옴 세션에선 가져와지는데 매퍼통햐ㅐ서 받는게 안되고 있는 것 같음.=해결함
//
//        // 전체 일기 수를 가져오기 (페이지 수 계산을 위해 필요)
//        int totalDiaryCount = mydiary_diaryService.getTotalDiaryCountByUserId(userId);
//        int totalPages = (int) Math.ceil((double) totalDiaryCount / size);
//        model.addAttribute("currentPage", page);
//        model.addAttribute("totalPages", totalPages);
//        model.addAttribute("user_id", userId);
//
//        return "diary/mydiary_diary";
//    }
    
    //일기리스트 조회 +공개여부
    @GetMapping("/diary")
    public String getDiaryList(@PathVariable("user_id") String userId,
				                               HttpSession session, 
				                               Model model,
				                               @RequestParam(value = "page", defaultValue = "1") int page,
				                               @RequestParam(value = "size", defaultValue = "7") int size) {
    	
    	   // 로그 추가
        System.out.println("컨트롤러: userId = " + userId);//친구 또는 나 
        System.out.println("컨트롤러: currentUserId = " + session.getAttribute("user_id"));//나
        System.out.println("컨트롤러: page = " + page + ", size = " + size);
        
        
        // 현재 접속한 사용자 ID를 세션에서 가져옴
        String login_user_id = (String) session.getAttribute("user_id");//로그인한사람
        //전달받은 userId와 로그인한  login_user_id 같으면 내거,다르면 친구거
        if(login_user_id .equals(userId)) {
        	userId=login_user_id;      	
        }
        // 다이어리 주인과 현재 접속한 사용자가 같은지 확인
        //boolean isOwner = userId.equals(currentUserId);
        
        // 현재 접속한 사용자가 다이어리 주인의 친구인지 확인
      //  boolean isFriend = friendService.getFriendInfo(currentUserId, userId) != null;

        // 페이지네이션 처리
        int offset = (page - 1) * size;
        int diary_id=0;//친구인경구 0
        //로그인한 user인 경우 user의 다이어리 아이디 (0이아닌값)
        if(userId.equals(login_user_id)) {
        	diary_id= mydiary_diaryService.getDiaryIdByUserId(login_user_id);
        }
        
        
        // 다이어리 리스트를 가져옴 (공개 여부에 따라 필터링)
       // List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserId(params);
        
       HashMap<String, Object> params = new HashMap<>();
      params.put("userId", userId);
      params.put("diary_id", diary_id);
      params.put("offset", offset);
     params.put("size", size);
       List<Mydiary_diaryVO> diaryList = mydiary_diaryService.getDiaryListByUserIdAndVisibility(params);
        
        // 모델에 다이어리 리스트 추가
        model.addAttribute("diaryList", diaryList);
        
        
        // 페이지 정보 추가
        int totalDiaryCount = mydiary_diaryService.getTotalDiaryCountByUserId(userId);
        int totalPages = (int) Math.ceil((double) totalDiaryCount / size);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("user_id", userId);

        return "diary/mydiary_diary";  // JSP 파일 경로
    }



    // 일기 작성하고 데이터를 저장
    @PostMapping("/save")
    public String saveDiary(@PathVariable("user_id") String userId,
				                            Mydiary_diaryVO vo,
				                            HttpSession session,
				                            Model model) throws Exception {

        System.out.println("제대로 일기 작성 데이터로 진입했는지 확인");

        // 사용자 ID 설정
        vo.setUserId(userId);
        if (vo.getDiaryPostId() == 0) { // 새 일기인지 확인
            mydiary_diaryService.saveDiary(vo);
        }else {
        	 mydiary_diaryService.updateDiary(vo);//기존일기 수정 
        }
        
        

        return "redirect:/mydiary/" + userId + "/diary";
    }

    // 다이어리 상세보기 
    @GetMapping("/diarydetail/{diaryPostId}")
    public String viewDiaryDetail(@PathVariable("user_id") String userId,
					                                  @PathVariable("diaryPostId") int diaryPostId,
					                                  Model model,
					                                  HttpSession session) {
    	//다이어리 상세ㅐ정보 가져오기
    	Mydiary_diaryVO diary = mydiary_diaryService.getDiary(diaryPostId);
    	

     
    	// 조회수 증가 로직
        String sessionKey = "viewedPost_" + diaryPostId;
        Boolean isViewed = (Boolean) session.getAttribute(sessionKey);

        if (isViewed == null || !isViewed) {
            mydiary_diaryService.incrementViewCount(diaryPostId);
            session.setAttribute(sessionKey, true);
        }
    

        // 다이어리 정보를 가져와 모델에 추가
        model.addAttribute("diary", diary);
        model.addAttribute("user_id", userId);

        return "diary/mydiary_diarydetail";
    }

    //  일기수정  메서드 
    @GetMapping("/diaryedit/{diaryPostId}")
    public String editDiary(@PathVariable("user_id") String userId,
    									@PathVariable("diaryPostId") int diaryPostId,
    									Model model) {
        Mydiary_diaryVO diary = mydiary_diaryService.getDiary(diaryPostId);
        if (diary == null) {
            model.addAttribute("error", "해당 일기를 찾을 수 없습니다.");
            return "redirect:/mydiary/" + userId + "/diary"; // 또는 에러 페이지로 이동
        }
        model.addAttribute("diary", diary);
        model.addAttribute("user_id", userId); 
      
        return "diary/mydiary_diaryupdate"; // 일기 작성 JSP 페이지로 이동 (수정 모드)
    }
    
    
    // 일기 삭제 메서드 
    @GetMapping("/diarydelete/{diaryPostId}")
    public String deleteDiary(@PathVariable("user_id") String userId,
                              				@PathVariable("diaryPostId") int diaryPostId) {
        mydiary_diaryService.deleteDiary(diaryPostId);
        
        // 삭제 후 일기 리스트 페이지로 리다이렉트
        return "redirect:/mydiary/" + userId + "/diary";
    }
    
   //좋아요 
    @PostMapping("/like")
    @ResponseBody
    public HashMap<String, Object> likePost(@RequestBody HashMap<String, Object> payload) {
        int diaryPostId = (int) payload.get("diaryPostId");
        String userId = (String) payload.get("userId");

        HashMap<String, Object> response = new HashMap<>();

        try {
            // 이미 좋아요를 눌렀는지 확인
            boolean alreadyLiked = mydiary_diaryService.isAlreadyLiked(userId, diaryPostId);

            if (alreadyLiked) {
                // 이미 좋아요를 누른 상태라면 좋아요를 취소
            	mydiary_diaryService.unlikePost(userId, diaryPostId);
            } else {
                // 좋아요 추가
            	mydiary_diaryService.likePost(userId, diaryPostId);
            }

            // 최신 좋아요 수 가져오기
            int newLikeCount = mydiary_diaryService.getLikeCount(diaryPostId);

            response.put("success", true);
            response.put("newLikeCount", newLikeCount);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "좋아요 처리 중 오류가 발생했습니다.");
        }

        return response;
    }
    
    
}
