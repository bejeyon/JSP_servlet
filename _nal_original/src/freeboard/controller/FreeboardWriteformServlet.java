package freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.model.FreeboardDAO;
import freeboard.model.FreeboardVO;

/**
 * Servlet implementation class FreeboardWriteformServlet
 */
@WebServlet("/freeBoardForm.do")
public class FreeboardWriteformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		FreeboardDAO dao = FreeboardDAO.getInstance();
		
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		
		String searchKeyCode = request.getParameter("searchKeyCode");
		String searchKeyWord = request.getParameter("searchKeyWord");
		
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("searchKeyCode", searchKeyCode);
		request.setAttribute("searchKeyWord", searchKeyWord);
		
		RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_writeform.jsp");
		rd.forward(request, response);
	}

}
