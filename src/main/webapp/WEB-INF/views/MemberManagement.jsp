<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.example.demo.board.report.ReportDAO"%>
<%@ page import="com.example.demo.board.report.ReportDTO"%>
<%@ page import="com.example.demo.member.MemberDAO"%>
<%@ page import="com.example.demo.member.MemberDTO"%>

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
	<title>회원 관리 페이지</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="./css/HeaderFooter.css">
	<link rel="stylesheet" href="./css/PersonalInformation.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<%@ include file="Header.jsp" %>

	<style>
		/* 기존 스타일 유지 */
	</style>
</head>

<body style="margin: 0;">
<section class="viewAllMember">
	<h1 style="text-align: center; font-size: 2vw;">관리자 회원 관리</h1>
	<hr>
	<h2>전체 회원 테이블</h2>

	<form method="get">
		<table>
			<tr>
				<td>
					<select class="form-control" name="searchField">
						<option value="report">회원 상태</option>
						<option value="user_id">회원 아이디</option>
						<option value="name">회원 이름</option>
						<option value="nickname">회원 닉네임</option>
						<option value="email">회원 메일</option>
						<option value="phone_num">회원 전화번호</option>
					</select>
				</td>
				<td><input type="text" class="form-control" name="searchWord" placeholder="검색어 입력" maxlength="100"></td>
				<td><button type="submit">검색</button></td>
			</tr>
		</table>
	</form>

	<div style="width: 100%; height: 500px; overflow: auto">
		<table id="memberTable">
			<caption class="total">총 회원 수: ${fn:length(memberList)} 명</caption>
			<p>* 상태 1은 정지된 회원, 0은 정상회원을 뜻합니다.</p>
			<tr class="title_user">
				<th>상태</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>받은 신고 수</th>
			</tr>

			<c:choose>
				<c:when test="${empty memberList}">
					<tr><td colspan="8" align="center">가입한 회원이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${memberList}">
						<tr style="${row.report ne 0 ? 'color: red' : ''}">
							<td><c:out value="${row.report}" /></td>
							<td><c:out value="${row.user_id}" /></td>
							<td><c:out value="${row.nickname}" /></td>
							<td><c:out value="${row.name}" /></td>
							<td><c:out value="${row.user_passwd}" /></td>
							<td><c:out value="${row.email}" /></td>
							<td><c:out value="${row.phone_num}" /></td>
							<td><c:out value="${row.countReport}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

	<div id="clickMember">* 회원을 선택해주세요.</div>

	<!-- 버튼 처리 -->
	<div class="form_btn">
		<form method="get" action="../Page/MembershipSuspension.do" onsubmit="return check1()">
			<input type="hidden" name="user_id" id="user_id1" />
			<button type="submit" id="btn1">회원 정지 하기</button>
		</form>

		<form method="get" action="../Page/liftOff.do" onsubmit="return check2()">
			<input type="hidden" name="user_id" id="user_id2" />
			<button type="submit" id="btn2">회원 정지 해제 하기</button>
		</form>

		<form method="get" action="../Page/ManageSignOut.do" onsubmit="return check3()">
			<input type="hidden" name="user_id" id="user_id3" />
			<button type="submit">회원 탈퇴 처리 하기</button>
		</form>
	</div>

	<hr>
	<h2>전체 신고 테이블</h2>

	<form method="get">
		<table>
			<tr>
				<td>
					<select class="form-control" name="reportSearchField">
						<option value="boardName">신고 게시판</option>
						<option value="reportedNickname">피신고자 닉네임</option>
						<option value="reporterNickname">신고자 닉네임</option>
						<option value="reason">신고 사유</option>
						<option value="reportDate">신고 날짜</option>
					</select>
				</td>
				<td><input type="text" class="form-control" name="reportSearchWord" placeholder="검색어 입력" maxlength="100"></td>
				<td><button type="submit">검색</button></td>
			</tr>
		</table>
		<p>* 게시판은 교환, 거래, 판매 게시판으로 나누어져 있습니다.</p>
	</form>

	<div style="width: 100%; height: 500px; overflow: auto">
		<table id="reportTable">
			<caption class="total">총 신고 수: ${fn:length(reportList)} 회</caption>
			<tr class="title_report">
				<th>신고 위치</th>
				<th>피신고자</th>
				<th>신고자</th>
				<th style="width: 57%;">신고 사유</th>
				<th>신고 날짜</th>
				<th>누적 신고 번호</th>
			</tr>

			<c:choose>
				<c:when test="${empty reportList}">
					<tr><td colspan="6" align="center">신고 내역이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${reportList}">
						<tr>
							<td><c:out value="${row.boardName}" /></td>
							<td><c:out value="${row.reportedNickname}" /></td>
							<td><c:out value="${row.reporterNickname}" /></td>
							<td><c:out value="${row.reason}" /></td>
							<td><c:out value="${row.reportDate}" /></td>
							<td><c:out value="${row.countReport}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

	<div id="clickReport">* 신고 내역을 선택해주세요.</div>

	<form method="get" action="../Page/deleteReport.do" onsubmit="return check6()">
		<input type="hidden" name="reportedNickname" id="reportedNickname" />
		<input type="hidden" name="reporterNickname" id="reporterNickname" />
		<input type="hidden" name="reason" id="reason" />
		<button type="submit" id="btn6">신고 내역 삭제하기</button>
	</form>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>

