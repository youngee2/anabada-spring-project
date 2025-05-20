package com.example.demo.board.trade;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.demo.board.trade.*;

@WebServlet("/Page/sellWrite.do")
public class WriteController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("연결1");
		req.getRequestDispatcher("/Page/sellWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("연결2");
		req.setCharacterEncoding("UTF-8");

		SellBoardDTO dto = new SellBoardDTO();

		dto.setSell_title(req.getParameter("sell_title"));
		dto.setSell_contents(req.getParameter("sell_contents"));
		dto.setSell_price(Integer.parseInt("sell_price"));

		SellBoardDAO dao = new SellBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		System.out.println(req.getParameter("sell_title"));
		if (result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}

		doGet(req, resp);
		req.getRequestDispatcher("/Page/tradeListPage.do").forward(req, resp);
	}

}
