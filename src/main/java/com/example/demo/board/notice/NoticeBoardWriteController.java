package com.example.demo.board.notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class NoticeBoardWriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public NoticeBoardWriteController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Page/Noticeboard_write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	 

	
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setN_title(req.getParameter("title"));
		dto.setN_content(req.getParameter("contents"));

		NoticeBoardDAO dao = new NoticeBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		if (result == 1) {
			resp.sendRedirect("../Page/list.do");
		} else {
			resp.sendRedirect("../Page/NoticeBoardWrite.do");
		}
	}

}