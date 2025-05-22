package com.example.demo.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.board.report.ReportDAO;
import com.example.demo.board.report.ReportDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Page/MemberManagement.do")

public class MemberManagementController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/**** 전체 회원 조회 테이블 *****/
		MemberDAO dao = new MemberDAO();
		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");

		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}

		List<MemberDTO> memberList = dao.AllMemberListPage(map);
		dao.close();

		req.setAttribute("memberList", memberList);
		req.setAttribute("map", map);

		// ******************* 신고테이블***************************///
		ReportDAO reportDao = new ReportDAO();

		Map<String, Object> reportMap = new HashMap<String, Object>();

		String reportSearchField = req.getParameter("reportSearchField");
		String reportSearchWord = req.getParameter("reportSearchWord");

		if (reportSearchWord != null) {
			reportMap.put("reportSearchField", reportSearchField);
			reportMap.put("reportSearchWord", reportSearchWord);
		}

		List<ReportDTO> reportList = reportDao.AllReport(reportMap);
		reportDao.close();

		req.setAttribute("reportList", reportList);
		req.setAttribute("reportMap", reportMap);
		req.getRequestDispatcher("../Page/MemberManagement.jsp").forward(req, resp);
	}
}