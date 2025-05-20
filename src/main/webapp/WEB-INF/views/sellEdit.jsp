<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./Header.jsp"%>
<%@ page import="com.example.demo.board.trade.SellBoardDAO" %>
<%@ page import="com.example.demo.board.trade.SellBoardDTO" %>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = (String) session.getAttribute("UserId");
	String nickname = (String) session.getAttribute("Nickname");

	String num = request.getParameter("sellNum");
	SellBoardDAO dao = new SellBoardDAO();
	SellBoardDTO dto = dao.selectView(num);
	dto.setSell_contents(dto.getSell_contents().replaceAll("<br/>", "\r\n"));
	dao.close();

	if (nickname == null || !nickname.equals(dto.getNickname())) {
		response.sendRedirect("./tradeListPage.do?category=7");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>판매글 수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/HeaderFooter.css">
	<link rel="stylesheet" href="./css/SellBoard.css">
	<script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
<section class="sale">
	<h2>판매글 수정하기</h2>
	<p class="RequiredInput">* 필수항목</p>
	<hr>

	<form name="SellBoard" method="post" enctype="multipart/form-data" action="../Page/SellEditDelete/sellEditProcess.jsp">
		<input type="hidden" name="WriteNickname" value="<%= dto.getNickname() %>">
		<input type="hidden" name="sell_num" value="<%= dto.getSell_num() %>">

		<p><span class="RequiredInput">*</span> 제목</p>
		<input type="text" name="title" maxlength="50" value="<%= dto.getSell_title() %>" required>
		<hr>

		<p><span class="RequiredInput">*</span> 사진 등록</p>
		<input type="file" name="img-upload-input" required>
		<hr>

		<p><span class="RequiredInput">*</span> 상품 상태</p>
		<label><input type="radio" name="sell_condition" value="used" <%= dto.getSell_condition() == 2 ? "checked" : "" %>> 중고</label>
		<label><input type="radio" name="sell_condition" value="new" <%= dto.getSell_condition() == 1 ? "checked" : "" %>> 새상품</label>
		<hr>

		<p><span class="RequiredInput">*</span> 가격</p>
		<input type="number" name="sell_price" value="<%= dto.getSell_price() %>" maxlength="10" oninput="maxLengthCheck(this)" required> 원
		<hr>

		<p><span class="RequiredInput">*</span> 카테고리 선택</p>
		<select name="category" required>
			<option value="sell_choose" disabled>카테고리 선택</option>
			<%
				String[] categories = {
						"패션/잡화/뷰티", "테크/가전", "홈/리빙", "베이비/키즈",
						"반려동물", "게임/취미(문화)", "기타"
				};
				for (int i = 0; i < categories.length; i++) {
					String value = "sell_category" + i;
					boolean selected = dto.getSell_category() == i;
			%>
			<option value="<%= value %>" <%= selected ? "selected" : "" %>><%= categories[i] %></option>
			<% } %>
		</select>
		<hr>

		<p><span class="RequiredInput">*</span> 상품 설명</p>
		<textarea name="contents" maxlength="1000" required><%= dto.getSell_contents() %></textarea>
		<hr>

		<input type="submit" class="btn submitBtn" value="수정 완료">
	</form>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>

<script>
	function maxLengthCheck(obj) {
		if (obj.value.length > obj.maxLength) {
			obj.value = obj.value.slice(0, obj.maxLength);
		}
	}
</script>
</body>
</html>
