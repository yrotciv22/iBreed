<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>My Diary Emotion</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_photos.css' />" />
</head>
<body>
 
<div class="all">
		<div class="diary_wrap">
			<div class="diary_content">
				<div id="wrap">
				<h3>전체앨범</h3>
				<div>
					<ul>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://mblogthumb-phinf.pstatic.net/MjAyMDA4MDZfMTIg/MDAxNTk2NjkwNjY5OTM0.6ESYhF5_BT3wtos4zBrAbh58xrpbVCoxYm0V_7D-UGIg.nTGkJFqxOCt3BIb-SCscWMWY5IkfUE-Ejwml0xAdZ3Ig.PNG.goms1101/B2C1B4EB.png?type=w800">
								<strong class="album_title">앨범1</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5O3xL9lq09hkE-gd48eg3dx0eVfOrMSsvkg&s">
								<strong class="album_title">앨범2</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQggkX5bahGmZXUT_ASqvvNN0nIWpkqxyCWkw&s">
								<strong class="album_title">앨범3</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfpdf36gRSTYvvWf4s17JNn1EFU2qth2DEBQ&s">
								<strong class="album_title">앨범4</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCbxfZ_eAYvmhnM4ryLyQYzQdRdOZngCmiQQ&s">
								<strong class="album_title">앨범5</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://1.gall-img.com/hygall/files/attach/images/82/373/714/281/57109bf5be6b8cf4eda8420b6af80485.jpg">
								<strong class="album_title">앨범6</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfMTI3/MDAxNjcwMTM0MzQyMzc5.2rCyK4JrY06VmH7Pch1Bo3l_KPwhQ4go6Qs5COjfS-4g.PkLwzOOMt7M-LZ6MUmExFEMdzitgvq6Cd96Jvni-yG4g.JPEG.goms1101/IMG_3396.JPG?type=w800">
								<strong class="album_title">앨범7</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://cdn2.colley.kr/item_127602_1_2_title_2.jpeg">
								<strong class="album_title">앨범8</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
						<li>
							<div class="albumBox">
								<img class="album_thimbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyOSaL-TDojRiXMEYaUzrH5YhapnKUjOEqTg&s">
								<strong class="album_title">앨범9</strong>
								<p class="update">언제언제 업데이트</p>
							</div>
						</li>
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
