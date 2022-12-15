package sec02.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet2
 */
@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {

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
	// 응답은 HttpServletResponse 객체를 이용.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	// 웹 브라우저에서 전송된 데이터의 인코딩을 설정.
		response.setContentType("text/html;charset=utf-8");	// setContentType()을 이용해 응답할 데이터 종류가 HTML임을 설정.
		PrintWriter printwriter = response.getWriter();	// HttpServletResponse 객체의 getWriter()를 이용해 출력 스트림 PrintWriter 객체를 받아옴.
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		String data = "<html>";	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "<body>";	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "아이디 : " + id;	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "<br>";	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "패스워드 : " + pw;	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "</body>";	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		data += "</html>";	// 브라우저로 출력할 데이터를 문자열로 연결해서 HTML 태그로 만듦.
		printwriter.print(data);	// PrintWriter의 print()를 이용해 HTML 태그 문자열을 웹브라우저로 출력
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
