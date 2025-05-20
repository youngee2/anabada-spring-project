<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="Header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");

	if (user_id == null) {
		response.sendRedirect("Login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원 정보</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/PersonalInformation.css">
</head>

<body style="margin:0;">
<section class="Personalinfo">
	<h1 class="personalA-title">회원정보</h1>
	<hr class="personal-lineA">
	<h3 class="personalB-subtitle">회원 정보 변경</h3>

	<table class="PersonalC-table">
		<tr>
			<th>이름</th>
			<td><c:out value="${dto.name}" /></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><c:out value="${dto.nickname}" /></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><c:out value="${dto.user_id}" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>***********</td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td><c:out value="${dto.email}" /></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><c:out value="${dto.phone_num}" /></td>
		</tr>
	</table>

	<div class="updateInfo">
		<a href="../Page/UpdateInfo.do">정보 수정</a>
	</div>

	<h3 class="personalB-subtitle">회원 탈퇴</h3>
	<hr class="personal-lineB">

	<div class="PersonalE-SignOut">
		<h3 class="btn SignOutBtn">
			<a href="./SignOut.jsp">탈퇴하기</a>
		</h3>
	</div>

	<hr class="personal-lineB">
</section>

<script>
	const modals = document.getElementsByClassName("modal");
	const btns = document.getElementsByClassName("btn");
	const spanes = document.getElementsByClassName("close");
	const funcs = [];

	function Modal(num) {
		return function () {
			btns[num].onclick = function () {
				modals[num].style.display = "block";
			};
			spanes[num].onclick = function () {
				modals[num].style.display = "none";
			};
		};
	}

	for (let i = 0; i < btns.length; i++) {
		funcs[i] = Modal(i);
	}
	for (let j = 0; j < btns.length; j++) {
		funcs[j]();
	}

	window.onclick = function (event) {
		if (event.target.className === "modal") {
			event.target.style.display = "none";
		}
	};
</script>

<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>
</html>
