<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />

<link rel="stylesheet" href="/css/mypage.css?v=<?php echo time(); ?>" />
<link rel="stylesheet" href="/css/intro.css?v=<%= System.currentTimeMillis() %>" />
<script src="/js/mypage.js"></script>
</head>
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<c:import url="../include/introduction-list.jsp" var="intro_list" />

<body>
	<div id="skip_navi">
		<a href="#container">본문 바로가기</a>
	</div>
	<div id="wrap">
		${common_header }
		<main id="mp_container">
			<section class="mypage">
				${intro_list }
				<div class="intro_wrap">
					<div class="introduction">
						<h1 class="one_sentence">자연스럽게 협력하고<br/>즐겁게 성장하는<br/>Hash Map</h1>
						<div class="img_wrap">
							<img src="../images/introduction/intro_team.jpg" alt="소개이미지" />
						</div>
						<div class="txt_wrap">
							<p>팀 Hash Map에는 성장을 즐기는 사람들이 모였습니다.</p>
							<p>개인의 의견을 거리낌 없이 제안하며 프로젝트를 진행하였고,</p>
							<p>혼자서는 못하는 것들을 서로 도우며 함께 성장해 나가고 있습니다.</p>
						</div>
					</div>
					<div class="team_role">
						<h2 class="first">Hash Map은 한달간 이렇게 활동했습니다.</h2>
						<ul class="txt_wrap">
							<li class="txt_box">
								<p class="tit">기획부터 개발까지<br/>팀원 모두가 함께 했어요</p>
								<p>
									기획부터 프론트,백엔드 개발 진행까지<br/>
									모든 팀원이 경험해보기 위해<br/>
									의견을 나누어 역할분배하여<br/>진행하였습니다.
								</p>
								<img src="../images/introduction/team1.png" alt="팀소개" class="team1" />
							</li>
							<li class="txt_box">
								<p class="tit">함께 상의할 뿐 아니라<br/>주도적으로 찾아가요</p>
								<p>
									모든 팀원이 해야할 것을 스스로 찾아요.<br/>
									해야하는 것을 리스트업 한 후<br/>
									개개인이 할 수 있는 것을 찾아 진행해요.
								</p>
								<img src="../images/introduction/team2.png" alt="팀소개" class="team2" />
							</li>							
						</ul>
						<ul class="txt_wrap">
							<li class="txt_box txt_box2">
								<p class="tit">모르는 것은<br/>함께 알아내가며<br/>성장해왔어요</p>
								<p>
									서로가 서로의 분량을 참고 또는 고민하며<br/>
									새로운 것을 알게되고 성장해왔어요<br/>
									또한 스스로 하지 못하는 것을<br/>
									함께 하는 법을 배우기도 했어요
								</p>
								<img src="../images/introduction/team3.png" alt="팀소개" class="team3" />
							</li>
							<li class="txt_box txt_box2">
								<p class="tit">서로를 신뢰하고<br/>진행상황을 투명하게<br/>공유해요</p>
								<p>
									개개인의 업무를 공평하게 분배 후<br/>
									진행 및 업데이트 상황을 공유합니다.<br/>
									서로가 맡은 바를 다 할 수 있도록<br/>믿고 기다려줘요.
								</p>
								<img src="../images/introduction/team4.png" alt="팀소개" class="team4" />
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