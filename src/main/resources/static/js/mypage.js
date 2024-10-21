$(document).ready(function() {
    // 현재 URL 경로 가져오기
    const currentPath = window.location.pathname;

    // URL 경로에 따라 활성화할 항목 결정
    $('.depth1 .depth2 li').each(function() {
		if (currentPath === '/mypage/main.do') {
			$('.list_title:first').addClass('on');
		}
        const link = $(this).find('a');
        if (link.length && link[0].href === window.location.href) {
            $(this).addClass('on'); // 활성화 클래스 추가
			// 하위 메뉴가 활성화되면 상위 메뉴도 활성화
            $(this).closest('.list_title').addClass('on');
        }		
    });
});
