<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B Diary</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/emotial/emotialResult.css'/>" />
</head>
<body>
<div class="container">
    <div class="header">
        <h1>B Diary</h1>
    </div>
    <div class="main-content">
        <div class="content-deco">
            <div class="content">
                <h2>감정 분석 입력</h2>
                <p>오늘의 일기 제목 | 작성일자</p>
                <form action ="<c:url value="/diary/emotialresult"/>" method="post" >
                    <label for="inputText">텍스트:</label>
                    <input type="text" id="inputText" class="message" name="inputText">
                    <button type="submit">확인</button>
                </form>
            </div>
        </div>
        <div class="sidebar">
            <ul>
                <li>홈</li>
                <li>프로필</li>
                <li class="active">다이어리</li>
                <li>감정관리</li>
                <li>사진첩</li>
                <li>캘린더</li>
                <li>친구</li>
                <li>마이페이지</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
