package usermadang.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import usermadang.board.model.FreeboardDAO;
import usermadang.board.model.FreeboardVO;

/**
 * Servlet implementation class FreeboardWriteActionServlet
 */
@WebServlet("/freeboardProc.do")
public class FreeboardWriteActionServlet extends HttpServlet {
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
		
		FreeboardVO vo = new FreeboardVO();
		vo.setTitle(request.getParameter("freeBoardVO.title"));
		vo.setContent(request.getParameter("freeBoardVO.contents"));
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");
		vo.setMember_id(sessionId);
		String member_name = dao.getLoginNameById(sessionId);
		vo.setMember_name(request.getParameter(member_name));
		
		dao.insertArticle(vo);
		
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("searchKeyCode", searchKeyCode);
		request.setAttribute("searchKeyWord", searchKeyWord);
		
		RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_list.jsp");
		rd.forward(request, response);
	}

}
