package sec04.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginTest
 */
@WebServlet("/loginTest")
public class LoginTest extends HttpServlet {

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

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	// 웹 브라우저에서 전송된 데이터의 인코딩을 설정.
		response.setContentType("text/html;charset=utf-8");	// setContentType()을 이용해 응답할 데이터 종류가 HTML임을 설정.
		PrintWriter printwriter = response.getWriter();	// HttpServletResponse 객체의 getWriter()를 이용해 출력 스트림 PrintWriter 객체를 받아옴.
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");

		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pw);
		
		if(id!=null && (id.length()!=0)) {
			printwriter.print("<html>");
			printwriter.print("<body>");
			printwriter.print( id + " 님!! 로그인 하셨습니다." );
			printwriter.print("</body>");
			printwriter.print("</html>");
		} else {	// ID와 비밀번호가 없으면 다시 로그인창으로 이동.
			printwriter.print("<html>");
			printwriter.print("<body>");
			printwriter.print( "아이디를 입력하세요!!!" );
			printwriter.print("<a href='http://localhost:8080/_pro06/test01/login.html'> 로그인 창으로 이동 </a>");
			printwriter.print("</body>");
			printwriter.print("</html>");
		}
	}

}
