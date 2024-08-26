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
										<li><a>🖼️앨범커버 지정</a></li>
									</ul>
								</div>
							</li>
							<%-- <div id="modalBox">
								<form method="post" action="<c:url value='/album/deleteAlbum/${album.album_id}'/>">
									<div class="modal delete_modal">
										<div class="modal_body delete_body">
											<span class="xBtn">✕</span>
											<img class="warningImg" src="/image/warning.png">
											<strong>${photo.photo_name} 앨범을 삭제하시겠습니까?</strong>
											<p>앨범 삭제 시<br>사진 파일도 함께 삭제됩니다.</p>
											<button id="album_deleteBtn" class="modal_okBtn okBtn">확인</button>
											<input class="modal_noBtn noBtn" type="reset" value="취소" />
										</div>
									</div>
								</form>
								
								<form method="post" action="<c:url value='/album/updateAlbum'/>">
									<div class="modal change_modal">
										<div class="modal_body change_body">
											
											<span class="xBtn">✕</span>
											<strong>이름 바꾸기</strong>
											<input type="text" class="change_text" name="album_name" value="${photo.photo_name}">
											<input type="hidden" name="album_id" value="${photo.photo_id}">
											<button class="modal_okBtn okBtn2">확인</button>
											<input id="album_changeBtn" class="modal_noBtn noBtn2" type="reset" value="취소" />
										</div>
									</div>
								</form>
							</div> --%>
							
							<form id="detail_photo" name="detail_photo">
								<div class="modal detail_modal">
									<span class="xBtn">✕</span>
									<input type="image" class="detail_image" src="/image/${photo.photo_name}">
								</div>
							</form>
						</c:forEach>
					</ul>
					
				</div>
					<!-- <form id="album_Add" name="albumAdd">
						<div class="modal add_modal">
							<div class="modal_body add_body">
								<span class="xBtn">✕</span>
								<strong>새 앨범 만들기</strong>
								<input type="text" id="update_text" placeholder=" 앨범명을 입력해주세요" name="album_name">
								<p>앨범 생성 후 사진을 넣어주세요.</p>
								<input type="submit" class="modal_okBtn okBtn3" value="확인">
								<input id="album_changeBtn" class="modal_noBtn noBtn3" type="reset" value="취소" />
							</div>
						</div>
					</form> -->
					
				</div>
				
			</div>
		</div>
		

	<!-- 공통 layout 다이어리 우측 탭 -->
	<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
