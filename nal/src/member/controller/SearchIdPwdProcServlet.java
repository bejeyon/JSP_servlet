/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 아이디 찾기 성공 시 찾은 아이디를 보여주는 서블릿
@WebServlet("/searchIdPwdProc.do")
public class SearchIdPwdProcServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 찾은 member_id를 불러옴
		String member_id = request.getParameter("member_id");
		
		// member_id 값을 갖고 member/searchIdPwdProc.jsp로 포워딩
		request.setAttribute("member_id", member_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/searchIdPwdProc.jsp");
		dispatcher.forward(request, response);
	}
}
