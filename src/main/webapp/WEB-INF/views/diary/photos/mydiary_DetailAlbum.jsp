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
	<script src="<c:url value='/js/mydiary_home.js'/>"></script>
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
					
						<form id="uploadProfileImgForm"
							  action="/mydiary/${sessionScope.user_id}/insertPhoto/${album_id}" method="post"
							  enctype="multipart/form-data">
							 
							
							<input type="file" id="fileInput" name="diary_profile_image" accept="image/*"
									onchange="previewImage(event)" />
							<div id="modalBox">
								<div id="modal">
									<div id="modal_body">
										<input id="preview" type="image" src="/image/14_1.jpg"/>
										<input type="submit" value="첨부하기" />
										<input id="modal_noBtn" type="reset" value="취소"/>
									</div>
								</div>
							</div>
						</form>
								
								
					</div>
					<div id="albumResultBox">
						<ul>
							<c:forEach items="${photoList}" var="photo" varStatus="status">
								<li>
									<div class="albumBox">
										<div class="photoCheck"><input type="checkbox" class="chk"></div>
										<img class="album_thimbnail" src="${photo.photo_path}">
									</div>
									<div id="menu" class="menu">
										<ul>
											<li><a class="detailBtn">👁️‍🗨️미리보기</a></li>
											<li><a>📥내려받기</a></li>
											<li><a class="deleteBtn" name="photoNum" data-photoNum="${photo.photo_id}" data-albumId="${album_id}">🗑️삭제</a></li>
											<li><a>🗂️폴더이동</a></li>
											<li><a>📚굿즈 만들기</a></li>
											<li><a>📖상세정보</a></li>
											<li><a class="setCoverBtn" data-photoId="${photo.photo_id}" data-coverImg="${photo.photo_path}" data-albumId="${album_id}" href="#">🖼️앨범커버 지정</a></li>
										</ul>
									</div>
								</li>
								<form id="detail_photo" name="detail_photo">
									<div class="modal detail_modal">
										<span class="xBtn">✕</span>
										<input type="image" class="detail_image" src="${photo.photo_path}">
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
