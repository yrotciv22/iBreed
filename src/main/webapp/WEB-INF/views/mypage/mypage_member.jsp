<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>iBreed Mypage</title>

<!-- 공통 layout: head.jsp -->
<c:import url="/WEB-INF/views/layout/head.jsp" />

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypage_layout.css'/>" />

<!-- 여기에 css, js 파일 링크를 작성하세요. -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/account/join.css'/>" />
	<script src="<c:url value='/js/index.js'/>"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<script>
		const userId = "${sessionScope.user_id}";
		let isNicknameChecked = false;
		let isEmailChecked = false;


		function nickCheck() {
			var userNick = document.getElementById('user_nickname').value;
			var existingNick = "${member.user_nickname}"; // 서버에서 전달된 값
			// ID 값이 비어 있는 경우
			if (!userNick) {
				alert("닉네임을 입력 해 주세요.");
				return;
			}
			else if(existingNick === userNick){
				alert("사용 가능한 닉네임 입니다.");
				isNicknameChecked = true;
			}
			else{
				fetch('/checkNick?nickname=' + encodeURIComponent(userNick))
						.then(response => response.text())
						.then(data => {
							if (data.includes('duplicate')) {
								alert("이미 사용 중인 닉네임 입니다.");
							} else if (data.includes('ok')) {
								alert("사용 가능한 닉네임 입니다.");
								isNicknameChecked = true;
							} else {
								errorMessageElement.innerText = '알 수 없는 오류가 발생했습니다.';
							}
						})
						.catch(error => {
							console.error('Error:', error);
							errorMessageElement.innerText = '서버와의 통신 중 오류가 발생했습니다.';
						});
			}


		}

		function emailCheck() {
			let userEmail = document.getElementById('user_email').value;
			let emailDomain = "@" + document.getElementById("emailDomain").value;
			let emailBeforeAt = "${emailBeforeAt}";


			// ID 값이 비어 있는 경우
			if (!userEmail) {
				alert("이메일을 입력 해 주세요.");
				return;
			}
			else if(userEmail === emailBeforeAt){
				alert("사용 가능한 이메일 입니다.");
				isEmailChecked = true;
			}
			else{
				fetch('/checkEmail?email=' + encodeURIComponent(userEmail+emailDomain))
						.then(response => response.text())
						.then(data => {
							if (data.includes('duplicate')) {
								alert("이미 사용 중인 이메일 입니다.");
							} else if (data.includes('ok')) {
								alert("사용 가능한 이메일 입니다.");
								isEmailChecked = true;
							} else {
								errorMessageElement.innerText = '알 수 없는 오류가 발생했습니다.';
							}
						})
						.catch(error => {
							console.error('Error:', error);
							errorMessageElement.innerText = '서버와의 통신 중 오류가 발생했습니다.';
						});
			}

		}




		// 육아맘, 임산부 토글 활성 / 비활성화
		function toggleInput(inputId, enable) {
			// 모든 입력 필드를 비활성화하고 값을 초기화합니다
			var pregnancyField = document.getElementById('user_fetus_old');
			var momField = document.getElementById('user_kids_old');

			pregnancyField.disabled = true;
			momField.disabled = true;

			// 값을 초기화합니다
			pregnancyField.value = '';
			momField.value = '';

			// 특정 입력 필드만 활성화 설정
			if (enable && inputId) {
				document.getElementById(inputId).disabled = false;
			}
		}

		//DOMContentLoaded 하고나서 작업
		document.addEventListener('DOMContentLoaded', function() {
			// 휴대폰 번호 입력란에서 하이픈(-) 자동 제거
			let phoneNumberInput = document.getElementById('user_phone_number');
			if (phoneNumberInput) {
				phoneNumberInput.addEventListener('input', function() {
					this.value = this.value.replace(/-/g, '');
				});
			}

			//닉네임 변경시 다시 검증시키도록 유도
			let nicknameInput = document.getElementById('user_nickname');
			if(nicknameInput){
				isNicknameChecked = false;
			}

			//닉네임 변경시 다시 검증시키도록 유도
			let emailInput = document.getElementById('user_email');
			if(emailInput){
				isEmailChecked = false;
			}
		});



		function searchAddress() {
			new daum.Postcode({
				oncomplete:function(data){
					let findaddress='  ';

					if(data.userSelectedType==='R'){
						findaddress=data.roadAddress;
					}else{
						findaddress=data.jibunAddress;
					}
					document.getElementById('user_address').value = findaddress;
				}

			}).open();



		}





		// 빈입력란 체크
		// 빈입력란 체크
		function handleSubmit(event) {
			event.preventDefault(); // 기본 제출 동작 방지

			if (validateForm()) {
				// 이미지를 업로드하고, 성공한 후에 폼을 제출합니다.
				uploadImageAndSubmitForm();
			}
		}


		//지도 함수
		function searchLocation() {
			// Spring Controller를 통해 팝업 창을 엽니다.
			window.open('/locationPopup', 'LocationPopup', 'width=600,height=500,scrollbars=yes');
		}

		function setLocation(address) {
			// 부모 창의 입력 필드에 주소를 설정합니다.
			document.getElementById('use_auth_address').value = address;
		}

		//입력란 비어있는지 체크여부
		function validateForm() {
			// 입력 필드들을 가져옵니다
			const userName = document.getElementById('user_name').value.trim();
			const userNickname = document.getElementById('user_nickname').value.trim();
			const userId = document.getElementById('user_id').value.trim();
			const password = document.getElementById('user_password').value;
			const confirmPassword = document.getElementById('confirm_password').value;
			const userHint = document.getElementById('hint').value.trim();
			const userHintSub = document.getElementById('user_hint_sub').value.trim();
			const userGender = document.querySelector('input[name="user_gender"]:checked');
			const userBirth = document.getElementById('user_birth').value.trim();
			const userAddress = document.getElementById('user_address').value.trim();
			const userPhoneNumber = document.getElementById('user_phone_number').value.trim();
			const userEmail = document.getElementById('user_email').value.trim();


			if(!isEmailChecked){
				alert("이메일 중복 확인을 해 주세요.");
				return false;
			}

			if(!isNicknameChecked){
				alert("닉네임 중복 확인을 해 주세요.");
				return false;
			}

			// 비밀번호 일치 여부 확인
			if (password !== confirmPassword) {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
				return false;
			}

			return true;
		}


		//위치정보기반 처리 코드
		document.addEventListener('DOMContentLoaded', function() {
			const locationAgreeRadios = document.querySelectorAll('input[name="user_location_aggree"]');
			const locationButton = document.getElementById('locationButton');  // 위치찾기 버튼
			const authAddressInput = document.getElementById('use_auth_address');  // 위치 입력란

			// 라디오 버튼의 상태가 변경될 때마다 호출되는 함수
			function handleLocationAgreeChange() {
				if (this.value === 'true') {
					locationButton.disabled = false;  // 동의하면 버튼 활성화
				} else {
					authAddressInput.value = '';  // 거부하면 입력란 비우기
					locationButton.disabled = true;  // 버튼 비활성화
				}
			}

			// 모든 라디오 버튼에 변경 이벤트 리스너 추가
			locationAgreeRadios.forEach(function(radio) {
				radio.addEventListener('change', handleLocationAgreeChange);
			});

			// 페이지 로드 시 초기 상태 설정
			handleLocationAgreeChange.call(document.querySelector('input[name="user_location_aggree"]:checked'));
		});


		function cancleData(){
			if(confirm("수정된 내용은 지워집니다. 계속하시겠습니까?")){
				window.location.href='/mypage/wishlist';
			}
		}


		// 이미지 미리보기 함수
		function previewImage() {
			const file = document.getElementById('profileImage').files[0];
			if (file) {
				const reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('imagePreview').src = e.target.result;
					document.getElementById('imagePreview').style.display = 'block';
				}
				reader.readAsDataURL(file);
			}
		}

		// 이미지 업로드 함수
		function uploadImageAndSubmitForm() {
			const fileInput = document.getElementById('profileImage');
			const formData = new FormData();
			formData.append('file', fileInput.files[0]);

			fetch('/upload/profile', {
				method: 'POST',
				body: formData
			})
					.then(response => response.text()) // 서버에서 반환된 텍스트 응답 받기
					.then(fileUrl => {
						alert('업로드 성공!');
						console.log(fileUrl); // 서버에서 반환된 이미지 URL 경로

						// hidden 필드에 업로드된 이미지 URL 저장
						const hiddenInput = document.getElementById('uploadedImageUrl');
						hiddenInput.value = fileUrl;

						// 이미지 업로드가 완료된 후에 폼을 제출
						document.getElementById('JoinForm').submit();
					})
					.catch(error => {
						console.error('업로드 실패:', error);
					});
		}



	</script>


