package sec03.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionTest2
 */
@WebServlet("/sessionTest2")
public class SessionTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		HttpSession session = request.getSession();
		
		printwriter.println("<html><body>");
		printwriter.println("세션 아이디 : " + session.getId() + "<br>");
		printwriter.println("최초 세션 생성 시각 : " + new Date(session.getCreationTime()) + "<br>");
		printwriter.println("최초 세션 접근 시각 : " + new Date(session.getLastAccessedTime()) + "<br>");
		printwriter.println("기본 세션 유효 시간 : " + session.getMaxInactiveInterval() + "<br>");	// 톰캣의 기본 세션 유효 시간을 출력.
		session.setMaxInactiveInterval(5);	// 세션의 유효 시간을 5초로 설정.
		printwriter.println("세션 유효 시간 : " + session.getMaxInactiveInterval() + "<br>");	// 유효 시간을 재설정한 후 세션 유효 시간을 출력.

		if (session.isNew()) {
			printwriter.println("새 세션이 만들어졌습니다.");
		}
		printwriter.println("</body></html>");
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
