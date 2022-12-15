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
 * Servlet implementation class GuguTest
 */
@WebServlet("/guguTest")
public class GuguTest extends HttpServlet {

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
		request.setCharacterEncoding("utf-8");	// 웹 브라우저에서 전송된 데이터의 인코딩을 설정.
		response.setContentType("text/html; charset=utf-8");	// setContentType()을 이용해 응답할 데이터 종류가 HTML임을 설정.
		PrintWriter printwriter = response.getWriter();	// HttpServletResponse 객체의 getWriter()를 이용해 출력 스트림 PrintWriter 객체를 받아옴.
		int dan = Integer.parseInt(request.getParameter("dan"));	// 전송된 dan의 값을 받아옴.
		
//		printwriter.print("<html>");
//		printwriter.print("<body>");
		printwriter.print("<table border=1 width=800 align=center>");
		printwriter.print("<tr align=center bgcolor='#FFFF66'>");
		printwriter.print("<td colspan=2>" + dan + "단 출력 </td>");
		printwriter.print("</tr>");
		for (int i = 1; i < 10; i++) {	// for문을 이용해 연속해서 결과를 테이블 행으로 출력.
			printwriter.print("<tr align=center>");
			printwriter.print("<td width=400>");
			printwriter.print(dan + " * " + i);
			printwriter.print("</td>");
			printwriter.print("<td width=400>");
			printwriter.print(i * dan);
			printwriter.print("</td>");
			printwriter.print("</tr>");
		}
		printwriter.print("</table>");
//		printwriter.print("</body>");
//		printwriter.print("</html>");
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}

}
