<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>iBreed</title>

    <!-- 공통 layout: head.jsp -->
    <c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/account/join.css'/>" />
    <script src="<c:url value='/js/index.js'/>"></script>


    <script>

        let isIdChecked  = false;
        let isNicknameChecked = false;
        let isEmailChecked = false;


        function idCheck() {
            var userId = document.getElementById('user_id').value;

            // ID 값이 비어 있는 경우
            if (!userId) {
                alert("id 를 입력 해 주세요.");
                return;
            }

            fetch('/checkId?id=' + encodeURIComponent(userId))
                .then(response => response.text())
                .then(data => {
                    if (data.includes('duplicate')) {
                        alert("이미 사용 중인 id 입니다.");
                    } else if (data.includes('ok')) {
                        alert("사용 가능한 id 입니다.");
                        isIdChecked  = true;
                    } else {
                        alert("알 수 없는 오류가 발생했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("서버와의 통신 중 오류가 발생했습니다.");
                });
        }

        function nickCheck() {
            var userNick = document.getElementById('user_nickname').value;

            // ID 값이 비어 있는 경우
            if (!userNick) {
                alert("닉네임을 입력 해 주세요.");
                return;
            }

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

        function emailCheck() {
            let userEmail = document.getElementById('user_email').value;
            let emailDomain = "@" + document.getElementById("emailDomain").value;

            // ID 값이 비어 있는 경우
            if (!userEmail) {
                alert("이메일을 입력 해 주세요.");
                return;
            }


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

            //id 변경시 다시 검증시키도록 유도
            let idInput = document.getElementById('user_id');
            if(idInput){
                isIdChecked = false;
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









        // 빈입력란 체크
        function handleSubmit(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            if (validateForm()) {
                document.getElementById('JoinForm').submit();
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


            if(!isIdChecked){
                alert("아이디 중복 확인을 해 주세요.");
                return false;
            }

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





    </script>


</head>

<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <!-- 메인 -->
    <main>
        <section>
            <form id="JoinForm" name="JoinForm" method="post" action="<c:url value="/join/commit"/>" onsubmit="handleSubmit(event)">
                <h1>회원가입</h1><br><br>
                <table>
                    <tr>
                        <td><label>이름</label></td>
                        <td>
                            <input type="text" id="user_name" name="user_name" class="text" size="20" required>
                        </td>
                    </tr>
                    <tr>
                        <td><label>닉네임</label></td>
                        <td>
                            <input type="text" id="user_nickname" name="user_nickname" class="text" size="20"required>
                            <input type="button" value="닉네임중복확인" class="overlapbtn" onClick="nickCheck()">
                        </td>
                    </tr>
                    <tr>
                        <td><label>아이디</label></td>
                        <td>
                            <input type="text" id="user_id" name="user_id" class="text" size="20"required>
                            <input type="button" value="ID중복확인" class="overlapbtn" onClick="idCheck()">
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
                            <select id="hint" name="user_hint" class="text" required>
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
                            <input type="text" id="user_hint_sub" name="user_hint_sub" required>
                        </td>
                    </tr>

                    <tr>
                        <td>성별</td>
                        <td>
                            <label><input type="radio" name="user_gender" value="true" required>남성</label>
                            <label><input type="radio" name="user_gender" value="false" required>여성</label>
                        </td>
                    </tr>


                    <tr>
                        <td><label for="user_birth">생년월일</label></td>
                        <td>
                            <input type="date" id="user_birth" name="user_birth" class="text" required>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="user_address">주소</label></td>
                        <td>
                            <input type="text" id="user_address" name="user_address" class="text" readonly required>
                            <input type="button" value="도로명주소검색" class="overlapbtn" onClick="searchAddress()">
                            <label for="user_address_detail"></label><input type="text" id="user_address_detail" name="user_address_detail" class="text" placeholder="상세주소 입력" style="width:357px" required>

                        </td>

                    </tr>

                    <tr>
                        <td><label for="user_phone_number">휴대폰 번호</label></td>
                        <td>
                            <input type="text" id="user_phone_number" name="user_phone_number" class="text" value="010" maxlength="11" style="width: 170px;" required />
                        </td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td>
                            <input type="text" id="user_email" name="user_email" class="user_email" style="width: calc(50% - 10px);" required> @
                            <select name="emailDomain" id="emailDomain" required>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                            <input type="button" value="email 중복확인" class="overlapbtn" onclick="emailCheck()">
                        </td>
                    </tr>
                    <tr>
                        <td><label>유형 선택</label></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="fetus" onclick="toggleInput('user_fetus_old', true)" required> 임산부</label>
                            <input type="number" id="user_fetus_old" name="user_fetus_old" class="text"  max="64" placeholder="개월 수 입력" style="max-width: 200px;" disabled required>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="mom"  onclick="toggleInput('user_kids_old', true)" required> 육아맘</label>
                            <input type="number" id="user_kids_old" name="user_kids_old" class="text" max="64" placeholder="개월 수 입력" style="max-width: 200px;" disabled required>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="general" onclick="toggleInput('', false)" required> 일반인</label>
                        </td>
                    </tr>

                    <tr>
                        <td>위치정보 제공<span><br></span>
                        <td>
                            <label><input type="radio" name="user_location_aggree" value="true" required>동의</label>
                            <label><input type="radio" name="user_location_aggree" value="false" required>거부</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="use_auth_address">위치 찾기</label></td>
                        <td>
                            <input type="text" id="use_auth_address" name="use_auth_address" class="text" readonly>
                            <input type="button" value="위치찾기" class="overlapbtn" onClick="searchLocation()">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button type="submit" class="submitbtn">가입하기</button></td>
                    </tr>
                </table>
            </form>
        </section>
    </main>
    <!-- 메인 끝 -->


    <!-- 공통 layout: botton.jsp -->
    <c:import url="/WEB-INF/views/layout/bottom.jsp" />


</div>
</body>
</html>