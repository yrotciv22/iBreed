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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/join/join.css'/>" />
    <script src="<c:url value='/js/index.js'/>"></script>


    <script>
        function toggleInput(inputId, enable) {
            // 모든 입력 필드를 비활성화하고 값을 초기화합니다
            var pregnancyField = document.getElementById('pregnancyMonths');
            var momField = document.getElementById('momMonths');

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
    </script>


</head>

<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <!-- 메인 -->
    <main>
        <section>
            <form id="JoinForm" name="JoinForm" method="post" action="<c:url value="/join/commit"/>">
                <h1>회원가입</h1><br><br>
                <table>
                    <tr>
                        <td><label>이름</label></td>
                        <td>
                            <input type="text" id="user_name" name="user_name" class="text" size="20">
                            <span class="error-message" id="user_name_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>닉네임</label></td>
                        <td>
                            <input type="text" id="user_nickname" name="user_nickname" class="text" size="20">
                            <input type="button" value="닉네임중복확인" class="overlapbtn" onClick="chkNickname()">
                            <span class="error-message" id="user_nickname_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>아이디</label></td>
                        <td>
                            <input type="text" id="user_id" name="user_id" class="text" size="20">
                            <input type="button" value="ID중복확인" class="overlapbtn" onClick="chkId()">
                            <span class="error-message" id="user_id_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호</label></td>
                        <td>
                            <input type="password" id="user_password" name="user_password" class="text" size="20" placeholder=" (영문자+숫자+특수문자: 8자 이상)">
                            <span class="error-message" id="user_password_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 확인</label></td>
                        <td>
                            <input type="password" id="confirm_password" name="confirm_password">
                            <span class="error-message" id="confirm_password_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 질문</label></td>
                        <td>
                            <select id="hint" name="user_hint" class="text">
                                <option value="">선택하세요</option>
                                <option value="first_pet">어릴 적 애완동물 이름은?</option>
                                <option value="mother_maiden_name">어머니의 성(성씨)은?</option>
                                <option value="first_school">첫 학교 이름은?</option>
                                <option value="favorite_teacher">가장 좋아했던 선생님 이름은?</option>
                            </select>
                            <span class="error-message" id="user_hint_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 정답</label></td>
                        <td>
                            <input type="text" id="user_hint_sub" name="user_hint_sub">
                            <span class="error-message" id="user_hint_sub_Error"></span>
                        </td>
                    </tr>

                    <tr>
                        <td>성별</td>
                        <td>
                            <label><input type="radio" name="user_gender" value="true">남성</label>
                            <label><input type="radio" name="user_gender" value="false">여성</label>
                            <span class="error-message" id="user_gender_Error"></span>
                        </td>
                    </tr>


                    <tr>
                        <td><label for="user_birth">생년월일</label></td>
                        <td>
                            <input type="date" id="user_birth" name="user_birth" class="text">
                            <span class="error-message" id="user_birth_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="user_address">주소</label></td>
                        <td>
                            <input type="text" id="user_address" name="user_address" class="text">
                            <input type="button" value="도로명주소검색" class="overlapbtn" onClick="searchAddress()">
                            <label for="user_address_detail"></label><input type="text" id="user_address_detail" name="user_address_detail" class="text" placeholder="상세주소 입력">
                            <span class="error-message" id="user_address_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="user_phone_number">휴대폰 번호</label></td>
                        <td>
                            <input type="text" id="user_phone_number" name="user_phone_number" class="text" value="010" maxlength="11" style="width: 170px;">
                            <span class="error-message" id="user_phone_number_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td>
                            <input type="text" id="user_email" name="user_email" class="user_email" style="width: calc(50% - 10px);"> @
                            <select name="emailDomain">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                            <input type="button" value="email 중복확인" onClick="chkEmail()" class="overlapbtn">
                            <span class="error-message" id="user_email_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>유형 선택</label></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="fetus" onclick="toggleInput('fetusMonths', true)"> 임산부</label>
                            <input type="number" id="user_fetus_old" name="user_fetus_old" class="text"  max="64" placeholder="개월 수 입력" style="max-width: 200px;" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="mom"  onclick="toggleInput('momMonths', true)"> 육아맘</label>
                            <input type="number" id="user_kids_old" name="user_kids_old" class="text" max="64" placeholder="개월 수 입력" style="max-width: 200px;" disabled>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <label><input type="radio" name="user_kids_select" value="general" onclick="toggleInput('', false)"> 일반인</label>
                        </td>
                    </tr>

                    <tr>
                        <td>위치정보 제공<span><br></span>
                        <td>
                            <label><input type="radio" name="user_location_aggree" value="true">동의</label>
                            <label><input type="radio" name="user_location_aggree" value="false">거부</label>
                            <span class="error-message" id="user_location_aggree_Error"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="use_auth_address">위치 찾기</label></td>
                        <td>
                            <input type="text" id="use_auth_address" name="use_auth_address" class="text">
                            <input type="button" value="위치찾기" class="overlapbtn" onClick="searchlocation()">
                            <span class="error-message" id="use_auth_address_Error"></span>
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