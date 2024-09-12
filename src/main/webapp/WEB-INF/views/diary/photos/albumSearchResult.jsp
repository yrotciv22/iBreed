<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>앨범</title>
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/album_main.js'/>"></script>
	<script src="<c:url value='/js/albumSearch.js'/>"></script>
	<script src="<c:url value='/js/arrangeAlbum.js'/>"></script>
	<script src="<c:url value='/js/albumCheck.js'/>"></script>
	<script>const userId = "${sessionScope.user_id}"</script>
</head>
<body>
	<ul>
		<c:choose>
			<c:when test="${empty albumList}">
				<li>
					<div>
						<h5 id="noSearch">앨범 검색결과가 없습니다.</h5>
					</div>
				</li>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${albumList}" var="album" varStatus="status">
					<li>
						<a href="/mydiary/${user_id}/detailAlbum/${album.album_id}"><div class="albumBox">
							<div class="photoCheck"><input type="checkbox" class="chk"></div>
							<img class="album_thimbnail" src="/image/null_album.png">
							<div class="photoCount">
								<span class="countNum">${album.photo_count}</span> <!-- 앨범에 들어가있는 사진이 몇장인지 표시 -->
							</div>
							<strong class="album_title">${album.album_name}</strong>
							<p class="update"><fmt:formatDate value="${album.album_date}" pattern="yyyy-MM-dd" />에 생성됨</p>
						</div></a>
						<div id="menu" class="menu">
							<ul>
								<li><a>🖱️열기</a></li>
								<li><a class="deleteBtn"  data-del="${status.index}">🗑️삭제</a></li>
								<li><a class="changeBtn" data-ch="${status.index}">이름바꾸기</a></li>
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
						
						<form class="album_change_form" method="post">
							<div class="modal change_modal">
								<div class="modal_body change_body">
									
									<span class="xBtn">✕</span>
									<strong>이름 바꾸기</strong>
									<input type="text" id="change_text" class="change_text" name="album_name" value="${album.album_name}">
									<input type="hidden" id="album_id" value="${album.album_id}">
									<button class="modal_okBtn okBtn2">확인</button>
									<input id="album_changeBtn" class="modal_noBtn noBtn2" type="reset" value="취소" />
								</div>
							</div>
						</form>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
</body>
</html>
