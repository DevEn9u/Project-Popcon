<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:import url="../include/head.jsp" />
<c:import url="../include/header.jsp" var="common_header" />
<c:import url="../include/footer.jsp" var="common_footer" />
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
	  <main id="container">
		<h2>아이디 중복 확인</h2>
		<form name="IdCheckFrm" method="post" action="./checkId.do">
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="id" value="<%= request.getParameter("id")%>"/>
			<button type="submit" onclick="checkId()" class="btn">확인</button>
		</form>
	  </main>
  </div>
</body>
</html>