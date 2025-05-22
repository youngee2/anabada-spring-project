package com.example.demo.board.report;

import java.io.IOException;

import jakarta.servlet.*;


import com.example.demo.member.MemberDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Page/deleteReport.do")
public class ManageDeleteReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reportedNickname = req.getParameter("reportedNickname");
		String reporterNickname = req.getParameter("reporterNickname");
		String reason = req.getParameter("reason");

		ReportDAO dao = new ReportDAO();
		int result = dao.deleteReport(reportedNickname, reporterNickname, reason);
		dao.close();

		// 총 신고수 업데이트
		MemberDAO totaldao = new MemberDAO();
		totaldao.totalReportCount(reportedNickname,reportedNickname );
		totaldao.close();

		if (result == 1) {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 신고 내역 삭제 완료");
		} else {
			req.getRequestDispatcher("MemberManagement.do").forward(req, resp);
			System.out.println("관리자 권한 신고 내역 삭제 실패");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
