<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>교환 글쓰기</title>
	<link rel="stylesheet" href="./css/HeaderFooter.css">
	<link rel="stylesheet" href="./css/SellBoard.css">
	<script src="https://kit.fontawesome.com/e4982ae3c4.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
</head>

<body style="margin:0;">
<%
	String user_id = (String) session.getAttribute("UserId");
	if (user_id == null) {
%>
<script>
	alert("로그인 후 사용해주세요.");
	location.href = 'exchangeListPage.do';
</script>
<%
		return;
	}
%>
<section class="sale">
	<h2>교환글 작성하기</h2>
	<p class="RequiredInput">* 필수항목</p>
	<hr>

	<form name="ExchangeBoard" method="post" enctype="multipart/form-data" action="../Page/exchangeWriteProcess.jsp">
		<label>* 제목</label><br>
		<input type="text" name="exc_title" maxlength="50" placeholder="제목을 입력해주세요." required><br><hr>

		<label>* 사진등록</label><br>
		<input type="file" name="img-upload-input" required><br>
		<small>* 상품 이미지는 640x640에 최적화 되어 있습니다.</small>
		<hr>

		<label>* 상품상태</label><br>
		<input type="radio" name="exc_condition" value="1" required> 새상품
		<input type="radio" name="exc_condition" value="0"> 중고
		<hr>

		<label>* 차액 흥정 여부</label><br>
		<input type="radio" name="exc_diff" value="1" required> 가능
		<input type="radio" name="exc_diff" value="0"> 불가능
		<hr>

		<label>교환 희망 물품</label><br>
		<input type="text" name="exc_wish" style="width:80%;"><hr>

		<label>* 상품설명</label><br>
		<textarea name="exc_contents" class="sell_description" maxlength="1000" required
				  placeholder="상품에 대한 내용을 자세하게 설명해주세요.&#13;&#10;(가품 및 판매 금지 물품은 게시가 제한될 수 있어요.)"></textarea>
		<hr>

		<input type="submit" value="작성 완료" class="btn submitBtn">
	</form>
</section>

<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>
</html>
