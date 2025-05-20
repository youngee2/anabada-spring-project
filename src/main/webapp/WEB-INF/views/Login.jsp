<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="Header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
</head>

<body style="margin:0;">

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");

	if (user_id != null) {
%>
<script>
	alert('이미 로그인이 되어있습니다.');
	location.href = 'tradeListPage.do?category=7';
</script>
<%
		return;
	}
%>

<section style="margin: 5% 35% 5% 35%">
	<hr>
	<div class="Login_form" style="font-size: 1vw">
		<h3>Login to ANABADA</h3>

		<form style="margin-top: 3vw" action="../Page/Login.do" method="post" name="loginFrm"
			  onsubmit="return validateForm(this);">
			<div class="form-group">
				<label for="user_id">ID</label>
				<input type="text" id="user_id" name="user_id" required style="font-size: 1vw" />
			</div>
			<div class="form-group">
				<label for="user_passwd">Password</label>
				<input type="password" id="user_passwd" name="user_passwd" required style="font-size: 1vw" />
				<span style="color: red; font-size: 1.2em;">
          <%= request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg") %>
        </span>
			</div>
			<div class="GoSignUp">
				<input type="submit" value="Login" class="submit" id="btnLogin">
				<p>Not Yet Registered? <a href="../Page/SignUp1.jsp">Sign Up</a></p>
			</div>
			<hr>
		</form>
	</div>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>

<script>
	function validateForm(form) {
		if (!form.user_id.value.trim()) {
			alert("아이디를 입력하세요.");
			form.user_id.focus();
			return false;
		}
		if (!form.user_passwd.value.trim()) {
			alert("비밀번호를 입력하세요.");
			form.user_passwd.focus();
			return false;
		}
		return true;
	}
</script>

</body>
</html>
