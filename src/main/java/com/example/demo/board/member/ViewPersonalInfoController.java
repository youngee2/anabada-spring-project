package com.example.demo.board.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Page/PersonalInformation.do")
public class ViewPersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");
		 
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.PersonalInfo(user_id);
		dao.close();

		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../Page/PersonalInformation.jsp").forward(req, resp);
	}

}
