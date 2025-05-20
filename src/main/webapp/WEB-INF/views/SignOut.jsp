<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	if (user_id == null) {
		response.sendRedirect("Login.jsp"); // out.println 제거
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link rel="stylesheet" href="./css/PersonalInformation.css">
</head>

<body>
<form name="SignOut" action="../Page/SignOut.do" method="post">
	<div class="SignOutModal">
		<p class="confirmSignOutA">정말 탈퇴하시겠습니까?</p>
		<p class="confirmSignOutB">비밀번호를 입력해주세요.</p>

		<input type="password" name="user_passwd" required />

		<span style="color: red; font-size: 1.2em;">
				<br>
				<%= request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg") %>
			</span>

		<button type="submit" class="SignoutBtn">탈퇴하기</button>
	</div>
</form>
</body>
</html>
