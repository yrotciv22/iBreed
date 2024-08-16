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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_photos.css' />" />
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/album_main.js'/>"></script>
</head>
<body>
 
<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">
				<div id="wrap">
				<div id="topBox">
					<div id="title">
						<h3>전체앨범</h3>
					</div>
					<div id="search">
						<input type="text" placeholder=" 앨범 제목으로 검색해보세요.">
						<input type="image" src="/image/magnifier.png">
					</div>
				</div>
				<div id="middleBox">
					<div id="upload">
						<div class="allBtn btn"><input type="checkbox" class="allCheck" name="check"></div>
						<button id="uploadBtn" class="upBtn btn">⏫올리기</button>
						<button id="newAlbumBtn" class="btn">새 앨범</button>
					</div>
					<div id="ctrl">
						<select name="turn" id="selectBox">
							<option value="latest" selected/>생성일 - 최신순
							<option value="old" />생성일 - 오래된 순
							<option value="spelling" />이름 - ㄱ-ㅎ(a-z)
							<option value="back_spelling" />이름 - ㅎ-ㄱ(z-a)
						</select>
					</div>
				</div>
				<div>
					<ul>
					<c:if test=""></c:if>
						<c:forEach items="${latestList}" var="album">
							<li>
								<!-- <div class="albumBox" onclick="location.href='/mydiary/album/앨범1'"> -->
								<div class="albumBox">
									<div class="photoCheck"><input type="checkbox" class="chk"></div>
									<img class="album_thimbnail" src="https://mblogthumb-phinf.pstatic.net/MjAyMDA4MDZfMTIg/MDAxNTk2NjkwNjY5OTM0.6ESYhF5_BT3wtos4zBrAbh58xrpbVCoxYm0V_7D-UGIg.nTGkJFqxOCt3BIb-SCscWMWY5IkfUE-Ejwml0xAdZ3Ig.PNG.goms1101/B2C1B4EB.png?type=w800">
									<div class="photoCount">
										<span class="countNum">1</span> <!-- 앨범에 들어가있는 사진이 몇장인지 표시 -->
									</div>
									<strong class="album_title">${album.album_name}</strong>
									<p class="update"><fmt:formatDate value="${album.album_date}" pattern="yyyy-MM-dd" />에 생성됨</p>
								</div>
								<div id="menu">
									<ul>
										<li><a>🖱️열기</a></li>
										<li><a id="deleteBtn">🗑️삭제</a></li>
										<li><a id="changeBtn">이름바꾸기</a></li>
									</ul>
								</div>
							</li>
							<div id="modalBox">
								<form method="post" action="<c:url value='/album/deleteAlbum/${album.album_id}'/>">
									<div class="modal delete_modal">
										<div class="modal_body delete_body">
											<button class="xBtn">✕</button>
											<img class="warningImg" src="/image/warning.png">
											<strong>${album.album_name} 앨범을 삭제하시겠습니까?</strong>
											<p>앨범 삭제 시<br>사진 파일도 함께 삭제됩니다.</p>
											<button id="album_deleteBtn" class="modal_okBtn okBtn">확인</button>
											<input class="modal_noBtn noBtn" type="reset" value="취소" />
										</div>
									</div>
								</form>
								
								<form method="post" action="<c:url value='/album/updateAlbum/${album.album_id}'/>">
									<div class="modal change_modal">
										<div class="modal_body change_body">
											<button class="xBtn">✕</button>
											<strong>이름 바꾸기</strong>
											<input type="text" id="change_text" value="${album.album_name}" name="album_name">
											<button class="modal_okBtn okBtn2">확인</button>
											<input id="album_changeBtn" class="modal_noBtn noBtn2" type="reset" value="취소" />
										</div>
									</div>
								</form>
							</div>
						</c:forEach>
					</ul>
				</div>
				</div>
				<!-- 이 밑으로는 모달창 -->
				
			</div>
		</div>
		

	<!-- 공통 layout 다이어리 우측 탭 -->
	<c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

	</div>
</body>
</html>