</head>


<body>
	<div class="all">

		<!-- 공통 layout: top.jsp -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<!-- 공통 마이페이지 mypage_layout.jsp -->
		<c:import url="/WEB-INF/views/mypage/mypage_layout.jsp" />

		<div class="contents_wrap">
			<!-- 본문작성 -->






			<main>
				<section>
					<form id="JoinForm" name="JoinForm" method="post" action="<c:url value="/member/commit"/>" onsubmit="handleSubmit(event)">
						<h1>회원 정보 수정</h1><br><br>
						<table>
							<tr>
								<td><label>이름</label></td>
								<td>
									<input type="text" id="user_name" name="user_name" class="text" size="20" value="${member.user_name}" required>
								</td>
							</tr>
							<tr>
								<td><label>닉네임</label></td>
								<td>
									<input type="text" id="user_nickname" name="user_nickname" class="text" size="20" value="${member.user_nickname}"  required>
									<input type="button" value="닉네임중복확인" class="overlapbtn" onClick="nickCheck()">
								</td>
							</tr>
							<tr>
								<td><label>아이디</label></td>
								<td>
									<input type="text" id="user_id" name="user_id" class="text" size="20" value="${member.user_id}"  readonly required>
								</td>
							</tr>
							<tr>
								<td><label>비밀번호</label></td>
								<td>
									<input type="password" id="user_password" name="user_password" class="text" size="20" placeholder=" (영문자+숫자+특수문자: 8자 이상)" required>
								</td>
							</tr>
							<tr>
								<td><label>비밀번호 확인</label></td>
								<td>
									<input type="password" id="confirm_password" name="confirm_password" required>
								</td>
							</tr>
							<tr>
								<td><label>비밀번호 질문</label></td>
								<td>
									<select id="hint" name="user_hint" class="text" value="${member.user_hint}" required>
										<option value="">선택하세요</option>
										<option value="first_pet">어릴 적 애완동물 이름은?</option>
										<option value="mother_maiden_name">어머니의 성(성씨)은?</option>
										<option value="first_school">첫 학교 이름은?</option>
										<option value="favorite_teacher">가장 좋아했던 선생님 이름은?</option>
									</select>
								</td>
							</tr>
							<tr>
								<td><label>비밀번호 정답</label></td>
								<td>
									<input type="text" id="user_hint_sub" name="user_hint_sub" value="${member.user_hint_sub}"  required>
								</td>
							</tr>

							<tr>
								<td>성별</td>
								<td>
									<label>
										<input type="radio" name="user_gender" value="true"
											   <c:if test="${member.user_gender == true}">checked</c:if>>남성
									</label>
									<label>
										<input type="radio" name="user_gender" value="false"
											   <c:if test="${member.user_gender == false}">checked</c:if>>여성
									</label>
								</td>
							</tr>

							<tr>
								<td><label>프로필 사진 변경</label></td>
								<td>
									<!-- 파일 선택 버튼 -->
									<input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewImage()">
									<br>
									<!-- 새로 선택한 이미지 미리보기 -->
									<img id="imagePreview" src="${member.user_profile_image}" alt="새 이미지 미리보기" style=" max-width: 200px; max-height: 200px;">
									<!-- 이미지 업로드 후 경로를 저장할 hidden 필드 -->
									<input type="hidden" id="uploadedImageUrl" name="user_profile_image" value="${member.user_profile_image}">
