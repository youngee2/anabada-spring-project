package com.example.demo.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Page/ManageSignOut.do")
public class ManageSignOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");

		MemberDAO dao = new MemberDAO();
		int result = dao.manageSignOut(user_id);
		dao.close();

		if (result == 1) {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 탈퇴 성공");
		} else { 
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 탈퇴 성공");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
