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
 * Servlet implementation class FreeboardListServlet
 */
@WebServlet("/freeboardlist.do")
public class FreeboardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;

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
		List<FreeboardVO> volist = new ArrayList<FreeboardVO>();
		
		int nowpage = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("nowpage") != null) {
			nowpage = Integer.parseInt(request.getParameter("nowpage"));
		}
		
		String searchKeyCode = request.getParameter("searchKeyCode");
		String searchKeyWord = request.getParameter("searchKeyWord");
		
		int totalarticlelistcnt = dao.getTotalArticleListCount(searchKeyCode, searchKeyWord);
		volist = dao.getTotalArticleList(nowpage, limit, searchKeyCode, searchKeyWord);
		
		int totalpage = 0;
		
		if(totalarticlelistcnt % limit == 0) {
			totalpage = totalarticlelistcnt / limit;
			Math.floor(totalpage);
		} else {
			totalpage = totalarticlelistcnt / limit;
			Math.floor(totalpage);
			totalpage = totalpage + 1;
		}
		
		request.setAttribute("nowpage", nowpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("totalarticlelistcnt", totalarticlelistcnt);
		request.setAttribute("volist", volist);
		request.setAttribute("searchKeyCode", searchKeyCode);
		request.setAttribute("searchKeyWord", searchKeyWord);
		
		RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_list.jsp");
		rd.forward(request, response);
	}

}
