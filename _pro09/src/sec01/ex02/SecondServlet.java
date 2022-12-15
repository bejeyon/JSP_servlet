package sec01.ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecondServlet
 */
@WebServlet("/second")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		String user_id = request.getParameter("user_id");	// 첫 번째 서블릿에서 전송한 로그인 정보를 가져옴.
		String user_pw = request.getParameter("user_pw");	// 첫 번째 서블릿에서 전송한 로그인 정보를 가져옴.
		String user_address = request.getParameter("user_address");	// 첫 번째 서블릿에서 전송한 로그인 정보를 가져옴.
		
		printwriter.println("<html><body>");
		
		if (user_id != null && user_id.length() != 0) {	// 첫 번째 서블릿의 ID 정보를 이용해 로그인 상태를 유지.
			printwriter.println("이미 로그인 상태입니다!<br><br>");
			printwriter.println("첫 번째 서블릿에서 넘겨준 아이디 : " + user_id + "<br>");
			printwriter.println("첫 번째 서블릿에서 넘겨준 비밀번호 : " + user_pw + "<br>");
			printwriter.println("첫 번째 서블릿에서 넘겨준 주소 : " + user_address + "<br>");
			printwriter.println("</body></html>");
		} else {	// 로그인창을 거치지 않고 바로 요청한 경우에는 로그인창으로 다시 이동하도록 안내.
			printwriter.println("로그인 하지 않았습니다.<br><br>");
			printwriter.println("다시 로그인하세요!!<br>");
			printwriter.println("<a href='/_pro09/login.html'>로그인창으로 이동하기</a>");
			printwriter.println("</body></html>");
		}
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
