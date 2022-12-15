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
 * Servlet implementation class CalcServlet
 */
@WebServlet("/calc")
public class CalcServlet extends HttpServlet {

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
		String command = request.getParameter("command");	// 수행할 요청을 받아옴.
		String won = request.getParameter("won");	// 변환할 원화를 받아옴.
		String operator = request.getParameter("operator");	// 변환할 외화 종류를 받아옴.
		
		// 최초 요청 시 command가 null이면 계산기 화면을 출력하고, command값이 calculate이면 계산 결과를 출력.
		if (command != null && command.equals("calculate")) {
			String result = calculate(Float.parseFloat(won), operator);
			printwriter.print("<html><font size=10>변환 결과</font><br>");
			printwriter.print("<html><font size=10>" + result + "</font><br>");
			printwriter.print("<a href='/_pro06/calc'>환율 계산기</a>");
			return;
		}
		
		printwriter.print("<html><title>환율 계산기</title>");
		printwriter.print("<font size=5>환율 계산기</font><br>");
		printwriter.print("<form name='frmCalc' method='get' action='/_pro06/calc'	/>	");	// 원화 입력 후 다시 서블릿 calc로 요청.
		printwriter.print("원화 : <input type='text' name='won' size=10	/>	");
		printwriter.print("<select name='operator'	>");	// 셀렉트 박스에서 선택된 값을 name으로 전송.
		printwriter.print("<option value='dollar'>달러</option>");
		printwriter.print("<option value='en'>엔화</option>");
		printwriter.print("<option value='wian'>위안</option>");
		printwriter.print("<option value='pound'>파운드</option>");
		printwriter.print("<option value='euro'>유로</option>");
		printwriter.print("</select>");
		printwriter.print("<input type='hidden' name='command' value='calculate'	/>");	// <hidden> 태그를 이용해 계산기에서 서블릿으로 수행할 요청을 전달.
		printwriter.print("<input type='submit' value='변환'	/>");
		printwriter.print("</form>");
		printwriter.print("</html>");
		printwriter.close();
	}
	
	private static String calculate(float won, String operator) {	// 원화를 선택한 외화로 환산
		String result = null;
		if (operator.equals("dollar")) {
			result = String.format("%.6f", won / 1295.00);
		} else if (operator.equals("en")) {
			result = String.format("%.6f", won / 9.56);
		} else if (operator.equals("wian")) {
			result = String.format("%.6f", won / 186.03);
		} else if (operator.equals("pound")) {
			result = String.format("%.6f", won / 1601.64);
		} else if (operator.equals("euro")) {
			result = String.format("%.6f", won / 1377.75);
		}
		return result;
	}

//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
