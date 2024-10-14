<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<script>
	window.onload = function() {
		const resultMsg = '<%=request.getAttribute("resultMsg") != null ? request.getAttribute("resultMsg") : ""%>
	';
		if (resultMsg) {
			alert(resultMsg);
		}
	};
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCA0TzsH1iRaVCQSJCc8BzZHmGKmpNJhKY&callback=initMap"
	async defer></script>
<script>
	function initMap() {
		// 지오코더 생성
		var geocoder = new google.maps.Geocoder();
		var address = "서울특별시 종로구 삼일대로17길 51"; // 표시할 주소

		// 주소로 좌표 검색
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status === 'OK') {
				// 지도를 해당 좌표로 설정
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 15,
					center : results[0].geometry.location
				});

				// 마커를 지도에 추가
				var marker = new google.maps.Marker({
					position : results[0].geometry.location,
					map : map
				});
			} else {
				alert('지도 로드에 실패했습니다: ' + status);
			}
		});
	}
</script>
<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<h1>오시는 길</h1>
			<section class="my_page">
				<div class="my_list">
					<ul class="depth1">
						<li class="list_title on"><a href="/introduction/location.do">학원
								위치</a></li>
					</ul>
				</div>
				<div class="map_wrap" style="width: 100%; overflow: hidden">
					<div class="academy_location" id="map"></div>
					<div class="location_txt">
						<img src="../images/introduction/intro_location.png" alt="오시는길" />
						<p>서울특별시 종로구 삼일대로17길 51 5층 더조은컴퓨터아카데미</p>
					</div>
					<div class="loction_way">
						<p>교통편</p>
						<ul class="way">
							<li class="bus">
								<img src="../images/introduction/intro_bus.png" />
								<span class="txt">
									<p>버스 <br /> 종로 2가역하차</p>
								</span>
							</li>
							<li class="subway">
								<img src="../images/introduction/intro_subway.png" />
								<span class="txt">
									<p>지하철 <br /> 종각역 4번 출구 도보로 4분, 을지로입구역 3번 출구 도보로 7분</p>
								</span>
							</li>
						</ul>
					</div>
				</div>

			</section>
		</main>
		<footer id="footer">
			<div class="inner">${common_footer}</div>
		</footer>
</body>
</html>