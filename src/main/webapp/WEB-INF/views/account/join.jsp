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
    <script src="<c:url value='/js/index.js'/>"></script>

</head>

<body>
<div class="all">

    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />


    <!-- 메인 -->
    <main>
        <section>
            <form id="JoinForm" name="JoinForm" method="post" action="join" onsubmit="handleSubmit(event)">
                <table>
                    <tr>
                        <td><label>이름</label></td>
                        <td>
                            <input type="text" id="name" name="name" class="text" size="20">
                            <span class="error-message" id="nameError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>아이디</label></td>
                        <td>
                            <input type="text" id="id" name="id" class="text" size="20">
                            <input type="button" value="ID중복확인" class="overlapbtn" onClick="chkId()">
                            <span class="error-message" id="idError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호</label></td>
                        <td>
                            <input type="password" id="password" name="password" class="text" size="20" placeholder=" (영문자+숫자+특수문자: 8자 이상)">
                            <span class="error-message" id="passwordError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>비밀번호 확인</label></td>
                        <td>
                            <input type="password" id="confirmpassword" name="confirmpassword">
                            <span class="error-message" id="confirmpasswordError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="dob">생년월일</label></td>
                        <td>
                            <input type="date" id="dob" name="dob" class="text">
                            <span class="error-message" id="dobError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="address1">주소</label></td>
                        <td>
                            <input type="text" id="address1" name="address1" class="text">
                            <input type="button" value="도로명주소검색" class="overlapbtn" onClick="searchAddress()">
                            <label for="address2"></label><input type="text" id="address2" name="address2" class="text" placeholder="상세주소 입력">
                            <span class="error-message" id="addressError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="phone1">휴대폰 번호</label></td>
                        <td>
                            <input type="tel" id="phone1" name="phone1" class="text" value="010" maxlength="11" style="width: 170px;">
                            <span class="error-message" id="phoneError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><label>이메일</label></td>
                        <td>
                            <input type="text" id="email" name="email" class="email" style="width: calc(50% - 10px);"> @
                            <select name="emailDomain">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                            <input type="button" value="email 중복확인" onClick="chkEmail()" class="overlapbtn">
                            <span class="error-message" id="emailError"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>이메일 수신여부</td>
                        <td>
                            <label><input type="radio" name="emailRcv" value="yemail">수신동의</label>
                            <label><input type="radio" name="emailRcv" value="nemail">수신거부</label>
                            <span class="error-message" id="emailRcvError"></span>
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