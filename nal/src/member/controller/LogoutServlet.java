/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그아웃 서블릿
@WebServlet("/logout.do")
public class LogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	// /logout.do로 로그아웃 요청 시 회원정보가 저장된 session 값을 전부 초기화
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(); 
		// session 객체의 invalidate()메소드를 통해 설정되어 있는 세션 속성을 모두 제거해 인증된 사용자의 인증을 무효화
		session.invalidate();
		
		// 로그인 페이지인 login.jsp로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp"); 
		dispatcher.forward(request, response);
	}
	
	// post 방식으로 요청이 올 경우 doGet()으로 넘김
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
