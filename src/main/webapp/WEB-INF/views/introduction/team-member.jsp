<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<c:import url="../include/head.jsp" />
	<link rel="stylesheet" href="/css/mypage.css?v=<%= System.currentTimeMillis() %>" />
	<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
</head>
<body>
	<c:import url="../include/header.jsp" var="common_header" />
	<c:import url="../include/footer.jsp" var="common_footer" />

	<script>
		window.onload = function() {
			const resultMsg = '<%= request.getAttribute("resultMsg") != null ? request.getAttribute("resultMsg") : "" %>';
			if (resultMsg) {
				alert(resultMsg);
			}
		};
	</script>
	<script>
		function scrollToMember(memberId) {
			const memberElement = document.getElementById(memberId);
			if (memberElement) {
				memberElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
			}
		}
	</script>

	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header}
		<main id="mp_container">
			<h1>조직도</h1>
			<section class="my_page">
				<div class="my_list team_list">
					<ul class="depth1">
						<li class="list_title on">
							<a href="/introduction/organization.do" style="color: var(--txt-color-400);">팀 이름</a>
						</li>
					</ul>
					<ul class="depth1">
						<li class="list_title">
							<a href="/introduction/organization.do" style="color: var(--point-color1);">팀원 소개</a>
						</li>
						<ul class="depth2">
							<li><a href="javascript:void(0);" onclick="scrollToMember('kang')">강인구</a></li>
							<li><a href="javascript:void(0);" onclick="scrollToMember('park')">박여은</a></li>
							<li><a href="javascript:void(0);" onclick="scrollToMember('min')">민경준</a></li>
							<li><a href="javascript:void(0);" onclick="scrollToMember('yuk')">육현희</a></li>
						</ul>
					</ul>
				</div>
				<div class="my_info_wrap">
					<div class="tit_wrap">
						<h2>Hash Map</h2>
					</div>
					<div class="my_info">
						<div class="my_mile box1" id="kang" style="padding: 50px 50px; height:350px">
							<div class="top1">
								<img src="/images/gang.jpg" alt="강인구 사진" style="width:200px; height:250px;" />
								<div class="member_wrap" style="display:flex;">
									<strong>팀장 강인구</strong>
									<p class="member_name">각자 맡은 역할 작성</p>
								</div>
							</div>
						</div>
						<div class="my_mile box1" id="park" style="padding: 50px 50px; height:350px">
							<div class="top1">
								<img src="/images/park.png" alt="박여은 사진" style="width:200px; height:250px;" />
								<div class="member_wrap" style="display:flex;">
									<strong>박여은</strong>
									<p class="member_name">각자 맡은 역할 작성</p>
								</div>
							</div>
						</div>
						<div class="my_mile box1" id="min" style="padding: 50px 50px; height:350px">
							<div class="top1">
								<img src="/images/min.jpg" alt="민경준 사진" style="width:200px; height:250px;" />
								<div class="member_wrap" style="display:flex;">
									<strong>민경준</strong>
									<p class="member_name">각자 맡은 역할 작성</p>
								</div>
							</div>
						</div>
						<div class="my_mile box1" id="yuk" style="padding: 50px 50px; height:350px">
							<div class="top1">
								<img src="/images/yuk.jpg" alt="육현희 사진" style="width:200px; height:250px;" />
								<div class="member_wrap" style="display:flex;">
									<strong>육현희</strong>
									<p class="member_name">각자 맡은 역할 작성</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		<footer id="footer">
			<div class="inner">
				${common_footer}
			</div>
		</footer>
	</div>
</body>
</html>
