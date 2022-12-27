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

// 아이디를 찾은 후 비밀번호 변경 버튼을 바로 누를 경우, 찾은 아이디 값을 저장한채 다음 페이지로 넘겨주는 서블릿
@WebServlet("/SearchPwdServlet")
public class SearchPwdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	// get 방식으로 비밀번호 변경 요청 시 앞 페이지에서 찾은 member_id를 세션에 저장
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String member_id=null;		
		member_id = request.getParameter("member_id");
		
		// session 객체 생성
		HttpSession session = request.getSession();
		// session에 앞의 페이지에서 찾은 member_id 저장
		session.setAttribute("member_id", member_id);
		
		// System.out.println("SearchPwdServlet member_id: "+member_id);
		
		// member/changePwdForm.jsp 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changePwdForm.jsp");
		dispatcher.forward(request, response);
	}

}
