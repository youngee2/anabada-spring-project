<%@page import="com.example.demo.board.message.MessageDAO"%>
<%@page import="com.example.demo.board.message.MessageDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("UserId");

	if (user_id == null) {
%>
<script>
	alert('로그인 후 사용해주세요.');
	window.close();
</script>
<%
		return;
	}

	String receive_nickname = request.getParameter("receive_nickname");
	int receiveidx = Integer.parseInt(request.getParameter("receive_idx"));
	int sendidx = (int)session.getAttribute("Idx");

	MessageDAO dao = new MessageDAO(application);
	List<MessageDTO> messageList = dao.select_Message(sendidx, receiveidx);
	dao.close();

	request.setAttribute("messageList", messageList);
	request.setAttribute("myIdx", sendidx);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=550px;">
	<title>쪽지창</title>

	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		  integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4RZxV9P3zVXlYubF5aX0E9C9aTlaedqK"
		  crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
			crossorigin="anonymous"></script>

	<link rel="stylesheet" href="./css/style-jieun.css">
</head>

<body style="background-image: url('./img/background.png');">
<div class="chat who">부적절한 대화는 제재 당할 수 있습니다.</div>

<!-- 채팅창 -->
<div class="chat-display">
	<ul>
		<c:forEach var="msg" items="${messageList}">
			<li class="Message ${msg.sendIdx == myIdx ? 'my' : 'you'}"
				style="${msg.sendIdx == myIdx ? 'float:right;' : ''}">
					${msg.mContent}
			</li>
		</c:forEach>
	</ul>
</div>

<!-- 채팅 입력 -->
<form name="messageFrm" method="post" action="./MessageChatProcess/sendMessage.jsp" onsubmit="return validateForm(this);">
	<div class="chat input">
		<input type="text" class="input-chatbox" name="content" id="content" placeholder="최대 500자">
		<input type="hidden" name="receive_idx" value="<%= receiveidx %>">
		<input type="hidden" name="receive_nickname" value="<%= receive_nickname %>">
		<button type="submit" class="chat-btn btnFade btnOrange" style="margin: 0;">보내기</button>
	</div>
</form>

<script>
	function validateForm(form) {
		if (!form.content.value.trim()) {
			alert("메시지를 입력해주세요.");
			form.content.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>
