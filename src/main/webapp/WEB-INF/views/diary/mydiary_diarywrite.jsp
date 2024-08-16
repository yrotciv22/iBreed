<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary Diary</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diarywrite.css' />" />
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	
</head>
<body>
 
<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">


			<!-- 각 페이지 작업 구간  -->
			<div class="diary-write-container">
			    <h2>다이어리 작성</h2>
			
			    <form action="/diary/submit" method="post">
			        <label for="title">제목</label>
			        <input type="text" id="title" name="title" required>
			
			        <label for="category">카테고리</label>
			        <select id="category" name="category">
			            <option value="일상">일상</option>
			            <option value="여행">여행</option>
			            <option value="음식">음식</option>
			            <option value="기타">기타</option>
			        </select>
			
			        <label for="editor">내용</label>
			        <div id="editor"></div>
			
			        <input type="file" id="imageUpload" name="imageUpload" accept="image/*">
			        <input type="file" id="videoUpload" name="videoUpload" accept="video/*">
			        <input type="text" id="link" name="link" placeholder="링크를 입력하세요">
			
			        <textarea name="content" style="display:none;" id="editor-content"></textarea>
			        
			        <button type="submit">저장</button>
			    </form>
			</div>


			<!-- 각 페이지 작업 구간 끝  -->


			</div>
		</div>
		

	<!-- 공통 layout 다이어리 우측 탭 -->
	<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>



</body>
</html>