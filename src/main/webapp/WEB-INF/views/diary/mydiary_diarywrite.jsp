<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary Write</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_layout.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/diary/mydiary_diarywrite.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/mydiary_diarywrite.js' />"></script>
</head>
<body>
	<div class="all">
		<div class="diary_wrap">

			<div class="diary_content">
				<form action="/mydiary/diarywrite" method="post"
					enctype="multipart/form-data" class="diary_form">
					<div>
						<label for="category">카테고리</label> <select id="category"
							name="category">
							<option value="임신">임신</option>
							<option value="출산">출산</option>
							<option value="육아">육아</option>
							<option value="산모">산모</option>
						</select>
					</div>

    

					<div class="file-upload-buttons">
						<button type="button" id="image-upload-btn">사진</button>
						<button type="button" id="video-upload-btn">동영상</button>
						<button type="button" id="link-upload-btn">링크</button>
					</div>
					
					<!-- 숨겨진 파일 업로드 input 요소들 -->
					<input 
						type="file" id="image-upload" name="image-upload"
						class="file-input" style="display: none;">
				    <input
						type="file" id="video-upload" name="video-upload"
						class="file-input" style="display: none;">

					<!--링크팝업  -->
					<div id="link-popup" class="popup">
						<div class="popup-content">
							<span class="close-btn">&times;</span> 
							<label for="link-input">링크를 입력하세요:</label> 
							<input type="text" id="link-input" placeholder="URL을 입력하세요">
							<button type="button" id="confirm-link">확인</button>
						</div>
					</div>


					<div class="input-group">
						<input type="text" placeholder="제목" name="title"
							class="diary-title">
					</div>
					<div id="content-area" class="content-area" contenteditable="true">
					 
					</div>


					<!-- 공개 설정 -->
					<div class="diary_visibility">
						<label><input type="radio" name="privacy" value="전체공개">전체공개</label> 
						<label><input type="radio" name="privacy" value="친구공개"> 친구공개</label> 
						<label><input type="radio" name="privacy" value="비공개"> 비공개</label>
					</div>

					<div class="diary_buttons">
					    <div class="diary_buttons-left">
					        <button type="button" class="save-button">임시 저장</button>
					        <button type="button" class="submit-button">등록하기</button>
					    </div>
					    <div class="diary_buttons-right">
					        <button type="button" class="cancel-button" onclick="location.href='/mydiary/diary'">목록으로</button>
					    </div>
					</div>
					<!--임시저장인지아닌지 구분학;  -->
					<input type="hidden" id="diary_upload_status" name="diary_upload_status" value="true">
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />
	</div>
</body>
</html>
