<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="Header.jsp" %>
<%@ page import="com.example.demo.board.member.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");

	if (user_id != null) {
		response.sendRedirect("tradeListPage.do?category=7");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입 완료 | SignUp3</title>
	<link rel="stylesheet" href="./css/SignUp.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		  rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		  crossorigin="anonymous">
</head>

<body>
<section style="margin: 0 15% 15% 15%">
	<div class="signup_title">회원가입</div>

	<div class="step_title">
		<p>1 약관동의</p>
		<p>2 정보입력</p>
		<p class="step_point_2">3 가입 완료</p>
	</div>

	<hr style="margin-top: 0px">

	<div class="signup_finish_ment">
		<img src="./img/LogoPolarBear.png" alt="아나바다 마크" height="60px">
		<p>
			🎉 축하합니다! 회원가입이 완료되었습니다. <br>
			<span style="color: #337A98">아나바다</span>와 함께 환경을 보호해봐요!
		</p>

		<a class="next_btn_finish" href="tradeListPage.jsp"
		   style="display: block; width: 100%; text-align: center;">🏠 홈으로 돌아가기</a>
	</div>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>
</body>
</html>
