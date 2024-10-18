<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<div class="title_wrap">
				<h1>관리자 페이지</h1>
				<span></span>
				<h2>문의 채팅방</h2>
			</div>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title"><a href="/adpage/main.do"
							style="color: var(--txt-color-600);">게시물 관리</a></li>
						<ul class="depth2">
							<li><a href="/adpage/popup.do">팝업 게시판</a></li>
							<li class="adpage_freeboard"><a href="/adpage/free.do">자유 게시판</a></li>
						</ul>
						<li class="list_title"><a href="/adpage/user.do"
							style="color: var(--txt-color-600);">유저 관리</a></li>
						<li class="list_title"><a href="/adpage/chat.do"
							style="color: var(--point-color1);">문의 채팅방</a></li>
					</ul>
				</div>
				<div class="my_info_wrap" style="text-align: center;">
					<div class="ad_tit_wrap">
						<h2 class="ad_chat_tit">문의 채팅방 목록</h2>
						<div class="ad_btn_wrap ad_chat_btn_wrap"
							style="text-align: center; display: inline-flex; gap: 20px;">
							<c:forEach var="member" items="${memberList}">
								<button class="btn" id="chatRoom_${member.id}" style="display:flex; flex-direction:column; overflow:hidden;"
									onclick="openChatWin('chat-${member.id}', 'admin')">
									<span class="member_name">${member.name}</span> 채팅방</button>
							</c:forEach>
						</div>

					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
	</div>

	<script>
    // 채팅방 입장 함수
    const openChatWin = (roomId, userId) => {
        const chatUrl = "/chat/index.html#/chat?roomId=" + roomId + "&userId=" + userId;
        window.open(chatUrl, '', 'width=500, height=700');
    };

    // 채팅방 버튼 클릭 이벤트 바인딩
    document.getElementById('chatRoom1').addEventListener('click', function() {
        const userId = "admin"; // 현재 로그인된 유저 ID 가져오기
        const roomId = "chat-user01"; // 채팅방 1의 ID 설정
        console.log("UserId:", userId, "RoomId:", roomId); // 값 확인용 로그
        openChatWin(roomId, userId); // 채팅방 열기
    });

    document.getElementById('chatRoom2').addEventListener('click', function() {
        const userId = "admin"; // 현재 로그인된 유저 ID 가져오기
        const roomId = "chat-user02'/>"; // ChatStart에서 전달된 roomId 값 사용
        console.log("UserId:", userId, "RoomId:", roomId); // 값 확인용 로그
        openChatWin(roomId, userId); // 채팅방 열기
    });

    document.getElementById('chatRoom3').addEventListener('click', function() {
        const userId = "admin"; // 현재 로그인된 유저 ID 가져오기
        const roomId = "chat-user03"; // 채팅방 3의 ID 설정
        console.log("UserId:", userId, "RoomId:", roomId); // 값 확인용 로그
        openChatWin(roomId, userId); // 채팅방 열기
    });
</script>
</body>
</html>
