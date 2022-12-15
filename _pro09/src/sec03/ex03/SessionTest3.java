package sec03.ex03;

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
 * Servlet implementation class SessionTest3
 */
@WebServlet("/sessionTest3")
public class SessionTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public SessionTest3() {
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

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		HttpSession session = request.getSession();	// getSession()을 호출하여 최초 요청 시 세션 객체를 새로 생성하거나 기존 세션을 반환.
		
		printwriter.println("<html><body>");
		printwriter.println("세션 아이디 : " + session.getId() + "<br>");	// 생성된 세션 객체의 id를 가져옴.
		printwriter.println("최초 세션 생성 시각 : " + new Date(session.getCreationTime()) + "<br>");	// 최초 세션 객체 생성 시간을 가져옴.
		printwriter.println("최초 세션 접근 시각 : " + new Date(session.getLastAccessedTime()) + "<br>");	// 세션 객체에 가장 최근에 접근한 시간을 가져옴.
		printwriter.println("세션 유효 시간 : " + session.getMaxInactiveInterval() + "<br>");	// 세션 객체의 유효 시간을 가져옴.
		// 최초 생성된 세션인지 판별.
		if (session.isNew()) {
			printwriter.println("새 세션이 만들어졌습니다.");
		}
		printwriter.println("</body></html>");
		session.invalidate();	// invalidate()를 호출하여 생성된 세션 객체를 강제로 삭제.
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
