package com.example.demo.board.notice;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/notice/NoticeView.do")
public class NoticeBoardViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public NoticeBoardViewController() {
		super();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	NoticeBoardDAO dao = new NoticeBoardDAO();
	String n_num = req.getParameter("n_num");
	dao.updateVisitCount(n_num);
	NoticeBoardDTO dto = dao.selectView(n_num);
	dao.close();
	
	
	req.setAttribute("dto", dto);
	req.getRequestDispatcher("/Page/NoticeBoard_read.jsp").forward(req, resp);
	}


	

}
