<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Diary Emotion Detail</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_layout.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary/mydiary_diary.css' />" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            // 막대그래프 데이터
            var barData = google.visualization.arrayToDataTable([
                ['Emotion', 'Level'],
                ['Angry', ${emotion.sentiment_angry}],
                ['Disgusting', ${emotion.sentiment_disgusting}],
                ['Fear', ${emotion.sentiment_fear}],
                ['Joy', ${emotion.sentiment_joy}],
                ['Sorrow', ${emotion.sentiment_sorrow}]
            ]);

            // 원형그래프 데이터
            var pieData = google.visualization.arrayToDataTable([
                ['Emotion', 'Level'],
                ['Angry', ${emotion.sentiment_angry}],
                ['Disgusting', ${emotion.sentiment_disgusting}],
                ['Fear', ${emotion.sentiment_fear}],
                ['Joy', ${emotion.sentiment_joy}],
                ['Sorrow', ${emotion.sentiment_sorrow}]
            ]);

            // 세로 막대그래프 옵션
            var barOptions = {
                title: 'Emotion Levels (Vertical Bar Chart)',
                chartArea: {width: '50%'},
                hAxis: {
                    title: 'Emotion'
                },
                vAxis: {
                    title: 'Level',
                    minValue: 0
                }
            };

            // 원형그래프 옵션
            var pieOptions = {
                title: 'Emotion Levels (Pie Chart)',
                is3D: true,
            };

            // 세로 막대그래프 그리기
            var barChart = new google.visualization.ColumnChart(document.getElementById('bar_chart_div'));
            barChart.draw(barData, barOptions);

            // 원형그래프 그리기
            var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
            pieChart.draw(pieData, pieOptions);
        }
    </script>
    <style>
        .content-wrapper {
            display: flex;
            flex-direction: column; /* 세로 배치 */
            align-items: center; /* 중앙 정렬 */
        }

        .chart-container {
            display: flex;
            flex-direction: column; /* 세로로 배치하여 제목을 포함 */
            align-items: center;
            width: 100%; /* 전체 폭을 사용 */
            margin-bottom: 20px;
        }

        .chart-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px; /* 제목과 그래프 사이에 간격 추가 */
            text-align: center;
        }

        .chart-area {
            display: flex;
            justify-content: space-between; /* 그래프들이 가로로 나란히 배치되도록 설정 */
            width: 100%;
        }

        .chart-item {
            width: 48%; /* 각 차트가 화면의 절반씩 차지하도록 설정 */
            height: 200px; /* 차트의 세로 높이를 더 줄임 */
            background-color: #fff; /* 흰색 배경 */
            border: 1px solid #ccc; /* 테두리 */
            border-radius: 15px; /* 둥근 모서리 */
            padding: 15px; /* 내용과 테두리 사이의 간격 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
        }

        .result-text {
            width: 90%; /* 텍스트 영역이 전체 화면의 90%를 차지 */
            max-height: 400px; /* 텍스트 영역의 최대 높이 확대 */
            overflow-y: auto; /* 스크롤 가능하도록 설정 */
            background-color: #f9f9f9; /* 부드러운 배경색 추가 */
            border: 1px solid #ccc; /* 텍스트 영역 경계선 */
            border-radius: 10px; /* 모서리 둥글게 */
            padding: 15px; /* 내용과 테두리 사이의 간격 추가 */
            white-space: pre-wrap; /* 텍스트 줄 바꿈 처리 */
            margin-top: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
            font-size: 16px; /* 글꼴 크기 */
            color: #333; /* 글꼴 색상 */
            line-height: 1.5; /* 줄 간격 조정 */
        }

        .detail-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px; /* 그래프와 텍스트 사이에 간격 추가 */
            text-align: center;
        }
    </style>
</head>
<body>

<div class="all">
    <div class="diary_wrap">
        <div class="diary_content">
            <div class="content-wrapper">
                <!-- 감정 분석 결과 제목 -->
                <div class="chart-container">
                    <div class="chart-title">감정 분석 결과</div>

                    <!-- 세로 막대그래프와 원형그래프를 가로로 나란히 배치 -->
                    <div class="chart-area">
                        <div id="bar_chart_div" class="chart-item"></div>
                        <div id="pie_chart_div" class="chart-item"></div>
                    </div>
                </div>

                <!-- 감정 분석 상세 안내 제목 추가 -->
                <div class="detail-title">감정분석 상세 안내</div>

                <!-- 감정 분석 결과 텍스트를 그래프 아래에 세로로 배치 -->
                <div class="result-text">
                    ${emotion.sentiment_result}
                </div>
            </div>
        </div>
    </div>

    <!-- 공통 layout 다이어리 우측 탭 -->
    <c:import url="/WEB-INF/views/diary/mydiary_tab_layout.jsp" />

</div>

</body>
</html>
