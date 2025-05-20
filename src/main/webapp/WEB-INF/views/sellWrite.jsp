<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="Header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");

	if (user_id == null) {
		response.sendRedirect("tradeListPage.do?category=7");
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>판매글 작성</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/HeaderFooter.css">
	<link rel="stylesheet" href="./css/SellBoard.css">
	<script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body style="margin:0;">
<section class="sale">
	<h2>판매글 작성하기</h2>
	<p class="RequiredInput">* 필수항목</p>
	<hr>

	<form name="SellBoard" method="post" enctype="multipart/form-data" action="../Page/sellWriteProcess.jsp">
		<p><span class="RequiredInput">*</span> 제목</p>
		<input type="text" name="title" maxlength="50" placeholder="제목을 입력해주세요." required>
		<hr>

		<p><span class="RequiredInput">*</span> 사진 등록</p>
		<input type="file" name="img-upload-input" accept="image/*" required>
		<p class="pic_explane">
			* 상품 이미지는 640x640에 최적화되어 있습니다.<br>
			- 정사각형으로 잘려서 등록되며, 이미지가 깨질 수 있습니다.
		</p>
		<hr>

		<p><span class="RequiredInput">*</span> 상품 상태</p>
		<label><input type="radio" name="sell_condition" value="used" required> 중고</label>
		<label><input type="radio" name="sell_condition" value="new"> 새상품</label>
		<hr>

		<p><span class="RequiredInput">*</span> 가격</p>
		<input type="number" name="sell_price" placeholder="0" oninput="maxLengthCheck(this)" required style="text-align: right;"> 원
		<hr>

		<p><span class="RequiredInput">*</span> 카테고리 선택</p>
		<select name="category" required>
			<option value="" disabled selected>카테고리 선택</option>
			<option value="0">패션/잡화/뷰티</option>
			<option value="1">테크/가전</option>
			<option value="2">홈/리빙</option>
			<option value="3">베이비/키즈</option>
			<option value="4">반려동물</option>
			<option value="5">게임/취미(문화)</option>
			<option value="6">기타</option>
		</select>
		<hr>

		<p><span class="RequiredInput">*</span> 상품 설명</p>
		<textarea name="contents" maxlength="1000" placeholder="상품에 대한 내용을 자세하게 설명해주세요.&#13;&#10;(가품 및 판매 금지 물품은 게시가 제한될 수 있어요.)" required></textarea>
		<hr>

		<input type="submit" value="작성 완료" class="btn submitBtn">
	</form>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>

<script>
	function maxLengthCheck(obj) {
		const maxLen = 10;
		if (obj.value.length > maxLen) {
			obj.value = obj.value.slice(0, maxLen);
		}
	}
</script>
</body>
</html>
