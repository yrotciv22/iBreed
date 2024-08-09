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
                <h2>감정 분석 결과</h2>
                <p>오늘의 일기 제목 | 작성일자</p>
                <div class="charts">
                    <div class="chart" id="browser-market-share">
                        <p>Browser Market Share</p>
                    </div>
                    <div class="chart" id="average-temperature">
                        <p>24-hr Average Temperature</p>
                    </div>
                </div>
                <div class="message">
                    <c:choose>
                        <c:when test="${not empty error}">
                            <p>${error}</p>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty analysisResults}">
                                <p>기쁨: ${analysisResults.emotion.document.emotion.joy}</p><br>
                                <p>공포: ${analysisResults.emotion.document.emotion.fear}</p><br>
                                <p>슬픔: ${analysisResults.emotion.document.emotion.sadness}</p><br>
                                <p>역겨움: ${analysisResults.emotion.document.emotion.disgust}</p><br>
                                <p>화남: ${analysisResults.emotion.document.emotion.anger}</p>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
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
