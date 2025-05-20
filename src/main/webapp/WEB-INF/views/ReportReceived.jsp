<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");
	System.out.println(user_id + " 확인");

	if (user_id == null) {
		response.sendRedirect("Login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>신고하기</title>
	<link rel="stylesheet" href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css">
	<script src="https://kit.fontawesome.com/0377843c9b.js" crossorigin="anonymous"></script>
	<style>
		* { font-family: 'NanumBarunGothic'; }
		.report { text-align: center; }
		.report textarea {
			width: 80%;
			height: 15vw;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 1.5vw;
			resize: none;
		}
		.report button {
			width: 10vw;
			height: 3rem;
			font-size: 1.5vw;
			padding: 2px;
			margin-top: 1%;
			background-color: #b9D8E0;
			border: 2px solid #b9D8E0;
			color: #2B5566;
		}
		.fa-solid {
			margin-top: 2vw;
			font-size: 2vw;
			color: #2B5566;
		}
		.error { color: red; }
	</style>
</head>

<body>
<div class="report">
	<hr>
	<i class="fa-solid fa-car-on"></i>
	<h1>신고하기</h1>
	<p>*신고 사유를 구체적으로 작성해주세요. 거짓 신고는 제재를 받을 수 있습니다.</p>

	<form name="report" method="post" action="../Page/ReportReceived.do" onsubmit="return reportCheck()">
		<textarea name="reason" id="reason" placeholder="신고사유를 자세히 작성해주세요.(거짓 신고는 제재를 받을 수 있습니다.)"></textarea>
		<div id="reasonError" class="error"></div>
		<hr>
		<button type="submit" class="next_btn">제출하기</button>
	</form>
</div>

<script>
	function reportCheck() {
		const reason = document.getElementById("reason").value.trim();

		if (reason === "") {
			document.getElementById("reasonError").innerText = "신고 사유를 입력해주세요.";
			return false;
		} else if (reason.length < 30) {
			document.getElementById("reasonError").innerText = "신고 사유가 너무 짧습니다. 최소 30자 이상으로 적어주세요.";
			return false;
		} else if (reason.length > 200) {
			document.getElementById("reasonError").innerText = "200자 이내로 적어주세요.";
			return false;
		} else {
			document.getElementById("reasonError").innerText = "";
			return true;
		}
	}
</script>

<c:if test="${not empty msg}">
	<script type="text/javascript">
		alert('${msg}');
		location.href = '${url}';
	</script>
</c:if>
</body>
</html>
