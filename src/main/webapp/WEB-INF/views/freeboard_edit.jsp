<%@ page import="com.example.demo.board.free.FreeBoardDAO" %>
<%@ page import="com.example.demo.board.free.FreeBoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String free_num = request.getParameter("free_num");
FreeBoardDAO dao = new FreeBoardDAO();
FreeBoardDTO dto = dao.selectViewEdit(free_num);
String sessionId = session.getAttribute("Nickname").toString();
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>                     
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/Freeboard_style.css">
        <title>free_board_write</title>  

<script type="text/javascript">
function validateForm(form){
	if(form.title.value==""){
		alert("제목을 입력하세요.");x
		form.title.focus();
		return false;
	}
	if(form.contents.value==""){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
}
</script>

</head>
    <body style="margin:0;">
    	<section style="margin: 0% 15% 15% 15%">
    <h2 class="free_title">자유게시판 게시글 수정</h2>
    <hr>
    <main role="main" class="container1">
    <form name="writeFrm" method="post" action="../Page/SellEditDelete/FreeEditProcess.jsp" onsubmit="return validateForm(this);" >
	<input type="hidden" name="free_num" value="<%=dto.getFree_num() %>" />
        <div class="pt-1"></div>
      </div>
      <input type="text" name="title" placeholder="제목을 입력하세요" class="freeboard_write_title" value="<%= dto.getFree_title() %>"/>
                <div class="pt-1">
                    <textarea id="summernote" name="contents"><%= dto.getFree_contents() %></textarea>
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
                    <button class="write_btn" type="button" onclick="location.href='../Page/freeListPage.do' ">목록</button>
                </div>    
            </form>
           
        </main> 
    	</section>
    		<%@ include file="./HeaderFooter/Footer.jsp"%>
    </body>
</html>