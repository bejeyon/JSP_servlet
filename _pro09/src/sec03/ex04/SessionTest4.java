package sec03.ex04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionTest4
 */
@WebServlet("/sessionTest4_login")
public class SessionTest4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public SessionTest4() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Servlet#init(ServletConfig)
//	 */
//	public void init(ServletConfig config) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see Servlet#destroy()
//	 */
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		HttpSession session = request.getSession();
		
		// 로그인창에서 전송된 ID와 비밀번호를 가져옴.
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		if (session.isNew()) {	// 최초 요청 시 수행.
			// 로그인창에서 서블릿으로 요청했다면 ID가 null이 아니므로 세션에 ID를 바인딩.
			if (user_id != null) {
				session.setAttribute("user_id", user_id);
				printWriter.println("<a href='sessionTest4_login'>로그인 상태 확인</a>");
			} else {
				printWriter.println("<a href='login2.htm.'>다시 로그인 하세요!!</a>");
				session.invalidate();
			}
		} else {	// 재요청 시 세션에서 ID를 가져와 이전에 로그인했는지 여부를 확인.
			user_id = (String) session.getAttribute("user_id");
			
			if (user_id != null && user_id.length() != 0) {
				printWriter.println("안녕하세요 " + user_id + "님!!!");
			} else {
				printWriter.println("<a href='login2.htm.'>다시 로그인 하세요!!</a>");
				session.invalidate();
			}
		}
	}

}
