<%@ page import="com.example.demo.board.notice.NoticeBoardDAO" %>
<%@ page import="com.example.demo.board.notice.NoticeBoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");

    String n_num = request.getParameter("n_num");
    NoticeBoardDAO dao = new NoticeBoardDAO();
    NoticeBoardDTO dto = dao.selectView(n_num);

    String userId = (String) session.getAttribute("UserId");
    if (userId == null || !"admin".equals(userId)) {
        dao.close();
        response.sendRedirect("tradeListPage.do?category=7");
        return;
    }
    dao.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/Freeboard_style.css">
    <link rel="stylesheet" href="./css/HeaderFooter.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css">

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <script type="text/javascript">
        function validateForm(form){
            if(form.title.value.trim() === ""){
                alert("제목을 입력하세요.");
                form.title.focus();
                return false;
            }
            if(form.contents.value.trim() === ""){
                alert("내용을 입력하세요.");
                form.contents.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body style="margin:0;">
<section style="margin: 0% 15% 15% 15%">
    <h2 class="free_title">공지사항 수정</h2>
    <hr>

    <main role="main" class="container1">
        <form name="writeFrm" method="post" action="../Page/SellEditDelete/NoticeEditProcess.jsp" onsubmit="return validateForm(this);">
            <input type="hidden" name="n_num" value="<%= dto.getN_num() %>" />

            <div class="pt-1"></div>
            <input type="text" name="title" placeholder="제목을 입력하세요" class="freeboard_write_title" value="<%= dto.getN_title() %>" />

            <div class="pt-1">
                <textarea id="summernote" name="contents"><%= dto.getN_content() %></textarea>
            </div>

            <script>
                $('#summernote').summernote({
                    placeholder: '내용을 입력해주세요',
                    tabsize: 2,
                    height: 500
                });
            </script>

            <div class="pt-1 text-right">
                <button class="write_btn" type="submit">작성 완료</button>
                <button class="write_btn" type="button" onclick="location.href='../Page/list.do'">목록</button>
            </div>
        </form>
    </main>
</section>

<%@ include file="./HeaderFooter/Footer.jsp" %>
</body>
</html>
