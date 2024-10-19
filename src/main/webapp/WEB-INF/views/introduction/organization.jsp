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
						<h1 class="one_sentence">개성있는 팀원들의 유쾌한 협업이 이루어지는 HashMap</h1>
						<div class="img_wrap">
							<img src="../images/introduction/intro_main.png" alt="소개이미지" />
						</div>
						<div class="txt_wrap">
							<p>팀 HashMap은 성장을 즐기는 사람들로 이루어져있습니다.</p>
							<p>번뜩이는 아이디어로 프로젝트를 진행하였고,</p>
							<p>존중과 협력으로 여정을 함께했습니다.</p>
						</div>
					</div>
					<div class="team_role">
						<h2 class="first">HashMap은 한달간 이렇게 활동했습니다.</h2>
						<ul class="txt_wrap">
							<li class="txt_box">
								<p class="tit">기획부터 개발까지<br/>팀원 모두가 함께 했어요</p>
								<p>
									기획부터 프론트,백엔드 개발 진행까지<br/>
									모든 팀원이 함께했어요.<br/>
									커뮤니케이션을 통해 역할을 배분,<br/>수행했어요.
								</p>
								<img src="../images/introduction/team1.png" alt="팀소개" class="team1" />
							</li>
							<li class="txt_box">
								<p class="tit">함께 상의할 뿐 아니라<br/>주도적으로 찾아가요</p>
								<p>
									모든 팀원이 해야할 것을 스스로 찾아요.<br/>
									직면한 과제를 리스트업 한 후<br/>
									개개인이 할 수 있는 것을 찾아 수행해요.
								</p>
								<img src="../images/introduction/team2.png" alt="팀소개" class="team2" />
							</li>							
						</ul>
						<ul class="txt_wrap">
							<li class="txt_box txt_box2">
								<p class="tit">함께 고민하며<br/>성장했어요</p>
								<p>
									개인의 고충은 팀의 고충이에요.<br/>
									함께 고민하며 해결 방법을 모색했으며<br />
									팀으로의 협력, 협업을 배웠어요.
								</p>
								<img src="../images/introduction/team3.png" alt="팀소개" class="team3" />
							</li>
							<li class="txt_box txt_box2">
								<p class="tit">서로를 신뢰하고<br/>진행상황을 공유해요</p>
								<p>
									개개인의 업무를 적절히 분배 하고<br/>
									진행 및 업데이트 상황을 공유해요.<br/>
									팀원을 믿고 격려해요.
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