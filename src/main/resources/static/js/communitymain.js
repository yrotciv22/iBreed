/**
 * 커뮤니티메인 사이드바 클릭하면 검은색상,볼드로변경
 */
 
 
$(document).ready(function() {
    const navLinks = $('.nav-link');

    navLinks.on('click', function() {
        // 모든 링크에서 active 클래스 제거
        navLinks.removeClass('active');

        // 클릭된 링크에 active 클래스 추가
        $(this).addClass('active');
    });

    // 로그인 상태를 확인하는 함수
    function checkLoginStatus() {
        $.ajax({
            type: "GET",
            url: "/checkLoginStatus",
            success: function(response) {
                if (response.loggedIn) {
                    // 로그인된 경우
                    $('#before-login').hide();
                    $('#after-login').show();
                    //프로필사진설정
					let profileImage = response.profileImage ||
 					'/images/default-profile.png';  // 기본 프로필 이미지 경로 설정해야댐
                    $('#profile-img').attr('src', profileImage);  // 프로필 이미지 업데이트
                    
                    
                    
                    //프로필정보가ㅈ고오기
                    $('#nickname').text(response.user.nickname);
                    $('#join-date').text(response.user.joinDate);
                    $('#level').text(response.user.level);
                } else {
                    // 로그인되지 않은 경우
                    $('#before-login').show();
                    $('#after-login').hide();
                }
            },
            error: function() {
                alert("로그인 상태 확인 실패");
            }
        });
    }

    // 페이지 로드 시 로그인 상태 확인
    checkLoginStatus();
});