<%--									<button type="button" class="uploadbtn" onclick="uploadImage()">업로드</button>--%>


								</td>
							</tr>


							<tr>
								<td><label for="user_birth">생년월일</label></td>
								<td>
									<input type="date" id="user_birth" name="user_birth" class="text" value="${userBirth}" required>
								</td>
							</tr>
							<tr>
								<td><label for="user_address">주소</label></td>
								<td>
									<input type="text" id="user_address" name="user_address" class="text" value="${member.user_address}" readonly required>
									<input type="button" value="도로명주소검색" class="overlapbtn" onClick="searchAddress()">
									<label for="user_address_detail"></label><input type="text" id="user_address_detail" name="user_address_detail" class="text" placeholder="상세주소 입력" value="${member.user_address_detail}" style="width:357px" required>

								</td>

							</tr>

							<tr>
								<td><label for="user_phone_number">휴대폰 번호</label></td>
								<td>
									<input type="text" id="user_phone_number" name="user_phone_number" class="text" value="${member.user_phone_number}" maxlength="11" style="width: 170px;" required />
								</td>
							</tr>
							<tr>
								<td><label>이메일</label></td>
								<td>
									<input type="text" id="user_email" name="user_email" class="user_email" style="width: calc(50% - 10px);" value="${emailBeforeAt}" required> @
									<select name="emailDomain" id="emailDomain" required>
										<option value="naver.com" <c:if test="${emailDomain == 'naver.com'}">selected</c:if>>naver.com</option>
										<option value="gmail.com" <c:if test="${emailDomain == 'gmail.com'}">selected</c:if>>gmail.com</option>
										<option value="daum.net" <c:if test="${emailDomain == 'daum.net'}">selected</c:if>>daum.net</option>
									</select>
									<input type="button" value="email 중복확인" class="overlapbtn" onclick="emailCheck()">
								</td>
							</tr>
							<tr>
								<td><label>유형 선택</label></td>
								<td colspan="2">
									<label>
										<input type="radio" name="user_kids_select" value="fetus"
											   onclick="toggleInput('user_fetus_old', true)"
											   <c:if test="${member.user_kids_select == 'fetus'}">checked</c:if>> 임산부
									</label>
									<input type="number" id="user_fetus_old" name="user_fetus_old" class="text" max="45"
										   placeholder="주차 수 입력" style="max-width: 200px;"
										   <c:if test="${member.user_kids_select != 'fetus'}">disabled</c:if>
										   value="${member.user_fetus_old}" required>
								</td>
							</tr>

							<tr>
								<td></td>
								<td colspan="2">
									<label>
										<input type="radio" name="user_kids_select" value="mom"
											   onclick="toggleInput('user_kids_old', true)"
											   <c:if test="${member.user_kids_select == 'mom'}">checked</c:if>> 육아맘
									</label>
									<input type="number" id="user_kids_old" name="user_kids_old" class="text" max="64"
										   placeholder="개월 수 입력" style="max-width: 200px;"
										   <c:if test="${member.user_kids_select != 'mom'}">disabled</c:if>
										   value="${member.user_kids_old}" required>
								</td>
							</tr>

							<tr>
								<td></td>
								<td colspan="2">
									<label>
										<input type="radio" name="user_kids_select" value="general"
											   onclick="toggleInput('', false)"
											   <c:if test="${member.user_kids_select == 'general'}">checked</c:if>> 일반인
									</label>
								</td>
							</tr>


							<tr>
								<td>위치정보 제공<span><br></span></td>
								<td>
									<label>
										<input type="radio" name="user_location_aggree" value="true"
											   <c:if test="${member.user_location_agree == true}">checked</c:if> required>동의
									</label>
									<label>
										<input type="radio" name="user_location_aggree" value="false"
											   <c:if test="${member.user_location_agree == false}">checked</c:if> required>거부
									</label>
								</td>
							</tr>

							<tr>
								<td><label for="use_auth_address">위치 찾기</label></td>
								<td>
									<input type="text" id="use_auth_address" name="use_auth_address" class="text" value="${member.user_auth_address}" readonly>
									<input type="button" value="위치찾기" id="locationButton" class="overlapbtn" onClick="searchLocation()">
								</td>
							</tr>
							<tr>
								<td colspan="1"><button type="button" class="submitbtn" onclick="cancleData()">취소</button></td>
								<td colspan="1"><button type="submit" class="submitbtn">수정하기</button></td>
							</tr>
						</table>
					</form>
				</section>
			</main>








			<!-- 본문작성 끝 -->
		</div>
	</div>

	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />

	</div>
</body>
</html>