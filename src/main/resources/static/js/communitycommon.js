$(document).ready(function(){
 
    // 맨위로 버튼 
    $(window).on('scroll', function () {
        toggleScrollButton();
    });

    function toggleScrollButton() {
        let $toTopBtn = $("#to_top_Btn");
        if ($(window).scrollTop() > 800) {
            $toTopBtn.css("display", "flex");
        } else {
            $toTopBtn.css("display", "none");
        }
    }

    $("#to_top_Btn").on("click", function () {
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });

    // 사이드바 링크 클릭 시 스타일 변경
    const navLinks = $('.nav-link');

    navLinks.on('click', function() {
        // 모든 링크에서 active 클래스 제거
        navLinks.removeClass('active');

        // 클릭된 링크에 active 클래스 추가
        $(this).addClass('active');
    });
    
    // 공지 숨기기 기능
    $('#hideNoticeCheckbox').on('change', function() {
        if ($(this).is(':checked')) {
            // 체크박스가 선택된 경우 공지 숨기기
            $('.notice').hide();
        } else {
            // 체크박스 선택 해제된 경우 공지 다시 보이기
            $('.notice').show();
        }
    });

    // 로그인 상태를 확인하는 함수
    function checkLoginStatus() {
        $.ajax({
            type: "GET",
            url: "/checkLoginStatus",
            success: function(response) {

                if (response.user_id) {
                    // 로그인된 경우
                    $('#before-login').hide();
                    console.log(" 프로필 표시");
                    $('#after-login').show();

                    // 프로필 사진 설정
                    let profileImage = response.profileImageUrl;  // 사용자 프로필 이미지 URL을 설정
					$('#profile-img').attr('src', profileImage); 
                    
                    console.log(response);
                    // 프로필 정보 가져오기
                    $('#nickname').text(response.user_nickname);
                    $('#timestamp').text(response.user_timestamp);
                    $('#level').text(response.user_rate);
                } else {
                    // 로그인되지 않은 경우
                    $('#before-login').show();
                    $('#after-login').hide();
                }
            },
            error: function(xhr, status, error) {
                if (xhr.status === 401) {
                    // 401 Unauthorized인 경우: 로그인되지 않은 상태
                    $('#before-login').show();
                    $('#after-login').hide();
                } else {
                    alert("로그인 상태 확인 실패: " + status + " - " + error);
                }
            }
        });
    }
    // 페이지 로드 시 로그인 상태 확인
    checkLoginStatus();

    // 리스트 보기와 그리드 보기 버튼 클릭 이벤트 처리
    $('#viewListBtn').on('click', function() {
        console.log("List View button clicked");  // 클릭 여부 확인
        $('#postsContainer').removeClass('grid-view').addClass('list-view');
        $('.list-view-content').show();
        $('.grid-view-content').hide();
    });

    $('#viewGridBtn').on('click', function() {
        console.log("Grid View button clicked");  // 클릭 여부 확인
        $('#postsContainer').removeClass('list-view').addClass('grid-view');
        $('.list-view-content').hide();
        $('.grid-view-content').show();
    });

    // 초기 로드 시 리스트 보기를 기본으로 설정
    $('#postsContainer').addClass('list-view');
    $('.list-view-content').show();
    $('.grid-view-content').hide();
});
