<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>앨범</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/album/mydiary_detail_photos.css' />" />
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/album_main.js'/>"></script>
	<script src="<c:url value='/js/albumSearch.js'/>"></script>
	<script src="<c:url value='/js/arrangeAlbum.js'/>"></script>
	<script src="<c:url value='/js/albumCheck.js'/>"></script>
	<script src="<c:url value='/js/detail_photo.js'/>"></script>
	<script src="<c:url value='/js/imageFileUpload.js'/>"></script>
	<script>const userId = "${sessionScope.user_id}"</script>
</head>
<body>
 
<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">
				<div id="wrap">
					<div id="topBox">
						<div id="title">
							<a href="/mydiary/${user_id}/photos"><h3>전체앨범</h3></a> >
							<h3>${album_name}</h3>
						</div>
					</div>
					<div id="middleBox">
						<div id="upload">
							<div class="allBtn btn"><input type="checkbox" class="allCheck" name="check"></div>
							<form id="imageFileFrm">
								<!-- <button id="uploadBtn" class="upBtn btn">⏫올리기</button> -->
								<input type="file" id="uploadFile" class="upBtn btn"  value="⏫올리기">
								<input type="submit" value="업로드">
							</form><br>
							<button id="albumDeleteBtn" class="btn">삭제</button>
						</div>
						<div id="ctrl">
							<form>
								<select>
									<option value="latest" selected/>생성일 - 최신순
									<option value="old" />생성일 - 오래된 순
								</select>
							</form>					
						</div>
					</div>
					<div id="albumResultBox">
						<ul>
							<c:forEach items="${photoList}" var="photo" varStatus="status">
								<li>
									<div class="albumBox">
										<div class="photoCheck"><input type="checkbox" class="chk"></div>
										<img class="album_thimbnail" src="/image/${photo.photo_name}">
									</div>
									<div id="menu" class="menu">
										<ul>
											<li><a class="detailBtn">👁️‍🗨️미리보기</a></li>
											<li><a>📥내려받기</a></li>
											<li><a class="deleteBtn"  data-del="${status.index}">🗑️삭제</a></li>
											<li><a>🗂️폴더이동</a></li>
											<li><a>📚굿즈 만들기</a></li>
											<li><a>📖상세정보</a></li>
											<li><a class="setCoverBtn" data-photoId="${photo.photo_id}" data-coverImg="${photo.photo_name}" href="#">🖼️앨범커버 지정</a></li>
										</ul>
										<input type="hidden" id="photo_id" value="${photo.photo_id}">
										<input type="hidden" id="photo_name" value="${photo.photo_name}">
									</div>
								</li>
								<form id="detail_photo" name="detail_photo">
									<div class="modal detail_modal">
										<span class="xBtn">✕</span>
										<input type="image" class="detail_image" src="/image/${photo.photo_name}">
									</div>
								</form>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		

	<!-- 공통 layout 다이어리 우측 탭 -->
	<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
