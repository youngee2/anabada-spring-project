<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.demo.board.exchange.ExchangeBoardDAO" %>
<%@ page import="com.example.demo.board.exchange.ExchangeBoardDTO" %>
<%@ include file="./Header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>교환글 수정</title>
	<link rel="stylesheet" type="text/css" href="./css/HeaderFooter.css">
	<link rel="stylesheet" type="text/css" href="./css/SellBoard.css">
	<script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
</head>
<body style="margin:0;">
<%
	String user_id = (String) session.getAttribute("UserId");
	String nickname = (String) session.getAttribute("Nickname");
	String num = request.getParameter("excNum");
	ExchangeBoardDAO dao = new ExchangeBoardDAO();
	ExchangeBoardDTO dto = dao.selectView(num);
	dao.close();

	if (nickname == null || !nickname.equals(dto.getNickname())) {
%>
<script>
	alert('본인만 수정 가능합니다.');
	location.href = './exchangeListPage.do';
</script>
<%
		return;
	}
	dto.setExc_contents(dto.getExc_contents().replaceAll("<br/>", "\r\n"));
%>
<section class="sale">
	<h2>교환글 수정하기</h2>
	<p class="RequiredInput">* 필수항목</p>
	<hr>

	<form name="ExchangeBoard" method="post" enctype="multipart/form-data" action="../Page/SellEditDelete/excEditProcess.jsp">
		<input type="hidden" name="WriteNickname" value="<%= dto.getNickname() %>">
		<input type="hidden" name="exc_num" value="<%= dto.getExc_num() %>">

		<label>* 제목</label>
		<input type="text" name="exc_title" maxlength="50" style="width: 80%;" value="<%= dto.getExc_title() %>" required>
		<hr>

		<label>* 사진 등록</label>
		<input type="file" name="img-upload-input" required>
		<p class="pic_explane">
			* 상품 이미지는 640x640에 최적화 되어 있습니다.<br>
			- 정사각형으로 잘려 등록되며, 클릭 시 원본 확인 가능<br>
			- 순서 변경 가능<br>
			- 큰 이미지일 경우 깨짐 현상 발생 가능
		</p>
		<hr>

		<label>* 상품 상태</label><br>
		<input type="radio" name="exc_condition" value="0" <%= dto.getExc_condition() == 0 ? "checked" : "" %>> 중고
		<input type="radio" name="exc_condition" value="1" <%= dto.getExc_condition() == 1 ? "checked" : "" %>> 새상품
		<hr>

		<label>* 차액 흥정 여부</label><br>
		<input type="radio" name="exc_diff" value="1" <%= dto.getExc_diff() == 1 ? "checked" : "" %>> 가능
		<input type="radio" name="exc_diff" value="0" <%= dto.getExc_diff() == 0 ? "checked" : "" %>> 불가능
		<hr>

		<label>교환 희망 물품</label>
		<input type="text" name="exc_wish" style="width: 80%;" value="<%= dto.getExc_wish() %>">
		<hr>

		<label>* 상품 설명</label>
		<textarea class="sell_description" name="exc_contents" maxlength="1000" required><%= dto.getExc_contents() %></textarea>
		<hr>

		<input type="submit" value="작성 완료" class="btn submitBtn">
	</form>
</section>
<%@ include file="./HeaderFooter/Footer.jsp" %>
</body>
</html>
