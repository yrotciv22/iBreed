<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>iBreed Mypage</title>

    <!-- 공통 layout: head.jsp -->
    <c:import url="/WEB-INF/views/layout/head.jsp"/>

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage/mypage_layout.css'/>"/>

    <style>
        .tab-menu {
            display: flex;
            margin: 20px;
            border-bottom: 2px solid #ccc;
        }

        .tab-menu div {
            padding: 10px 20px;
            cursor: pointer;
            font-size: 18px;
        }

        .tab-menu div.active {
            border-bottom: 3px solid #000;
        }

        .review-section {
            margin: 20px;
        }

        .review-list, .available-reviews {
            display: none;
        }

        .review-list.active, .available-reviews.active {
            display: block;
        }

        .review-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .review-item img {
            width: 60px;
            height: 60px;
            background-color: #ddd;
        }

        .review-item div {
            flex: 1;
            margin-left: 10px;
        }

        .review-item button {
            padding: 5px 10px;
            background-color: #ccc;
            border: none;
            cursor: pointer;
        }

        .review-item button:hover {
            background-color: #bbb;
        }

        .no-reviews {
            text-align: center;
            padding: 20px;
            font-size: 16px;
            color: #888;
        }

        /* 리뷰 작성 폼 */
        .review-form {
            margin-top: 10px;
            display: none;
        }

        .review-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        .review-form button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .review-form button:hover {
            background-color: #45a049;
        }

        /* 별점 선택 */
        .stars {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
            font-size: 24px;
            cursor: pointer;
        }

        .stars input[type="radio"] {
            display: none;
        }

        .stars label {
            color: #ccc;
        }

        .stars input:checked ~ label,
        .stars label:hover,
        .stars label:hover ~ label {
            color: #f5b301;
        }
    </style>
    <script>
        const userId = "${sessionScope.user_id}";
    </script>
</head>

<body>

<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>