<script>
	// 회원 테이블 row 클릭
	$("#memberTable tr").click(function () {
		const td = $(this).children();
		const state = td.eq(0).text();
		const user_id = td.eq(1).text();
		const name = td.eq(3).text();
		const nickname = td.eq(2).text();
		const email = td.eq(5).text();
		const phone = td.eq(6).text();
		const reportCount = td.eq(7).text();

		const info = `*선택한 회원 : 상태: <font color='blue'>${state}</font>, 아이디: <font color='blue'>${user_id}</font>, 이름: <font color='blue'>${name}</font>, 닉네임: <font color='blue'>${nickname}</font>, 이메일: <font color='blue'>${email}</font>, 전화번호: <font color='blue'>${phone}</font>, 받은 신고 수: <font color='blue'>${reportCount}</font>`;

		$("#clickMember").html(info);
		$("#user_id1, #user_id2, #user_id3").val(user_id);
		$("#btn1").toggle(state !== "1");
		$("#btn2").toggle(state === "1");
	});

	// 신고 테이블 row 클릭
	$("#reportTable tr").click(function () {
		const td = $(this).children();
		const boardName = td.eq(0).text();
		const reported = td.eq(1).text();
		const reporter = td.eq(2).text();
		const reason = td.eq(3).text();
		const date = td.eq(4).text();
		const count = td.eq(5).text();

		const info = `*선택한 회원 : 신고 게시판: <font color='blue'>${boardName}</font>, 피신고자: <font color='blue'>${reported}</font>, 신고자: <font color='blue'>${reporter}</font>, 신고사유: <font color='blue'>${reason}</font>, 신고 날짜: <font color='blue'>${date}</font>, 누적 신고 번호: <font color='blue'>${count}</font>`;

		$("#clickReport").html(info);
		$("#reportedNickname").val(reported);
		$("#reporterNickname").val(reporter);
		$("#reason").val(reason);
	});

	// 각 버튼 확인
	function check1() {
		if (!$("#user_id1").val()) return alert("회원을 먼저 선택해주세요."), false;
		return confirm(`'${$("#user_id1").val()}'님을 회원 정지 상태로 바꾸시겠습니까?`);
	}
	function check2() {
		if (!$("#user_id2").val()) return alert("회원을 먼저 선택해주세요."), false;
		return confirm(`'${$("#user_id2").val()}'님을 정상 회원 상태로 바꾸시겠습니까?`);
	}
	function check3() {
		if (!$("#user_id3").val()) return alert("회원을 먼저 선택해주세요."), false;
		return confirm(`'${$("#user_id3").val()}'님을 탈퇴처리 하시겠습니까?`);
	}
	function check6() {
		if (!$("#reportedNickname").val()) return alert("신고 내역을 먼저 선택해주세요."), false;
		return confirm(`'${$("#reporterNickname").val()}'님이 신고한 '${$("#reportedNickname").val()}'님의 신고내역을 삭제하시겠습니까?`);
	}
</script>
</body>
</html>
