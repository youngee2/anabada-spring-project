<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.demo.board.comment.CommentDTO"%>
<%@ page import="com.example.demo.board.comment.CommentDAO"%>
<%
request.setCharacterEncoding("UTF-8");

String content = request.getParameter("comm_contents");
String nickname = (String) session.getAttribute("Nickname");
int idx = (int)session.getAttribute("Idx");
int titleNum = Integer.parseInt(request.getParameter("title_num"));


int board_num = 2;
CommentDTO dto = new CommentDTO();
dto.setComm(content);
dto.setTitle_num(titleNum);
dto.setNickname(nickname);
dto.setIdx(idx);
dto.setBoard_num(board_num);
CommentDAO dao = new CommentDAO(application);
int result = dao.free_commentWrite(dto);
dao.close();
if (nickname == null) {
    out.println("<script>alert('경고'); location.href='some.jsp';</script>");
   return;
}
if(result == 1){
	response.sendRedirect("../freeboard_read.jsp?free_num="+titleNum);
}
%>