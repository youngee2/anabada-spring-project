<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판매글 등록</title>
</head>
<body>
<h2>판매글 작성</h2>
<form method="post" action="${pageContext.request.contextPath}/sell/write" enctype="multipart/form-data">
	제목: <input type="text" name="title" required><br><br>
	카테고리:
	<select name="category">
		<option value="0">패션/잡화/뷰티</option>
		<option value="1">테크/가전</option>
		<option value="2">홈/리빙</option>
		<option value="3">베이비/키즈</option>
		<option value="4">반려동물</option>
		<option value="5">게임/취미</option>
		<option value="6">기타</option>
	</select><br><br>

	상태:
	<input type="radio" name="sell_condition" value="new" required>새상품
	<input type="radio" name="sell_condition" value="used">중고<br><br>

	가격: <input type="number" name="sell_price" required><br><br>

	이미지: <input type="file" name="file" required><br><br>

	설명:<br>
	<textarea name="contents" rows="6" cols="50" required></textarea><br><br>

	<button type="submit">등록하기</button>
</form>
</body>
</html>
