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

                if (response.user_id) {
                    // 로그인된 경우
                    $('#before-login').hide();
                    console.log(" 프로필 표시");
                    $('#after-login').show();

                    //프로필사진설정
					let profileImage =  response.profileImageUrl ||
 					'/images/default-profile.png';  // 기본 프로필 이미지 경로 설정해야댐
                    $('#profile-img').attr('src', profileImage);  // 프로필 이미지 업데이트
                    
                    
                    console.log(response.user_nickname);
                    console.log(response);
                    //프로필정보가ㅈ고오기
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
//로그인안한상태에서 이함수는오류처리되고있음..
// 페이지 로드 시 로그인 상태 확인
checkLoginStatus();
});