<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");
    String user_id = (String) session.getAttribute("UserId");
    System.out.println(user_id + " 확인");

    if (user_id == null || !"admin".equals(user_id)) {
        response.sendRedirect("tradeListPage.do?category=7");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
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
    <h2 class="free_title">공지사항 작성</h2>
    <hr>

    <main role="main" class="container1">
        <form name="writeFrm" method="post" action="../Page/NoticeBoardWrite.do" onsubmit="return validateForm(this);">
            <div class="pt-1"></div>
            <input type="text" name="title" placeholder="제목을 입력하세요" class="freeboard_write_title" maxlength="30">

            <div class="pt-1">
                <textarea id="summernote" name="contents"></textarea>
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
