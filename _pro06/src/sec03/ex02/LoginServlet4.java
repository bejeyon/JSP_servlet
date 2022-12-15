package sec03.ex02;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet4
 */
@WebServlet("/login4")
public class LoginServlet4 extends HttpServlet {

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
		System.out.println("doGet 메서드 호출");
		doHandle(request, response);	// GET 방식으로 요청 시 다시 doHandle()을 호출.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		doHandle(request, response);	// POST 방식으로 요청 시 다시 doHandle()을 호출.
	}
	
	// 모든 호출 방식에 대해 처리할 수 있음.
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	// 전송된 데이터를 utf-8로 인코딩.
		String user_id = request.getParameter("user_id");	// getParameter()를 이용해 <input> 태그의 name 속성 값으로 전송된 value를 받아옴.
		String user_pw = request.getParameter("user_pw");	// getParameter()를 이용해 <input> 태그의 name 속성 값으로 전송된 value를 받아옴.
		System.out.println("doHandle 메서드 호출");
		System.out.println("아이디 : " + user_id);
		System.out.println("비밀번호 : " + user_pw);
	}
}
