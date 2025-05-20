<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	System.out.println(user_id + "확인");

	if (user_id == null) {
		response.sendRedirect("Login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>정지된 회원입니다</title>
	<link rel="stylesheet" href="./css/HeaderFooter.css">
	<script src="https://kit.fontawesome.com/0377843c9b.js" crossorigin="anonymous"></script>
</head>

<body>
<%@ include file="Header.jsp" %>

<div style="margin: 5% 25%; line-height: 2rem; text-align: center;">
	<div style="font-size: 2rem;">
		<span class="fa-solid fa-ban" style="color: red;"></span>
		<span>정지된 계정입니다</span>
		<hr>
	</div>
	<div style="font-size: 1rem;">
		규칙 위반으로 계정이 정지되었습니다.<br>
		계정이 비활성화 되었으므로 로그인할 수 없습니다.<br>
		이용 제한 사유 조회 및 해제 또는 계정 탈퇴를 요청하고 싶으시다면 아래로 문의해주세요.<br>
		<hr>
	</div>
	<div>
		<span class="fa-solid fa-envelope"></span> : songsunkite@gmail.com<br>
		<span class="fa-solid fa-phone-volume"></span> : 031-0000-0000
	</div>
</div>

<%@ include file="./HeaderFooter/Footer.jsp" %>
</body>
</html>
