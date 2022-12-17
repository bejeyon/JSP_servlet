package sec01.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_address = request.getParameter("user_address");	// <hidden> 태그로 전송된 값을 getParameter() 메서드를 이용해 가져옴.
		String user_email = request.getParameter("user_email");	// <hidden> 태그로 전송된 값을 getParameter() 메서드를 이용해 가져옴.
		String user_phone = request.getParameter("user_phone");	// <hidden> 태그로 전송된 값을 getParameter() 메서드를 이용해 가져옴.
		
		String data = "<html><body>";
		data += "안녕하세요!<br>로그인하셨습니다.<br><br>";
		data += "아이디 : " + user_id;
		data += "<br>";
		data += "패스워드 : " + user_pw;
		data += "<br>";
		data += "주소 : " + user_address;
		data += "<br>";
		data += "email : " + user_email;
		data += "<br>";
		data += "휴대전화 : " + user_phone;
		data += "<br>";
		printwriter.print(data);
		
		user_address = URLEncoder.encode(user_address, "utf-8");	// GET 방식으로 한글을 전송하기 위해 인코딩
		// <a> 태그를 이용해 링크 클릭 시 서블릿 /second로 다시 로그인 정보를 전송
		printwriter.print("<a href='/_pro09/second?user_id=" + user_id + "&user_pw=" + user_pw + "&user_address=" + user_address + "'>두 번째 서블릿으로 보내기</a>");
		data = "</body></html>";
		printwriter.print(data);
	}

}