<div class="all">
    <!-- 공통 layout: top.jsp -->
    <c:import url="/WEB-INF/views/layout/top.jsp"/>

    <!-- 공통 마이페이지 mypage_layout.jsp -->
    <c:import url="/WEB-INF/views/mypage/mypage_layout.jsp"/>

    <div class="contents_wrap">
        <!-- 탭 메뉴 -->
        <div class="tab-menu">
            <div class="tab-item active" data-target="review-list">내가 작성한 리뷰</div>
            <div class="tab-item" data-target="available-reviews">작성 가능한 리뷰</div>
        </div>

        <!-- 본문 작성 -->
        <div class="review-section">

            <!-- 내가 작성한 리뷰 리스트 -->
            <div class="review-list active">
                <div class="review-header">
                    <div>내가 작성한 리뷰 : <c:out value="${fn:length(list)}"/></div>
                </div>

                <div class="review-items">
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach var="review" items="${list}">

                                <form class="review-item" method="post" action="<c:url value="/mypage/deleteReview"/>">
                                    <input type="hidden" name="delete" value="${review.review_id}"/>
                                    <img src="<c:url value='${review.img}'/>" alt="상품 이미지">
                                    <div>
                                        <p>${review.review_time} 결제</p>
                                        <p>${review.review_title}</p>
                                        <div>
                                            <c:forEach begin="1" end="5" var="i">
                                                <c:choose>
                                                    <c:when test="${i <= review.review_rating}">
                                                        &#9733;
                                                    </c:when>
                                                    <c:otherwise>
                                                        &#9734;
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div>
                                        <p>${review.review_coment}</p>
                                    </div>
                                    <button type="submit" onclick="return deleteAlarm()">삭제하기</button>
                                </form>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="no-reviews">
                                작성하신 리뷰가 없습니다.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- 작성 가능한 리뷰 리스트 -->
            <div class="available-reviews">
                <div class="review-header">
                    <div>작성 가능한 리뷰 : <c:out value="${fn:length(historyVOS)}"/></div>
                </div>

                <div class="review-items">
                    <c:choose>
                        <c:when test="${not empty historyVOS}">
                            <c:forEach var="availableReview" items="${historyVOS}">
                                <div class="review-item">
                                    <img src="<c:url value='${availableReview.product_img}'/>" alt="상품 이미지">
                                    <div>
                                        <p>제목 : ${availableReview.product_name}</p>
                                        <p>가격 : ${availableReview.product_price} 원</p>
                                        <button class="review-btn" data-id="${availableReview.product_id}">리뷰 작성하기
                                        </button>

                                        <!-- 리뷰 입력 폼 -->
                                        <form class="review-form" id="review-form-${availableReview.product_id}"
                                              style="display: none;" method="post"
                                              action="<c:url value="/mypage/submitReview"/>">
                                            <input type="hidden" name="img" value="${availableReview.product_img}"/>
                                            <input type="hidden" name="review_title"
                                                   value="${availableReview.product_name}"/>
                                            <input type="hidden" name="product_id"
                                                   value="${availableReview.product_id}"/>

                                            <textarea rows="4" cols="50" name="review_coment"
                                                      placeholder="리뷰 내용을 입력하세요..."></textarea>
                                            <br/>

                                            <!-- 별점 선택 -->
                                            <div class="stars">
                                                <input type="radio" id="star5-${availableReview.product_id}"
                                                       name="review_rating" value="5"/>
                                                <label for="star5-${availableReview.product_id}">&#9733;</label>
                                                <input type="radio" id="star4-${availableReview.product_id}"
                                                       name="review_rating" value="4"/>
                                                <label for="star4-${availableReview.product_id}">&#9733;</label>
                                                <input type="radio" id="star3-${availableReview.product_id}"
                                                       name="review_rating" value="3"/>
                                                <label for="star3-${availableReview.product_id}">&#9733;</label>
                                                <input type="radio" id="star2-${availableReview.product_id}"
                                                       name="review_rating" value="2"/>
                                                <label for="star2-${availableReview.product_id}">&#9733;</label>
                                                <input type="radio" id="star1-${availableReview.product_id}"
                                                       name="review_rating" value="1"/>
                                                <label for="star1-${availableReview.product_id}">&#9733;</label>
                                            </div>

                                            <button type="submit" class="submit-review-btn" onclick="return submitAlarm()">작성하기</button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="no-reviews">
                                작성 가능한 리뷰가 없습니다.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- 본문 작성 끝 -->
    </div>
</div>

<!-- 공통 layout: bottom.jsp -->
<c:import url="/WEB-INF/views/layout/bottom.jsp"/>

<!-- 탭 전환 및 리뷰 작성 폼 전환 스크립트 -->
<script>

    document.querySelectorAll('.tab-item').forEach(function (tab) {
        tab.addEventListener('click', function () {
            document.querySelectorAll('.tab-item').forEach(function (item) {
                item.classList.remove('active');
            });
            document.querySelectorAll('.review-list, .available-reviews').forEach(function (section) {
                section.classList.remove('active');
            });

            this.classList.add('active');
            document.querySelector('.' + this.getAttribute('data-target')).classList.add('active');
        });
    });

    // 리뷰 작성 버튼 클릭 시 폼 보이기/숨기기
    document.querySelectorAll('.review-btn').forEach(function (button) {
        button.addEventListener('click', function () {
            const productId = this.getAttribute('data-id');
            const reviewForm = document.getElementById('review-form-' + productId);

            // 기존에 보이는 폼이 있다면 숨기기
            document.querySelectorAll('.review-form').forEach(function (form) {
                form.style.display = 'none';
            });

            // 클릭한 버튼의 폼을 토글로 보이기/숨기기
            if (reviewForm.style.display === 'none') {
                reviewForm.style.display = 'block';
            } else {
                reviewForm.style.display = 'none';
            }
        });
    });

    function deleteAlarm(){
        return confirm("리뷰를 삭제하시겠습니까?");
    }

    function submitAlarm(){
        return confirm("리뷰를 작성하시겠습니까?");
    }
</script>
</body>
</html>
